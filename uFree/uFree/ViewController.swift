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
        ref.child("something_\(Int.random(in: 0..<100))").setValue("test")
        
        ref.child("something").observeSingleEvent(of: .value, with: { snapshot in
            guard let value = snapshot.value as? String else {
                return
            }
            print("Value: \(value)")
        })
    }


}

