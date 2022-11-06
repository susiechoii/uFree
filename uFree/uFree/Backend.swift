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
    
    
    
    required init(newEmail: String, newPassword: String) {
        self.email = newEmail
        self.password = newPassword
    }
    
    // first function!
    // login!
    func login() {
       Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
           if error != nil {
               print(error?.localizedDescription ?? "")
           } else {
               print("success, logged in")
               
               // setting user defaults
               
               UserDefaults.standard.set(self.email, forKey: "email")
               UserDefaults.standard.set(self.password, forKey: "password")
               UserDefaults.standard.set(true, forKey: "loggedIn");

           }
       }
    }

}
