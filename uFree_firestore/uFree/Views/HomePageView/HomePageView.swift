import SwiftUI
import Firebase


struct HomePageView: View {
    @StateObject var homePageViewModel = HomePageViewModel()
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    @EnvironmentObject var viewModel:AuthenticationViewModel
    
    // init method
    init() {
        print("Creating Home Page View")
    }
    
    private func getEventsFromFirebase() {
        Task {
            return await viewModel.getEventsFromFirestore()
        }
    }
    
    var body: some View {
        NavigationView {
            VStack (alignment: .center) {
                
                ScrollView(.vertical, showsIndicators: false) {
                    LazyVStack {
                        
                        let _ = print("number of events: \($viewModel.savedUserEvents)")
                        ForEach(1..<$viewModel.savedUserEvents.count, id: \.self) { index in
                            
                            GenericCell(particularEvent: viewModel.savedUserEvents[index])
                            
                        }
                    }
                }.frame(width: UIScreen.main.bounds.width,
                        height: getRelativeHeight(580), alignment: .center)
                
                //                // Scroll View to display items
                //                ScrollView(.vertical, showsIndicators: false) {
                //                    LazyVStack {
                //                        if (objectArray.count > 0) {
                //                            ForEach(0...objectArray.count-1, id: \.self) { index in
                //
                //                                let _ = print("Event index: \(index)")
                //                                let userTitle = objectArray[index]["title"]
                //
                //                                if (userTitle != "null") {
                //                                    let userDuration = objectArray[index]["duration"]
                //                                    let userDate = objectArray[index]["date"]
                //
                //
                //                                    GenericCell(title: userTitle!, indexValue: index, date: userDate!, duration: userDuration!)
                //                                        .onTapGesture {
                //
                //                                            homePageViewModel.nextScreen = "EventView"
                //                                        }
                //                                }
                //
                //                            }
                //                        }
                //
                //                    }
                //                }.frame(width: UIScreen.main.bounds.width,
                //                        height: getRelativeHeight(580), alignment: .center)
                
                
                
                
                // NAVIGATION LINK GROUP
                Group {
                    NavigationLink(destination: EventView(),
                                   tag: "EventView",
                                   selection: $homePageViewModel.nextScreen,
                                   label: {
                        EmptyView()
                    })
                    NavigationLink(destination: EventCreationView(),
                                   tag: "EventCreationView",
                                   selection: $homePageViewModel.nextScreen,
                                   label: {
                        EmptyView()
                    })
                    NavigationLink(destination: HomePageView(),
                                   tag: "HomePageView",
                                   selection: $homePageViewModel.nextScreen,
                                   label: {
                        EmptyView()
                    })
                }
            }
            .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
            .background(ColorConstants.WhiteA700)
            .navigationBarTitle("Upcoming Events")
            
        }
        
    }
}


class ObservedObjectArrayModel: ObservableObject {
    @Published var objectArrayDict: [[String: String]] = [["title" : "null"]]
}

struct HomePageView_Previews: PreviewProvider {
    static var previews: some View {
        HomePageView()
    }
}
