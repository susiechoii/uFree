import Foundation
import SwiftUI

class HomeViewThreeViewModel: ObservableObject {
    @Published var nextScreen: String? = nil
    @Published var input: String = ""
}
