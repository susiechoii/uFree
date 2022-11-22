import SwiftUI
import Firebase


struct HomePageView: View {
    @StateObject var homePageViewModel = HomePageViewModel()
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    // init method
    init() {
        print("Creating Home Page View")
    }
    
    var body: some View {
        NavigationView {
            VStack (alignment: .center) {
                
                // Object array to retrieve items
                let objectArray = UserDefaults.standard.array(forKey: "specificUserEvents") as? [[String: String]] ?? [["title": "null"]]
                
                // Scroll View to display items
                ScrollView(.vertical, showsIndicators: false) {
                    LazyVStack {
                        if (objectArray.count > 0) {
                            ForEach(0...objectArray.count-1, id: \.self) { index in
                                
                                let _ = print("Event index: \(index)")
                                let userTitle = objectArray[index]["title"]
                                
                                if (userTitle != "null") {
                                    let userDuration = objectArray[index]["duration"]
                                    let userDate = objectArray[index]["date"]
                                    
                                    
                                    GenericCell(title: userTitle!, indexValue: index, date: userDate!, duration: userDuration!)
                                        .onTapGesture {
                                            
                                            homePageViewModel.nextScreen = "EventView"
                                        }
                                }
                                
                            }
                        }
                        
                    }
                }.frame(width: UIScreen.main.bounds.width,
                        height: getRelativeHeight(580), alignment: .center)
                
                
                // CREATE EVENT BUTTON - TO BE REPLACED WITH A TAB BAR
                Button(action: {
                    homePageViewModel.nextScreen = "EventCreationView"
                    
                }, label: {
                    Text("CREATE EVENT")
                        .font(FontScheme
                            .kInterExtraBold(size: getRelativeHeight(35.0)))
                        .fontWeight(.heavy)
                        .padding(.horizontal, getRelativeWidth(30.0))
                        .padding(.vertical, getRelativeHeight(22.0))
                        .foregroundColor(ColorConstants.WhiteA700)
                        .minimumScaleFactor(0.5)
                        .frame(width: getRelativeWidth(295.0),
                               height: getRelativeHeight(60.0),
                               alignment: .center)
                        .background(RoundedCorners(topLeft: 28.5,
                                                   topRight: 28.5,
                                                   bottomLeft: 28.5,
                                                   bottomRight: 28.5)
                            .fill(ColorConstants.Red400))
                })
                .frame(width: getRelativeWidth(295.0),
                       height: getRelativeHeight(60.0), alignment: .center)
                .background(RoundedCorners(topLeft: 28.5, topRight: 28.5,
                                           bottomLeft: 28.5, bottomRight: 28.5)
                    .fill(ColorConstants.Red400))
                
                
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
