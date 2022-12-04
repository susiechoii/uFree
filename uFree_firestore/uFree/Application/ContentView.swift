//
//  AuthenticationFlowView.swift
//  uFree
//
//  Created by Leung Wai Liu on 11/28/22.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var viewModel: AuthenticationViewModel
    
    var body: some View {
        if viewModel.user == nil && viewModel.configuredDefaults == false {
            let _ = print("DEBUG: ContentView - creating OnboardingView")
            IntroPageView().environmentObject(viewModel)
        }
        else if viewModel.user != nil && viewModel.configuredDefaults == true {
            let _ = print("DEBUG: ContentView - creating PrimaryView")
            PrimaryView().environmentObject(viewModel)
        }
    }
}

struct AuthenticationFlowView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(AuthenticationViewModel())
    }
}
