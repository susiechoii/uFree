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
    
    //    private var authStateHandle: AuthStateDidChangeListenerHandle?
    //
    //    func registerAuthStateHandler() {
    //        if authStateHandle == nil {
    //            authStateHandle = Auth.auth().addStateDidChangeListener{ auth, user in
    //                self.user = user
    //                self.authenticationState = user == nil ? .unauthenticated : .authenticated
    //                self.displayName = user?.email ?? "(unknown)"
    //                print("DEBUG: USER initialized, user email: \(self.displayName)")
    //
    //            }
    //        }
    //    }
    
    
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
        
        var needsSharing = false
        var inviteeUID = ""
        var inviteeEvents: NSMutableArray = [["title" : "null"]]
        
        if inputInvitee != "" {
            do {
                let allUsersRecord = try await Firestore.firestore().collection("users").getDocuments()
                
                for userDocument in allUsersRecord.documents {
                    let userEmail = userDocument.get("email") as? String
                    
                    if userEmail == inputInvitee {
                        needsSharing = true
                        inviteeUID = userDocument.get("uid") as! String
                        inviteeEvents = userDocument.get("events") as! NSMutableArray
                    }
                }
                
                if needsSharing == false {
                    errorMessage = "Invitee not an existing user. Please try again"
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
            
            var newEventCurrentUser:[String: Any] = ["id": UUIDValue, "title" : inputTitle, "creator" : true, "shared" : needsSharing, "confirmed" : true]
            var newEventInvitee:[String: Any] = ["id" : UUIDValue, "title" : inputTitle, "creator" : false, "shared" : needsSharing, "confirmed" : false]
            
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
                    print("DBEUG: EVENT CREATION, SHARING, HOME PAGE REFRESH SUCCESS")
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
