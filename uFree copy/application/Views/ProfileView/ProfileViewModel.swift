import Foundation
import SwiftUI

class ProfileViewModel: ObservableObject {
    @Published var nextScreen: String? = nil
    @Published var logoutText: String = ""
}
