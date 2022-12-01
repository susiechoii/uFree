//
//  PrimaryViewGlobalVars.swift
//  uFree
//
//  Created by Nico Stuart on 11/28/22.
//

import Foundation
import SwiftUI


struct primaryGlobal {
    //@State public var eventCreationModalHelper = false
}

class PrimaryViewModel: ObservableObject {
    @Published var nextScreen: String? = nil
    @Published var eventCreationModalHelper = false
//    @Published var durationPicker1Values: [String] = ["Option 1", "Option 2", "Option 3"]
}
