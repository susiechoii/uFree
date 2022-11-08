import Foundation
import SwiftUI

class ResetPasswordViewModel: ObservableObject {
    @Published var nextScreen: String? = nil
    @Published var inputtextnoneText: String = ""
    @Published var isValidInputtextnoneText: Bool = true
    @Published var inputtextnoneoneText: String = ""
    @Published var isValidInputtextnoneoneText: Bool = true
}
