import Foundation
import SwiftUI

class EventCreationViewModel: ObservableObject {
    @Published var nextScreen: String? = nil
    @Published var duration: Int = 1
//    @Published var durationPicker1Values: [String] = ["Option 1", "Option 2", "Option 3"]
}
