//
//  Backend.swift
//  uFree
//
//  Created by Leung Wai Liu on 11/6/22.
//

import Foundation
import Firebase



class Backend {
    var email:String!
    var password: String!
    
    let ref = Database.database().reference()
    
    
    required init() {
        UserDefaults.standard.set("", forKey: "email")
        UserDefaults.standard.set("", forKey: "password")
        UserDefaults.standard.set(false, forKey: "loggedIn");
        
    }
    
    
    
    func createUser(newEmail:String, newPassword: String) {
        self.email = newEmail
        self.password = newPassword
        
        // sorry susie
        // getting emails, appending, overwritng
        ref.child("loginInformation/emails").observeSingleEvent(of: .value, with: { snapshot in
              guard var emailArray = snapshot.value as? [String] else {
                  return
              }
              print("Old Email Values: \(emailArray)")
            
            emailArray.append(newEmail)
            print("CREATE USER: new email array: \(emailArray)")
            self.ref.child("loginInformation/emails").setValue(emailArray)
        })
        
        
        ref.child("loginInformation/passwords").observeSingleEvent(of: .value, with: { snapshot in
              guard var passwordArray = snapshot.value as? [String] else {
                  return
              }
              print("Old Password Values: \(passwordArray)")
            
            passwordArray.append(newPassword)
            
            print("CREATE USER: new password array: \(passwordArray)")
            self.ref.child("loginInformation/passwords").setValue(passwordArray)
        })
        
        
        // user has logged in at this point
        UserDefaults.standard.set(self.email, forKey: "email")
        UserDefaults.standard.set(self.password, forKey: "password")
        UserDefaults.standard.set(true, forKey: "loggedIn");
    }
        
    
    

    // first function!
    // login!
    func login(email: String, password: String) {
        var emailInDatabase = false
        var passwordInDatabase = false
        var emailIndexValue = -1
        var emailArray: [String] = []
        
        ref.child("loginInformation/emails").observeSingleEvent(of: .value, with: { snapshot in
              guard let tempEmailArray = snapshot.value as? [String] else {
                  return
              }
            
            print("Existing temp email array: \(tempEmailArray)")
            
            emailArray = tempEmailArray
            
            print("Existing email array: \(emailArray)")
            
            emailInDatabase = emailArray.contains(email)
            
            if (emailInDatabase){
                
                emailIndexValue = emailArray.firstIndex(of: email) ?? -1
                
                self.ref.child("loginInformation/passwords").observeSingleEvent(of: .value, with: { snapshot in
                    guard let passwordArray = snapshot.value as? [String] else {
                        return
                    }
                    passwordInDatabase = passwordArray[emailIndexValue] == password

                    print("Existing password array: \(passwordArray)")
                    
                    if (passwordInDatabase) {
                        print("reached here, passwordInDatabase is true")
                        // user has successfully logged in, setting user defaults
                       
                        UserDefaults.standard.set(email, forKey: "email")
                        UserDefaults.standard.set(password, forKey: "password")
                        UserDefaults.standard.set(true, forKey: "loggedIn");
                    
                        
                        
                        var testUserDefaultEmail = String(describing: UserDefaults.standard.object(forKey: "email")!)
                        var testUserDefaultPassword = String(describing: UserDefaults.standard.object(forKey: "password")!)
                        var testLoggedIn = String(describing:UserDefaults.standard.object(forKey: "loggedIn")!)
                        
                        print("USER DEFAULTS email: \(testUserDefaultEmail), password: \(testUserDefaultPassword), LOGGED IN WOOO: \(testLoggedIn)")
                        
                        print("Success, user has logged in")
                    }
                    else {
                        print("Error, email found, password not found")
                    }
                })
                
            } else {
                print("Error, email not found ")
            }
            
            
        })
        
        
    }

}
