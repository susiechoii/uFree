import SwiftUI
import Firebase


struct HomePageView: View {
    @StateObject var homePageViewModel = HomePageViewModel()
    //@ObservedObject var objectArray = ObservedObjectArrayModel()
    //@State var refresh: Bool = false;
    init() {
        print("Creating Home Page View")
//        homePageViewModel.refresh()
    }
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    var body: some View {
        NavigationView {
            VStack {
                VStack(alignment: .leading, spacing: 0) {
                    VStack {
                        VStack(alignment: .leading, spacing: 0) {
                            HStack {
                            Text(StringConstants.kLblUpcomingEvents)
                                .font(FontScheme.kInterSemiBold(size: getRelativeHeight(32.0)))
                                .fontWeight(.semibold)
                                .foregroundColor(ColorConstants.Gray900)
                                .minimumScaleFactor(0.5)
                                .multilineTextAlignment(.leading)
                                .frame(width: getRelativeWidth(255.0),
                                       height: getRelativeHeight(33.0), alignment: .topLeading)
                                .padding(.trailing)
                                Button {
                                    homePageViewModel.nextScreen = "HomePageView"
                
                                } label: {
                                    Text("Refresh")
                                }

                            }
                            Image("img_items")
                                .resizable()
                                .frame(width: getRelativeWidth(343.0),
                                       height: getRelativeHeight(64.0), alignment: .center)
                                .scaledToFit()
                                .clipped()
                                .padding(.top, getRelativeHeight(16.0))
                            VStack(spacing: 0) {
                                
                           let objectArray = UserDefaults.standard.array(forKey: "specificUserEvents") as? [[String: String]] ?? [["title": "null"]]

                                
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
                                }
                                Button(action: {
                                    homePageViewModel.nextScreen = "EventCreationView"

                                }, label: {
                                    HStack(spacing: 0) {
                                        Text("Create Event")
                                            .font(FontScheme
                                                .kInterBlack(size: getRelativeHeight(15.0)))
                                            .fontWeight(.black)
                                            .padding(.horizontal, getRelativeWidth(30.0))
                                            .padding(.vertical, getRelativeHeight(22.0))
                                            .foregroundColor(ColorConstants.WhiteA700)
                                            .minimumScaleFactor(0.5)
                                            .multilineTextAlignment(.center)
                                            .frame(width: getRelativeWidth(295.0),
                                                   height: getRelativeHeight(60.0),
                                                   alignment: .center)
                                            .background(RoundedCorners(topLeft: 28.5,
                                                                       topRight: 28.5,
                                                                       bottomLeft: 28.5,
                                                                       bottomRight: 28.5)
                                                    .fill(ColorConstants.Red400))
                                    }
                                })
                                .frame(width: getRelativeWidth(295.0),
                                       height: getRelativeHeight(60.0), alignment: .center)
                                .background(RoundedCorners(topLeft: 28.5, topRight: 28.5,
                                                           bottomLeft: 28.5, bottomRight: 28.5)
                                        .fill(ColorConstants.Red400))
                            }
                            .frame(width: getRelativeWidth(343.0), alignment: .leading)
                            .padding(.top, getRelativeHeight(16.0))
                        }
                        .frame(width: getRelativeWidth(343.0), height: getRelativeHeight(701.0),
                               alignment: .center)
                        .background(ColorConstants.WhiteA700)
                        .padding(.top, getRelativeHeight(23.0))
                        .padding(.horizontal, getRelativeWidth(16.0))
                    }
                    .frame(width: UIScreen.main.bounds.width, height: getRelativeHeight(765.0),
                           alignment: .leading)
                    VStack(alignment: .leading, spacing: 0) {
                        Text("TabBars")
                            .minimumScaleFactor(0.5)
                            .multilineTextAlignment(.leading)
                            .frame(width: UIScreen.main.bounds.width,
                                   height: getRelativeHeight(96.0), alignment: .leading)
                    }
                    .frame(width: UIScreen.main.bounds.width, height: getRelativeHeight(96.0),
                           alignment: .leading)
                }
                .frame(width: UIScreen.main.bounds.width, alignment: .topLeading)
                .background(ColorConstants.WhiteA700)
                .padding(.top, getRelativeHeight(30.0))
                .padding(.bottom, getRelativeHeight(10.0))
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
            .padding(.top, getRelativeHeight(70.0))
            .background(ColorConstants.WhiteA700)
            .ignoresSafeArea()
            .hideNavigationBar()
        }
        .hideNavigationBar()
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
