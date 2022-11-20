import Foundation
import SwiftUI

class HomeViewFourViewModel: ObservableObject {
    @Published var nextScreen: String? = nil
    @Published var input: String = ""
}
