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
    
//    let ref = Database.database().reference()
    
    
    required init() {
        UserDefaults.standard.set("", forKey: "email")
        UserDefaults.standard.set("", forKey: "password")
        UserDefaults.standard.set("", forKey: "userIndexValue")
        UserDefaults.standard.set([["title":"null"]], forKey: "specificUserEvents")
        UserDefaults.standard.set(false, forKey: "loggedIn");
    }
    
    
    
    func createUser(newEmail:String, newPassword: String) {
        let ref = Database.database().reference()
        self.email = newEmail
        self.password = newPassword

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
                ref.child("loginInformation/emails").setValue(emailArray)
                
                ref.child("loginInformation/passwords").observeSingleEvent(of: .value, with: { snapshot in
                      guard var passwordArray = snapshot.value as? [String] else {
                          return
                      }
                      print("Old Password Values: \(passwordArray)")
                    
                    passwordArray.append(newPassword)
                    
                    print("CREATE USER: new password array: \(passwordArray)")
                    ref.child("loginInformation/passwords").setValue(passwordArray)
                    ref.child("events/emails").observeSingleEvent(of: .value, with: { snapshot in
                          guard var emailArray = snapshot.value as? [String] else {
                              return
                          }
                          print("Old Email Values: \(emailArray)")
                        print("NEW EMAIL \(newEmail)")
                        print("NEW PASSWORD \(newPassword)")
                                                
                        emailArray.append(newEmail)
                        print("CREATE USER: new email array: \(emailArray)")
                        ref.child("events/emails").setValue(emailArray)
                        // user has logged in at this point
                        UserDefaults.standard.set(newEmail, forKey: "email")
                        UserDefaults.standard.set(newPassword, forKey: "password")
                        
                        // let objectArray = UserDefaults.standard.array(forKey: "specificUserEvents") as! [[String: String]]
                
                        ref.child("events/events").observeSingleEvent(of: .value, with: { snapshot in
                            guard var allUserEvents = snapshot.value as? [[[String: String]]] else {
                                print("Error: All user events not found in database")
                                return
                            }
                         

                            var newEventDict: [String: String] = ["title":"null"]
                            var newUserArray: [[String:String]] = [newEventDict]
                            allUserEvents.append(newUserArray)
                            
                            print("All user events NEWEWWWWWW: \(allUserEvents)")
                            
                            ref.child("events/events").setValue(allUserEvents)
                            
                            UserDefaults.standard.set(newUserArray, forKey: "specificUserEvents")
                            
                        })
                        print("RETRIEVED EMAIL: \(UserDefaults.standard.object(forKey: "email") as! String)")
                        print("RETRIEVED PASSWORD: \(UserDefaults.standard.object(forKey: "password") as! String)")
                        UserDefaults.standard.set(true, forKey: "loggedIn");
                        UserDefaults.standard.set(emailArray.count - 1, forKey: "userIndexValue")
                        
                    })
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
        
        print("trying to log in")
        let ref = Database.database().reference()
        
        ref.child("loginInformation/emails").observeSingleEvent(of: .value, with: { snapshot in
              guard let tempEmailArray = snapshot.value as? [String] else {
                  print("Error: Email array not found")
                  return
              }
            
            print("Existing temp email array: \(tempEmailArray)")
            
            emailArray = tempEmailArray
            
            print("Existing email array: \(emailArray)")
            
            emailInDatabase = emailArray.contains(email)
            
            if (emailInDatabase){
                
                emailIndexValue = emailArray.firstIndex(of: email) ?? -1
                
                ref.child("loginInformation/passwords").observeSingleEvent(of: .value, with: { snapshot in
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
                        
                        print("NEW TO PRINT")
                        let ref = Database.database().reference()
                        let emailAddress = String(describing: UserDefaults.standard.object(forKey: "email")!)
                        
                        print ("Email address \(emailAddress)")
                        // retrieving the events based on the email
                        let emailIndexValue = UserDefaults.standard.integer(forKey: "userIndexValue")
                        
                        print("email index value \(emailIndexValue)")
                        
                        ref.child("events/events").observeSingleEvent(of: .value, with: { snapshot in
                            guard let allEvents = snapshot.value as? [[[String: String]]] else {
                                print("Error: All user events not found in database")
                                return
                            }
                            
                            UserDefaults.standard.set(allEvents[emailIndexValue], forKey: "specificUserEvents")
                            print("NEW EVENTS: \(allEvents[emailIndexValue])")
                      
                        })
                        
                        print("END OF SETTING")
                                
                        
                        let testUserDefaultEmail = String(describing: UserDefaults.standard.object(forKey: "email")!)
                        let testUserDefaultPassword = String(describing: UserDefaults.standard.object(forKey: "password")!)
                        let testLoggedIn = String(describing:UserDefaults.standard.object(forKey: "loggedIn")!)
                        
                        print("USER DEFAULTS email: \(testUserDefaultEmail), password: \(testUserDefaultPassword), LOGGED IN WOOO: \(testLoggedIn)")
                        
                        self.email = email
                        
                        print("Success, user has logged in")
                        
//                        let homePageView = HomePageViewModel()
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
        
        
        let ref = Database.database().reference()
        ref.child("events/emails").observeSingleEvent(of: .value, with: { snapshot in
              guard var emailArray = snapshot.value as? [String] else {
                  return
              }
              print("Old Email Values: \(emailArray)")
            
            // retrieving the events based on the email
            let emailIndexValue = emailArray.firstIndex(of: self.email) ?? -1
            
            ref.child("events/events").observeSingleEvent(of: .value, with: { snapshot in
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
                
                ref.child("events/events").setValue(specificUserEvents)
                
            })
            
        })
    }

}
