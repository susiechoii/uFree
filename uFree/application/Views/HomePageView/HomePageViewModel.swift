import Foundation
import SwiftUI
import Firebase

class HomePageViewModel: ObservableObject {
    @Published var nextScreen: String? = nil
    @Published var input: String = ""
    
    var userEvents:[[String: String]] = []
    
    func refresh() {
        print("MADE TO HOME PAGE VIEW INIT")
        let ref = Database.database().reference()
        let emailIndexValue = UserDefaults.standard.integer(forKey: "userIndexValue")
        
        print("email index value \(emailIndexValue)")
        
        
        ref.child("events/events").observeSingleEvent(of: .value, with: { snapshot in
            guard let allEvents = snapshot.value as? [[[String: String]]] else {
                print("Error: All user events not found in database")
                return
            }
            
            print("ALL EVENTS: \(allEvents)")
            
            print("Email index value \(emailIndexValue)")
            
            self.userEvents = allEvents[emailIndexValue]
            
        })
    }

    init() {
        print("CALLING MODEL INIT")
        let ref = Database.database().reference()
        print(UserDefaults.standard.object(forKey: "email"))
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
            
            print("ALL EVENTS: \(allEvents)")
            
            print("Email index value \(emailIndexValue)")
            
            print("allEvents[emailIndexValue]: \(allEvents[emailIndexValue])")
            print(type(of: allEvents[emailIndexValue]))
            print("value of 0: \(allEvents[emailIndexValue][0]["date"])")
            UserDefaults.standard.set(allEvents[emailIndexValue], forKey: "specificUserEvents")
            print("TYPEEEEEE: \(type(of: UserDefaults.standard.set(allEvents[emailIndexValue], forKey: "specificUserEvents")))")
            let objectArray = UserDefaults.standard.array(forKey: "specificUserEvents") as! [[String: String]]
            print("objectArray: \(objectArray[0]["date"])")
            print(type(of: objectArray))
            
        })
    }
}
