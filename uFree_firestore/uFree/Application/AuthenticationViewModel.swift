//
//  AuthenticationViewModel.swift
//  uFree
//
//  Created by Leung Wai Liu on 11/20/22.
//

// source: from Google's Getting Started with Firebase


import Foundation
import SwiftUI
import Firebase
import FirebaseCore
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
    @Published var savedUserEvents: [[String: Any]] = [["eventUID" : "null", "title":"null"]]
    
    // Used during the registration process
    @Published var tempUser: User?
    
    @Published var inputUserDefaultHours: [Int] = []
    
    @Published var inputCommonHours: [Int] = [0]
    @Published var finalizedHour: Int = 0
    
    @Published var selectedTabViewIndex = 0
    
    @Published var allUsersInEvent: [String] = [""]

    
    // Authentication States
    @Published var authenticationState: AuthenticationState = .unauthenticated
    
    @Published var errorMessage: String = ""
    @Published var displayName: String = ""
    
    init() {
        user = Auth.auth().currentUser
        
        if (user != nil) {
            Task {
                do {
                    try await getEventsFromFirestore()
                }
                catch {
                    errorMessage = "DEBUG: No user found."
                    print("DEBUG: \(errorMessage)")
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
    
    func signInWithEmailPassword(inputEmail: String, inputPassword: String) async -> Bool {
        
        do {
            let authResult = try await Auth.auth().signIn(withEmail: inputEmail, password: inputPassword)
            user = authResult.user
            
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
    
    
    func addUserToFirestore(inputName: String, inputEmail: String, inputPassword: String, inputConfirmPassword: String) async -> Bool {
        
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
            errorMessage = error.localizedDescription
            print("DEBUG: \(error.localizedDescription)")
            savedName = ""
            savedEmail = ""
            return false
        }
    }
    
    func registerUserInfoToFirestore() async -> Bool {
        print("SAVED NAME \(savedName)")
        print("SAVED EMAIL \(savedEmail)")
        
        let data:[String:Any] = ["uid": tempUser!.uid, "email": savedEmail, "name": savedName, "defaultHours": savedUserDefaultHours, "events": [["eventUID": "null", "title": "null"]]]
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
            if (user != nil) {
                let fetchUserInfoResult = try await Firestore.firestore().collection("users").document(user!.uid).getDocument()
                let fetchedUserDocument = fetchUserInfoResult.data() ?? ["name" : "", "email" : "", "defaultHours": [], "events": [["eventUID": "null", "title": "null"]]]
                savedName = fetchedUserDocument["name"] as! String
                savedEmail = fetchedUserDocument["email"] as! String
                savedUserDefaultHours = fetchedUserDocument["defaultHours"] as! [Int]
                inputUserDefaultHours = fetchedUserDocument["defaultHours"] as! [Int]
                savedUserEvents = fetchedUserDocument["events"] as! [[String: Any]]
                configuredDefaults = true
                return true
            }
            return false
        }
        catch {
            errorMessage = error.localizedDescription
            print("DEBUG: Failed to retrieve user info \(errorMessage)")
            return false
        }
    }
    
    func addNewEventToFirestore(inputTitle: String, inputDate: Date, inputDuration: Int, inputInvitee: String, inputDescription: String) async -> Bool {
        print("ADDING NEW EVENT")
        errorMessage = ""
        
        var needsSharing = false
        var inviteeUID = ""
        var inviteeExistingEvents: [[String: Any]] = [["title" : "null"]]
        var participants = [user!.uid]
        var savedAllUserHours = ["creator": savedUserDefaultHours]
        
        if inputInvitee != "" {
            do {
                let allUsersRecord = try await Firestore.firestore().collection("users").getDocuments()
                
                for userDocument in allUsersRecord.documents {
                    let userEmail = userDocument.get("email") as? String
                    
                    if userEmail == inputInvitee {
                        needsSharing = true
                        inviteeUID = userDocument.get("uid") as! String
                        participants.append(inviteeUID)
                        inviteeExistingEvents = userDocument.get("events") as! [[String: Any]]
                        let inviteeBlankArray: [Int] = []
                        savedAllUserHours[inviteeUID] = inviteeBlankArray
                    }
                }
                
                if needsSharing == false {
                    errorMessage = "Invitee not an existing user. Please try again"
                    print("DEBUG: \(errorMessage)")
                    return false
                }
            }
            catch {
                errorMessage = error.localizedDescription
                print("DEBUG: Unable to find all users: \(errorMessage)")
                return false
            }
        }
        
        do {
            let userInformationDocument = try await Firestore.firestore().collection("users").document(user!.uid).getDocument()
            var currentUserExistingEvents = userInformationDocument.data()!["events"] as! [[String : Any]]
            print("EXISTING EVENTS: \(currentUserExistingEvents)")
            
            let UUIDValue = UUID().uuidString
            
            
            
            let newEventCurrentUser:[String: Any] = ["eventUID": UUIDValue, "title" : inputTitle, "date": inputDate, "description" : inputDescription, "duration" : inputDuration, "participantIDs" : participants, "isCreator": true, "isShared" : needsSharing, "selfConfirmed": !needsSharing, "everyoneConfirmed": !needsSharing, "creatorConfirmed": !needsSharing, "allUserHours" : savedAllUserHours]
            let newEventInvitee:[String: Any] = ["eventUID" : UUIDValue, "title" : inputTitle, "date": inputDate, "description" : inputDescription, "duration" : inputDuration, "participantIDs" : participants, "isCreator": false, "isShared" : needsSharing, "selfConfirmed": false, "everyoneConfirmed": false, "creatorConfirmed": false, "allUserHours" : savedAllUserHours]
            
            currentUserExistingEvents.append(newEventCurrentUser)
            inviteeExistingEvents.append(newEventInvitee)
            
            
            do {
                try await Firestore.firestore().collection("users").document(user!.uid).updateData(["events" : currentUserExistingEvents])
                
                if needsSharing {
                    do {
                        try await Firestore.firestore().collection("users").document(inviteeUID).updateData(["events": inviteeExistingEvents])
                    }
                    catch {
                        errorMessage = "DEBUG: Unable to add enw event for invitee"
                        print(errorMessage)
                        return false
                    }
                    
                    
                }
                
                // refresh
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
        
        return true
    }
    
    func checkIfAllInviteesConfirmed(allUserHours: [String: [Int]]) -> Bool {
        for (_, userHours) in allUserHours {
            if (userHours == []) {
                print("NOT ALL INVITEES HAVE CONFIRMED")
                return false
                
            }
        }
        print("ALL INVITEES HAVE CONFIRMED")
        return true
    }
    
    func addInviteeAvailabilityToEvent(event: [String: Any]) async -> Bool {
        
        var allUserHours: [String: [Int]] = event["allUserHours"] as! [String: [Int]]
        allUserHours[String(describing: user!.uid)] = savedUserDefaultHours
        let everyoneConfirmedStatus = checkIfAllInviteesConfirmed(allUserHours: allUserHours)
        
        var eventToAdd = event
        
        eventToAdd["allUserHours"] = allUserHours
        eventToAdd["selfConfirmed"] = true
        eventToAdd["everyoneConfirmed"] = everyoneConfirmedStatus
        
        
        
        let eventUID = eventToAdd["eventUID"] as! String
        let participantIDs = eventToAdd["participantIDs"] as! [String]
        let creatorID = participantIDs[0]
        
        // since this is in the perspective of the invitee, we have to get the event from the creator and update that first
        do {
            // getting all the events of the creator first
            let creatorDocument = try await Firestore.firestore().collection("users").document(creatorID).getDocument()
            var allCreatorEvents : [[String : Any]] = creatorDocument.get("events") as! [[String : Any]]
            
            let eventToModifyIndex: Int = allCreatorEvents.firstIndex(where: { $0["eventUID"] as! String == eventUID})!
            
            var eventToModify: [String : Any] = allCreatorEvents[eventToModifyIndex]
            
            // syncing up invitee user hours within the creator's event details
            eventToModify["allUserHours"] = allUserHours
            eventToModify["everyoneConfirmed"] = everyoneConfirmedStatus
            allCreatorEvents[eventToModifyIndex] = eventToModify
            
            do {
                // updating the event for the creator
                try await Firestore.firestore().collection("users").document(creatorID).updateData(["events" : allCreatorEvents])
                
                do {
                    // getting all the events of the invitee first
                    let inviteeDocument = try await Firestore.firestore().collection("users").document(user!.uid).getDocument()
                    
                    // doing the same for the invitee
                    var allInviteeEvents: [[String : Any]] = inviteeDocument.get("events") as! [[String : Any]]
                    
                    let inviteeEventToModifyIndex: Int = allInviteeEvents.firstIndex(where: { $0["eventUID"] as! String == eventUID})!
                    
                    allInviteeEvents[inviteeEventToModifyIndex] = eventToAdd
                    
                    do {
                        try await Firestore.firestore().collection("users").document(user!.uid).updateData(["events" : allInviteeEvents])
                        
                        // refresh
                        if await getEventsFromFirestore() == true {
                            print("DEBUG: EVENT CREATION, SHARING, HOME PAGE REFRESH SUCCESS")
                            return true
                        }
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
        
        return true
    }
    
    
    func finalizeEvent(event: [String: Any]) async -> Bool {
        
        let participantIDs = event["participantIDs"] as! [String]
        let eventUID = event["eventUID"] as! String
        // retreieve the day of the week for date object
        var dateObject = (event["date"] as! Timestamp).dateValue()
        let calendar = Calendar.current
        let dayOfWeek = calendar.component(.weekday, from: dateObject)
        
        var dateObjectComponents = Calendar.current.dateComponents([.year, .month, .day, .hour, .minute, .weekday], from: dateObject)
        
        let finalizedHourToSubmit = finalizedHour % 24
        dateObjectComponents.hour = finalizedHourToSubmit
        dateObjectComponents.minute = 0
        
        do {
            // getting all the events of the creator first
            let creatorDocument = try await Firestore.firestore().collection("users").document(user!.uid).getDocument()
            var allCreatorEvents : [[String : Any]] = creatorDocument.get("events") as! [[String : Any]]
            
            let eventToModifyIndex: Int = allCreatorEvents.firstIndex(where: { $0["eventUID"] as! String == event["eventUID"] as! String})!
            
            var eventToModify: [String : Any] = allCreatorEvents[eventToModifyIndex]
            
            // syncing up invitee user hours within the creator's event details
            eventToModify["date"] = Calendar.current.date(from: dateObjectComponents)
            eventToModify["selfConfirmed"] = true
            eventToModify["creatorConfirmed"] = true
            allCreatorEvents[eventToModifyIndex] = eventToModify
            
            do {
                // updating the event for the creator
                try await Firestore.firestore().collection("users").document(user!.uid).updateData(["events" : allCreatorEvents])
                
                // start looping
                for userIDString in participantIDs {
                    do {
                        
                        // getting all the events of the invitee first
                        let inviteeDocument = try await Firestore.firestore().collection("users").document(userIDString).getDocument()
                        
                        // doing the same for the invitee
                        var allInviteeEvents: [[String : Any]] = inviteeDocument.get("events") as! [[String : Any]]
                        
                        let inviteeEventToModifyIndex: Int = allInviteeEvents.firstIndex(where: { $0["eventUID"] as! String == eventUID})!
                        
                        var eventToModifyInvitee: [String : Any] = allInviteeEvents[inviteeEventToModifyIndex]
                        
                        eventToModifyInvitee["date"] = Calendar.current.date(from: dateObjectComponents)
                        eventToModifyInvitee["creatorConfirmed"] = true
                        allInviteeEvents[inviteeEventToModifyIndex] = eventToModifyInvitee
                        
                        
                        do {
                            try await Firestore.firestore().collection("users").document(userIDString).updateData(["events" : allInviteeEvents])
                            
                            print("ERROR: Success in printing for a user")
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
                
                // refresh user input
                if await getEventsFromFirestore() == true {
                    print("DEBUG: EVENT CREATION, SHARING, HOME PAGE REFRESH SUCCESS")
                    return true
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
        
        
        return true
    }
    
    
    func signOut() {
        do {
            savedName = ""
            savedEmail = ""
            savedUserDefaultHours = []
            savedUserEvents = [["eventUID" : "null", "title":"null"]]

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
            savedName = ""
            savedEmail = ""
            savedUserDefaultHours = []
            savedUserEvents = [["eventUID" : "null", "title":"null"]]

            inputUserDefaultHours = []
            
            configuredDefaults = false
            authenticationState = .unauthenticated
            try Auth.auth().signOut()
            try await user?.delete()
            print("DEBUG: User account successfully deleted")
            user = nil
            return true
            
        }
        catch {
            print("DEBUG: Error deleting account \(error.localizedDescription)")
            errorMessage = error.localizedDescription
            return false
        }
        return true
    }
    
    func getUsersFromFirestore(listOfUsers: [String]) async -> Bool {
        allUsersInEvent = []
            do {
                let userInfo = try await Firestore.firestore().collection("users")
                for user in listOfUsers {
                    if (userInfo.document(user) != nil) {
                        
                        do {
                            let userInfoDocument = try await userInfo.document(user).getDocument()
                            let userInfoData = userInfoDocument.data() as! [String: Any]
                            let userInfoString = userInfoData["name"] as! String
                            
                            allUsersInEvent.append(userInfoString)
                        } catch {
                            print("DEBUG: Unable to get")
                        }
                    }
                }
                return true
            } catch {
                return false
            }
        }
    
}


