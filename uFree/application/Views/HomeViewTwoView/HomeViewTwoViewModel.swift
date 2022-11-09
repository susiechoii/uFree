import Foundation
import SwiftUI

class HomeViewTwoViewModel: ObservableObject {
    @Published var nextScreen: String? = nil
    @Published var input: String = ""
}
