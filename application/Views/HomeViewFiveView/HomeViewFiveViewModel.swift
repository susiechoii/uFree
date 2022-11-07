import Foundation
import SwiftUI

class HomeViewFiveViewModel: ObservableObject {
    @Published var nextScreen: String? = nil
    @Published var input: String = ""
}
