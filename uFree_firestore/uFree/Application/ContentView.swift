//
//  AuthenticationFlowView.swift
//  uFree
//
//  Created by Leung Wai Liu on 11/28/22.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var viewModel: AuthenticationViewModel
    @State var isLoggedIn: Bool = false
    
    var body: some View {
            if viewModel.user == nil || isLoggedIn {
                let _ = print("DEBUG: ContentView - creating OnboardingView")
                IntroPageView().environmentObject(viewModel)
            } else if viewModel.user != nil || !isLoggedIn {
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
