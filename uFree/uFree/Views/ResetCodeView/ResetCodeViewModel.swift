import Foundation
import SwiftUI

class ResetCodeViewModel: ObservableObject {
    @Published var nextScreen: String? = nil
    @Published var inputtextnoneText: String = ""
    @Published var isValidInputtextnoneText: Bool = true
}
