import Foundation
import SwiftUI

class WeeklyView1ViewModel: ObservableObject {
    @Published var nextScreen: String? = nil
    @Published var tabViewselectionList: [String] = ["MonthView", "ThisWeek"]
    @Published var selectedViewselectionIndex: Int = 0
}
