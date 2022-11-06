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
        //var test = ExampleClass(newName: "Ian", newPassword: "Password")
//        var dictionary: [String:String] = ["Username": "Leung Wai", "Password": "my life sucks"]

//        ref.child("something_\(Int.random(in: 0..<100))").setValue(dictionary)
        
        self.testBackend = Backend(newEmail: "test@example.com", newPassword: "example")
        
        testBackend.login()
        
        var testUserDefaultEmail = String(describing: UserDefaults.standard.object(forKey: "email")!)
        var testUserDefaultPassword = String(describing: UserDefaults.standard.object(forKey: "password")!)
        var testLoggedIn = String(describing: UserDefaults.standard.object(forKey: "loggedIn")!)
        
        print("email: \(testUserDefaultEmail), password: \(testUserDefaultPassword), LOGGED IN WOOO: \(testLoggedIn)")
//        ref.child("something").observeSingleEvent(of: .value, with: { snapshot in
//            guard let value = snapshot.value as? Int else {
//                return
//            }
//            print("Value: \(value)")
//        })
        
    }


}

class ExampleClass {
    var name: String?
    var password: String?
    
    init(newName: String, newPassword: String) {
        self.name = newName
        self.password = newPassword
    }
}

