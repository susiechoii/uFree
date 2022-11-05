//
//  ViewController.swift
//  uFree
//
//  Created by user223971 on 10/29/22.
//

import UIKit
import FirebaseDatabase

class ViewController: UIViewController {

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let ref = Database.database().reference()
        //var test = ExampleClass(newName: "Ian", newPassword: "Password")
        var dictionary: [String:String] = ["Username": "Ian", "Password": "hello_world"]

        ref.child("something_\(Int.random(in: 0..<100))").setValue(dictionary)
        
        
        ref.child("something").observeSingleEvent(of: .value, with: { snapshot in
            guard let value = snapshot.value as? Int else {
                return
            }
            print("Value: \(value)")
        })
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

