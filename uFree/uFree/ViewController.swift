//
//  ViewController.swift
//  uFree
//
//  Created by user223971 on 10/29/22.
//

import UIKit
import FirebaseDatabase

class ViewController: UIViewController {
    
    var testBackend: Backend!

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let ref = Database.database().reference()

        
    }
    
    @IBAction func createUser() {
        var testBackend = Backend()
        
        testBackend.createUser(newEmail: "xcodesucks@gmail.com", newPassword: "fuckyouxcode")
        
        var testUserDefaultEmail = String(describing: UserDefaults.standard.object(forKey: "email")!)
        var testUserDefaultPassword = String(describing: UserDefaults.standard.object(forKey: "password")!)
        var testLoggedIn = String(describing: UserDefaults.standard.object(forKey: "loggedIn")!)
        
        print("LOGGING IN email: \(testUserDefaultEmail), password: \(testUserDefaultPassword), LOGGED IN WOOO: \(testLoggedIn)")
    }
    
    
    @IBAction func loginFunction() {
            
        var testBackend = Backend()
        
        
         testBackend.login(email: "xcodesucks@gmail.com", password: "fuckyouxcode")
        
        
        var testUserDefaultEmail = String(describing: UserDefaults.standard.object(forKey: "email")!)
        var testUserDefaultPassword = String(describing: UserDefaults.standard.object(forKey: "password")!)
        var testLoggedIn = String(describing: UserDefaults.standard.object(forKey: "loggedIn")!)
        
        print("LOGGING IN email: \(testUserDefaultEmail), password: \(testUserDefaultPassword), LOGGED IN WOOO: \(testLoggedIn)")
            
            
        
    }
    
    @IBAction func getUserDefaults(_ sender: Any) {
        
        print("AT USER DEFAULTS")
        
        var testUserDefaultEmail = String(describing: UserDefaults.standard.object(forKey: "email")!)
        var testUserDefaultPassword = String(describing: UserDefaults.standard.object(forKey: "password")!)
        var testLoggedIn = String(describing: UserDefaults.standard.object(forKey: "loggedIn")!)
        
        print("USER DEFAULTS email: \(testUserDefaultEmail), password: \(testUserDefaultPassword), LOGGED IN WOOO: \(testLoggedIn)")
    }
    
    @IBAction func logoutFunction() {
        
        UserDefaults.standard.set("", forKey: "email")
        UserDefaults.standard.set("", forKey: "password")
        UserDefaults.standard.set(false, forKey: "loggedIn")
        
        // verify
        
        var testUserDefaultEmail = String(describing: UserDefaults.standard.object(forKey: "email")!)
        var testUserDefaultPassword = String(describing: UserDefaults.standard.object(forKey: "password")!)
        var testLoggedIn = String(describing: UserDefaults.standard.object(forKey: "loggedIn")!)
        
        print("LOGGING OUT email: \(testUserDefaultEmail), password: \(testUserDefaultPassword), LOGGED IN WOOO: \(testLoggedIn)")

    }
    
}



