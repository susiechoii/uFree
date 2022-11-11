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
            
            let emailIndex = emailArray.firstIndex(of: newEmail) ?? -1
            
            if (emailIndex == -1) {
                emailArray.append(newEmail)
                print("CREATE USER: new email array: \(emailArray)")
                self.ref.child("loginInformation/emails").setValue(emailArray)
                
                self.ref.child("loginInformation/passwords").observeSingleEvent(of: .value, with: { snapshot in
                      guard var passwordArray = snapshot.value as? [String] else {
                          return
                      }
                      print("Old Password Values: \(passwordArray)")
                    
                    passwordArray.append(newPassword)
                    
                    print("CREATE USER: new password array: \(passwordArray)")
                    self.ref.child("loginInformation/passwords").setValue(passwordArray)
                })
                
                self.ref.child("events/emails").observeSingleEvent(of: .value, with: { snapshot in
                      guard var emailArray = snapshot.value as? [String] else {
                          return
                      }
                      print("Old Email Values: \(emailArray)")
                    
                    emailArray.append(newEmail)
                    print("CREATE USER: new email array: \(emailArray)")
                    self.ref.child("events/emails").setValue(emailArray)
                    // user has logged in at this point
                    UserDefaults.standard.set(self.email, forKey: "email")
                    UserDefaults.standard.set(self.password, forKey: "password")
                    UserDefaults.standard.set(true, forKey: "loggedIn");
                    UserDefaults.standard.set(emailArray.count - 1, forKey: "userIndexValue")
                    
                })
            }
            else {
                print("ERROR: USER ALREADY EXISTS, CANNOT CREATE NEW EMAIL")
            }
            
        })
        
        
        
        
        
   
   
    }
        
    
    

    // first function!
    // login!
    func login(email: String, password: String) {
        var emailInDatabase = false
        var passwordInDatabase = false
        var emailIndexValue = -1
        var emailArray: [String] = []
        var canReturn = false
        
        return ref.child("loginInformation/emails").observeSingleEvent(of: .value, with: { snapshot in
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
                        UserDefaults.standard.set(true, forKey: "loggedIn")
                        UserDefaults.standard.set(emailIndexValue, forKey: "userIndexValue")
                    
                        
                        
                        let testUserDefaultEmail = String(describing: UserDefaults.standard.object(forKey: "email")!)
                        let testUserDefaultPassword = String(describing: UserDefaults.standard.object(forKey: "password")!)
                        let testLoggedIn = String(describing:UserDefaults.standard.object(forKey: "loggedIn")!)
                        
                        print("USER DEFAULTS email: \(testUserDefaultEmail), password: \(testUserDefaultPassword), LOGGED IN WOOO: \(testLoggedIn)")
                        
                        self.email = email
                        
                        print("Success, user has logged in")
                        
                        let homePageView = HomePageViewModel()
                        canReturn = true
                    }
                    else {
                        print("Error, email found, password not found")
                    }
                })
                
            } else {
                print("Error, email not found ")
            }
            
            canReturn = true
        })
        
        
    }
    
    func createEvent(name: String, duration: Int, description: String, date: Date) {
        ref.child("events/emails").observeSingleEvent(of: .value, with: { snapshot in
              guard var emailArray = snapshot.value as? [String] else {
                  return
              }
              print("Old Email Values: \(emailArray)")
            
            // retrieving the events based on the email
            let emailIndexValue = emailArray.firstIndex(of: self.email) ?? -1
            
            self.ref.child("events/events").observeSingleEvent(of: .value, with: { snapshot in
                guard let allUserEvents = snapshot.value as? [[[String: String]]] else {
                    return
                }
                
                var specificUserEvents = allUserEvents[emailIndexValue]
                
                var dateString = ""
                if #available(iOS 15.0, *) {
                    dateString = date.formatted(date: .numeric, time: .omitted) as String
                } else {
                    // Fallback on earlier versions
                    print("Get a new phone")
                }
                let newEventDict: [String: String] = ["title": name, "duration": String(duration), "description": description, "date": dateString]
                
                specificUserEvents.append(newEventDict)
                
                self.ref.child("events/events").setValue(specificUserEvents)
                
            })
            
        })
    }

}
