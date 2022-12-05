////
////  PrimaryView.swift
////  application
////
////  Created by Nico Stuart on 11/25/22.
////
//
////this is the view where we will control the tab bar from
////Each view is pushed from this tab bar controller "primaryview"
//
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
        print("Created Primary View")
    }
    var body: some View {
        NavigationView {
            VStack {
                switch selectedTab {
                case .homePage:
                    NavigationView {
                        HomePageView().environmentObject(viewModel)
                    }.hideNavigationBar()
                case .calendarPage:
                    NavigationView {
                        MonthlyCalendarView().environmentObject(viewModel)
                    }
                case .friendsPage:
                    NavigationView {
                        FriendsPageView().environmentObject(viewModel)
                    }
                case.profilePage:
                    NavigationView {
                        ProfileView().environmentObject(viewModel)
                    }
                }
                CustomTabView(selectedTab: $selectedTab)
                    .environmentObject(viewModel)
                    .frame(height: 50)
            }
        }
    }
}
//
//Sheet for the event creation (modal)
@available(iOS 15.0, *)
struct SheetView: View {
    @EnvironmentObject var viewModel: AuthenticationViewModel
    @Environment(\.dismiss) var dismiss

    var body: some View {
        EventCreationView().environmentObject(viewModel)
    }
}

struct CustomTabView: View {
    @Binding var selectedTab: Tab
    @State private var eventCreationModal = false
    @EnvironmentObject var viewModel: AuthenticationViewModel

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


//            Button {
//                selectedTab = .calendarPage
//            } label: {
//                VStack {
//                    if (selectedTab != .calendarPage) {
//                    Image("img_combinedshape")
//                        .resizable()
//                        .scaledToFit()
//                        .frame(width: 25, height: 25)
//                    }
//                    else {
//                        Image("img_vector_24X23")
//                            .resizable()
//                            .scaledToFit()
//                            .frame(width: 25, height: 25)
//                    }
//                }
//            }

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
                    SheetView().environmentObject(viewModel)
                } else {
                    // Fallback on earlier versions
                }
            }


            Spacer()


            HStack(spacing: 40) {

//            Button {
//                selectedTab = .friendsPage
//            } label: {
//                VStack {
//                    if (selectedTab != .friendsPage) {
//                    Image("img_combinedshape_23X27")
//                        .resizable()
//                        .scaledToFit()
//                        .frame(width: 25, height: 25)
//                    }
//                    else {
//                        Image("img_3friends")
//                            .resizable()
//                            .scaledToFit()
//                            .frame(width: 25, height: 25)
//                    }
//                }
//            }


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
        PrimaryView().environmentObject(AuthenticationViewModel())
    }
}

//import SwiftUI
//import Firebase
//import Foundation
//
//struct PrimaryView: View {
//
//    @EnvironmentObject var viewModel: AuthenticationViewModel
//
//    @State private var selectedIndex = 0
//    @State var tabImage = 0
//    @State private var eventCreationModal = false
//
//    var body: some View {
//        TabView(selection: $selectedIndex) {
//            HomePageView().environmentObject(viewModel)
//                .onTapGesture {
//                    self.selectedIndex = 0
//                }
//                .tabItem {
//                    if (self.selectedIndex == 0) {
//                        Image("img_vector")
//                    }
//                    else {
//                    Image("img_fill1")
//                    }
//                }.tag(0)
//            //EventCreationView().environmentObject(viewModel)
//            //HomePageView().environmentObject(viewModel)
//            SheetView().environmentObject(viewModel)
//                .onTapGesture {
//                    eventCreationModal.toggle()
////                    NavigationLink(destination: HomePageView().environmentObject(viewModel),
////                                   label: {
////                        EmptyView()
////                    })
//                }
//                .tabItem {
//                    if (self.selectedIndex == 1) {
//                        Image("img_group90")
//                    }
//                    else {
//                    Image("img_group90")
//                    }
//                }
//            ProfileView().environmentObject(viewModel)
//                .onTapGesture {
//                    self.selectedIndex = 2
//                }
//                .tabItem {
//                    if (self.selectedIndex == 2){
//                        Image("img_vector_1")
//                    }
//                    else {
//                    Image("img_combinedshape_24X20")
//                    }
//                }
//        }
//    }
//}
//
//struct PrimaryView_Previews: PreviewProvider {
//    static var previews: some View {
//        PrimaryView().environmentObject(AuthenticationViewModel())
//    }
//}
