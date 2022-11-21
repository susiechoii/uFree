//
//  Backend.swift
//  uFree
//
//  Created by Leung Wai Liu on 11/6/22.
//

import Foundation


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
    
    func createEvent(name: String, duration: Int, description: String, date: Date) {

//        let ref = Database.database().reference()
//        ref.child("events/emails").observeSingleEvent(of: .value, with: { snapshot in
//              guard var emailArray = snapshot.value as? [String] else {
//                  return
//              }
//              print("Old Email Values: \(emailArray)")
//
//            // retrieving the events based on the email
//            let emailIndexValue = emailArray.firstIndex(of: self.email) ?? -1
//
//            ref.child("events/events").observeSingleEvent(of: .value, with: { snapshot in
//                guard let allUserEvents = snapshot.value as? [[[String: String]]] else {
//                    return
//                }
//
//                var specificUserEvents = allUserEvents[emailIndexValue]
//
//                var dateString = ""
//                if #available(iOS 15.0, *) {
//                    dateString = date.formatted(date: .numeric, time: .omitted) as String
//                } else {
//                    // Fallback on earlier versions
//                    print("Get a new phone")
//                }
//                let newEventDict: [String: String] = ["title": name, "duration": String(duration), "description": description, "date": dateString]
//
//                specificUserEvents.append(newEventDict)
//
//                ref.child("events/events").setValue(specificUserEvents)
//
//            })
//
//        })
    }

}
