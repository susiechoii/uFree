//
//  PrimaryView.swift
//  application
//
//  Created by Nico Stuart on 11/25/22.
//

//this is the view where we will control the tab bar from
//Each view is pushed from this tab bar controller "primaryview"

import Foundation
import SwiftUI



enum Tab {
    case homePage
    case calendarPage
    case friendsPage
    case profilePage
}

struct TabButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .opacity(configuration.isPressed ? 0.9 : 1)
            .scaleEffect(configuration.isPressed ? 0.9 : 1)
    }
}


struct PrimaryView: View {
    @State private var selectedTab: Tab = .homePage
    @EnvironmentObject var viewModel:AuthenticationViewModel
    
    init() {
        print("Creating primary view")
    }
    var body: some View {
        NavigationView {
            VStack {
                switch selectedTab {
                case .homePage:
                    NavigationView {
                        HomePageView()
                    }.hideNavigationBar()
                case .calendarPage:
                    NavigationView {
                        MonthlyCalendarView()
                    }
                case .friendsPage:
                    NavigationView {
                        FriendsPageView()
                    }
                case.profilePage:
                    NavigationView {
                        ProfileView()
                    }
                }
                CustomTabView(selectedTab: $selectedTab)
                    .frame(height: 50)
            }
            .hideNavigationBar()
        }
    }
}

//Sheet for the event creation (modal)
@available(iOS 15.0, *)
struct SheetView: View {
    @Environment(\.dismiss) var dismiss

    var body: some View {
        EventCreationView()
    }
}

struct CustomTabView: View {
    @Binding var selectedTab: Tab
    @State private var eventCreationModal = false
    
    var body: some View {
        HStack {
            
            Spacer()
            
            HStack(spacing: 40) {
            
            Button {
                selectedTab = .homePage
            } label: {
                VStack {
                    if (selectedTab != .homePage) {
                    Image("img_fill1")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 25, height: 25)
                    }
                    else {
                        Image("img_vector")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 25, height: 25)
                    }
                }
            }
            
            
            Button {
                selectedTab = .calendarPage
            } label: {
                VStack {
                    if (selectedTab != .calendarPage) {
                    Image("img_combinedshape")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 25, height: 25)
                    }
                    else {
                        Image("img_vector_24X23")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 25, height: 25)
                    }
                }
            }
                
            }
            
            Spacer()
            
            Button {
                print("button pressed")
                eventCreationModal.toggle()
                print(eventCreationModal)
            } label: {//EBEBEB
                ZStack {
                    Circle()
                        .foregroundColor(ColorConstants.Gray200)
                        .frame(width: 65, height: 65)
                        .shadow(radius: 2)
                    Image("img_group90")
                        .resizable()
                        .frame(width: 20, height: 20)
                }
                .offset(y: -18)
            }
            .buttonStyle(TabButtonStyle())
            .sheet(isPresented: $eventCreationModal) {
                if #available(iOS 15.0, *) {
                    SheetView()
                } else {
                    // Fallback on earlier versions
                }
            }
            
            
            Spacer()
            
            
            HStack(spacing: 40) {
                
            Button {
                selectedTab = .friendsPage
            } label: {
                VStack {
                    if (selectedTab != .friendsPage) {
                    Image("img_combinedshape_23X27")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 25, height: 25)
                    }
                    else {
                        Image("img_3friends")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 25, height: 25)
                    }
                }
            }
            
            
            Button {
                selectedTab = .profilePage
            } label: {
                VStack {
                    if (selectedTab != .profilePage) {
                    Image("img_combinedshape_24X20")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 25, height: 25)
                    }
                    else {
                        Image("img_vector_1")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 25, height: 25)
                    }
                }
            }
            
            }
            Spacer()
            
        }
    }
}







struct PrimaryView_Previews: PreviewProvider{
    static var previews: some View {
        PrimaryView()
    }
}
