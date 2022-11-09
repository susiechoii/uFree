import Foundation
import SwiftUI

class SignUpViewModel: ObservableObject {
    @Published var nextScreen: String? = nil
    @Published var groupsevenText: String = ""
    @Published var isValidGroupsevenText: Bool = true
    @Published var inputtextnoneText: String = ""
    @Published var isValidInputtextnoneText: Bool = true
    @Published var inputtextnoneoneText: String = ""
    @Published var isValidInputtextnoneoneText: Bool = true
    @Published var inputtextnonetwoText: String = ""
    @Published var isValidInputtextnonetwoText: Bool = true
}
