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
        
        do {
            let userInformationDocument = try await Firestore.firestore().collection("users").document(user!.uid).getDocument()
            let existingEvents = userInformationDocument.data()!["events"] as! NSMutableArray
            print("EXISTING EVENTS: \(existingEvents)")
            existingEvents.add(["title": inputTitle])
            let data:[String:Any] = ["uid": user!.uid, "email": savedEmail, "name": savedName, "defaultHours": savedUserDefaultHours, "events": existingEvents]
            
            do {
                try await Firestore.firestore().collection("users").document(user!.uid).setData(data)
                if await getEventsFromFirestore() == true {
                    return true
                }
            }
            catch {
                return false
            }
        }
        catch {
            return false
        }
        return false
    }
    
    func signOut() {
        do {
            try Auth.auth().signOut()
            print("DEBUG: User SUCCESSFULLY signed out")
            user = nil
            savedName = ""
            savedEmail = ""
            savedUserDefaultHours = []
            savedUserEvents = [["title":"null"]]
            configuredDefaults = false
            authenticationState = .unauthenticated
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
