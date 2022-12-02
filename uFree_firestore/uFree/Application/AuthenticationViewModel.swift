//
//  AuthenticationViewModel.swift
//  uFree
//
//  Created by Leung Wai Liu on 11/20/22.
//

// source: from Google's Getting Started with Firebase


import Foundation
import Firebase
import FirebaseFirestore
import FirebaseAuth

enum AuthenticationState {
    case unauthenticated
    case authenticating
    case authenticated
}

@MainActor
class AuthenticationViewModel: ObservableObject {
    // Name and email to keep during the whole process
    @Published var user: User?
    @Published var configuredDefaults: Bool = false
    
    @Published var savedName: String = ""
    @Published var savedEmail: String = ""
    @Published var savedUserDefaultHours: [Int] = []
    @Published var savedUserEvents: [[String: Any]] = [["title":"null"]]
    
    // Used during the registration process
    @Published var tempUser: User?
    @Published var inputName: String = ""
    @Published var inputEmail: String = ""
    @Published var inputPassword: String = ""
    @Published var inputConfirmPassword: String = ""
    
    @Published var inputTitle = "New Event"
    @Published var inputInvitee = ""
    @Published var inputUserDefaultHours: [Int] = []
    
    // Authentication States
    @Published var authenticationState: AuthenticationState = .unauthenticated
    
    @Published var errorMessage: String = ""
    @Published var displayName: String = ""
    
    init() {
        //registerAuthStateHandler()
        
        user = Auth.auth().currentUser
        
        if (user != nil) {
            Task {
                do {
                    try await getEventsFromFirestore()
                }
                catch {
                    errorMessage = "DEBUG: No user found."
                }
                
            }
        }
    }
    
    
    
    private func wait() async {
        do {
            print("Wait")
            try await Task.sleep(nanoseconds: 1_000_000_000)
            print("Done")
        }
        catch { }
    }
    
}

// MARK: - Email and Password Authentication
extension AuthenticationViewModel {
    func signInWithEmailPassword() async -> Bool {
        
        do {
            let authResult = try await Auth.auth().signIn(withEmail: inputEmail, password: inputPassword)
            user = authResult.user
            inputPassword = ""
            
            // retrieving the user information
            do {
                let fetchUserInfoResult = try await Firestore.firestore().collection("users").document(user!.uid).getDocument()
                let fetchedUserDocument = fetchUserInfoResult.data()!
                savedName = fetchedUserDocument["name"] as! String
                savedEmail = fetchedUserDocument["email"] as! String
                savedUserDefaultHours = fetchedUserDocument["defaultHours"] as! [Int]
                inputUserDefaultHours = fetchedUserDocument["defaultHours"] as! [Int]
                savedUserEvents = fetchedUserDocument["events"] as! [[String: Any]]
                configuredDefaults = true
            }
            catch {
                errorMessage = error.localizedDescription
                print("DEBUG: Failed to retrieve user info \(errorMessage)")
                return false
                
            }
            
            print("User \(authResult.user.uid) signed in with information properly loaded")
            return true
            
        }
        catch {
            print(error)
            errorMessage = error.localizedDescription
            return false
        }
    }
    
    
    func addUserToFirestore() async -> Bool {
        
        if inputPassword != inputConfirmPassword {
            errorMessage = "Password fields do not match"
            return false
        }
        
        savedName = inputName
        savedEmail = inputEmail
        
        do {
            let authResult = try await Auth.auth().createUser(withEmail: inputEmail, password: inputPassword)
            tempUser = authResult.user
            
            print("User \(authResult.user.uid) signed in")
            return true
            
        }
        catch {
            print(error)
            savedName = ""
            savedEmail = ""
            errorMessage = error.localizedDescription
            return false
        }
    }
    
    func registerUserInfoToFirestore() async -> Bool {
        print("SAVED NAME \(savedName)")
        print("SAVED EMAIL \(savedEmail)")
        let data:[String:Any] = ["uid": tempUser!.uid, "email": savedEmail, "name": savedName, "defaultHours": savedUserDefaultHours, "events": [["title": "null"]]]
        inputUserDefaultHours = savedUserDefaultHours
        do {
            try await Firestore.firestore().collection("users").document(tempUser!.uid).setData(data)
            print("DEBUG: Successfully uploaded user configuration data")
            configuredDefaults = true
            user = tempUser
            return true
        }
        catch {
            print("DEBUG: DID NOT successfully upload user configuration data")
            errorMessage = error.localizedDescription
            return false
        }
    }
    
    func getEventsFromFirestore() async -> Bool {
        
        do {
            let fetchUserInfoResult = try await Firestore.firestore().collection("users").document(user!.uid).getDocument()
            let fetchedUserDocument = fetchUserInfoResult.data()!
            savedName = fetchedUserDocument["name"] as! String
            savedEmail = fetchedUserDocument["email"] as! String
            savedUserDefaultHours = fetchedUserDocument["defaultHours"] as! [Int]
            inputUserDefaultHours = fetchedUserDocument["defaultHours"] as! [Int]
            savedUserEvents = fetchedUserDocument["events"] as! [[String: Any]]
            configuredDefaults = true
            return true
        }
        catch {
            errorMessage = error.localizedDescription
            print("DEBUG: Failed to retrieve user info \(errorMessage)")
            return false
        }
    }
    
    func addNewEventToFirestore() async -> Bool {
        print("ADDING NEW EVENT")
        errorMessage = ""
        
        var needsSharing = false
        var inviteeUID = ""
        var inviteeEvents: NSMutableArray = [["title" : "null"]]
        var participants = [user!.uid]
        
        if inputInvitee != "" {
            do {
                let allUsersRecord = try await Firestore.firestore().collection("users").getDocuments()
                
                for userDocument in allUsersRecord.documents {
                    let userEmail = userDocument.get("email") as? String
                    
                    if userEmail == inputInvitee {
                        needsSharing = true
                        inviteeUID = userDocument.get("uid") as! String
                        participants.append(inviteeUID)
                        inviteeEvents = userDocument.get("events") as! NSMutableArray
                    }
                }
                
                if needsSharing == false {
                    errorMessage = "Invitee not an existing user. Please try again"
                    inputInvitee = ""
                    print("DEBUG: \(errorMessage)")
                    return false
                }
            }
            catch {
                errorMessage = error.localizedDescription
                print("DEBUG: Unable to find all users: \(errorMessage)")
                inputInvitee = ""
                return false
            }
        }
        
        do {
            let userInformationDocument = try await Firestore.firestore().collection("users").document(user!.uid).getDocument()
            let currentUserExistingEvents = userInformationDocument.data()!["events"] as! NSMutableArray
            print("EXISTING EVENTS: \(currentUserExistingEvents)")
            
            let UUIDValue = UUID().uuidString
            
            
            
            let newEventCurrentUser:[String: Any] = ["id": UUIDValue, "title" : inputTitle, "participants" : participants, "shared" : needsSharing, "confirmed" : true, "everyoneConfirmed": !needsSharing, "allUserHours" : savedUserDefaultHours]
            let newEventInvitee:[String: Any] = ["id" : UUIDValue, "title" : inputTitle, "participants" : participants, "shared" : needsSharing, "confirmed" : false, "everyoneConfirmed": false, "allUserHours" : savedUserDefaultHours]
            
            currentUserExistingEvents.add(newEventCurrentUser)
            let data:[String:Any] = ["uid": user!.uid, "email": savedEmail, "name": savedName, "defaultHours": savedUserDefaultHours, "events": currentUserExistingEvents]
            
            do {
                try await Firestore.firestore().collection("users").document(user!.uid).setData(data)
                
                if needsSharing {
                    inviteeEvents.add(newEventInvitee)
                    do {
                        try await Firestore.firestore().collection("users").document(inviteeUID).setData(["events": inviteeEvents], merge: true)
                    }
                    catch {
                        errorMessage = "DEBUG: Unable to add enw event for invitee"
                        print(errorMessage)
                        return false
                    }
                    
                    
                }
                
                if await getEventsFromFirestore() == true {
                    print("DEBUG: EVENT CREATION, SHARING, HOME PAGE REFRESH SUCCESS")
                    return true
                }
                
            }
            catch {
                errorMessage = "DEBUG: Unable to add new event for current user."
                print(errorMessage)
                return false
            }
            
            
        }
        catch {
            errorMessage = error.localizedDescription
            print("DEBUG: Unable to get current user events: \(errorMessage)")
            return false
        }
        
        return false
    }
    
    func addInviteeAvailabilityToEvent(eventToAddTo: [String: Any]) async -> Bool {
        
        var existingSavedUserDefaultHours: [[Int]] = eventToAddTo["allUserHours"] as! [[Int]]
        existingSavedUserDefaultHours.append(inputUserDefaultHours)
        
        var toUpdateEventToAddTo = eventToAddTo
        
        toUpdateEventToAddTo["allUserHours"] = existingSavedUserDefaultHours
        toUpdateEventToAddTo["confirmed"] = true
        
        let eventID = toUpdateEventToAddTo["id"] as! String
        let participantsUIDArray = toUpdateEventToAddTo["participants"] as! [String]
        let creatorUID = participantsUIDArray[0]
        
        // since this is in the perspective of the invitee, we have to get the event from the creator and update that first
        do {
            // getting all the events of the creator first
            let creatorDocument = try await Firestore.firestore().collection("users").document(creatorUID).getDocument()
            var allCreatorEvents : [[String : Any]] = creatorDocument.get("events") as! [[String : Any]]
            
            let eventToModifyIndex: Int = allCreatorEvents.firstIndex(where: { $0["id"] as! String == eventID})!
            
            var eventToModify: [String : Any] = allCreatorEvents[eventToModifyIndex]
            
            eventToModify["allUserHours"] = existingSavedUserDefaultHours
            
            allCreatorEvents[eventToModifyIndex] = eventToModify
            
            do {
                try await Firestore.firestore().collection("users").document(creatorUID).updateData(["events" : allCreatorEvents])
                
                do {
                    let inviteeDocument = try await Firestore.firestore().collection("users").document(user!.uid).getDocument()
                    
                    // doing the same for the invitee
                    var allInviteeEvents: [[String : Any]] = inviteeDocument.get("events") as! [[String : Any]]
                    
                    let inviteeEventToModifyIndex: Int = allInviteeEvents.firstIndex(where: { $0["id"] as! String == eventID})!
                    
                    allInviteeEvents[inviteeEventToModifyIndex] = toUpdateEventToAddTo
                    
                    do {
                        try await Firestore.firestore().collection("users").document(creatorUID).updateData(["events" : allInviteeEvents])
                        return true
                    }
                    catch {
                        errorMessage = "Failed to update allUserHours for the current user (invitee)"
                        print("DEBUG \(errorMessage)")
                        return false
                    }
                    
                    
                } catch {
                    errorMessage = "Failed to get documents for existing user (invitee)"
                    print("DEBUG: \(errorMessage)")
                    return false
                }
            }
            catch {
                errorMessage = "Failed to update allUserHours for the event creator"
                print("DEBUG \(errorMessage)")
                return false
            }
            
        }
        catch {
            errorMessage = error.localizedDescription
            print("DEBUG: Failed to get creator information \(errorMessage)")
            return false
        }
        
    }
    
    
    
    func signOut() {
        do {
            savedName = ""
            savedEmail = ""
            savedUserDefaultHours = []
            savedUserEvents = [["title":"null"]]
            
            inputName = ""
            inputTitle = ""
            inputInvitee = ""
            inputPassword = ""
            inputConfirmPassword = ""
            inputUserDefaultHours = []
            
            configuredDefaults = false
            authenticationState = .unauthenticated
            try Auth.auth().signOut()
            print("DEBUG: User SUCCESSFULLY signed out")
            user = nil
            
        }
        catch {
            errorMessage = error.localizedDescription
        }
    }
    
    func deleteAccount() async -> Bool {
        do {
            try await user?.delete()
        }
        catch {
            errorMessage = error.localizedDescription
            return false
        }
        return true
    }
    
}
