import Foundation
import SwiftUI
import Firebase

class HomePageViewModel: ObservableObject {
    @Published var nextScreen: String? = nil
    @Published var input: String = ""
    
    var userEvents:[[String: String]] = []
    
    init() {
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
    
    func refresh() {
        print("MADE TO HOME PAGE REFRESH")
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
            
            print("ALL EVENTS: \(allEvents)")
            
            print("Email index value \(emailIndexValue)")
            
            self.userEvents = allEvents[emailIndexValue]
            
        })
    }
}
