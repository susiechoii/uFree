import SwiftUI
import Firebase
import FirebaseCore
import FirebaseFirestore
import FirebaseAuth


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
                    
                    Button (action: getEventsFromFirebase, label: {
                        Text("Refresh")
                    })
                    
                }
              
                ScrollView(.vertical, showsIndicators: false) {
                    LazyVStack {
                        
                        let _ = print("number of events: \($viewModel.savedUserEvents)")
                        ForEach(1..<$viewModel.savedUserEvents.count, id: \.self) { index in
                            NavigationLink {
                                EventView(particularEvent: viewModel.savedUserEvents[index]).environmentObject(viewModel)
                            } label: {
                                GenericCell(indexValue: index, particularEvent: viewModel.savedUserEvents[index])
                                    .padding(.bottom, getRelativeHeight(10))
                            }
                        }
                    }.padding(.top, getRelativeHeight(12))
                }.frame(width: UIScreen.main.bounds.width,
                        height: getRelativeHeight(580), alignment: .center)

                // NAVIGATION LINK GROUP
                Group {
                    NavigationLink(destination: EventCreationView().environmentObject(viewModel),
                                   tag: "EventCreationView",
                                   selection: $homePageViewModel.nextScreen,
                                   label: {
                        EmptyView()
                    })
                    
                    NavigationLink(destination: HomePageView().environmentObject(viewModel),
                                   tag: "HomePageView",
                                   selection: $homePageViewModel.nextScreen,
                                   label: {
                        EmptyView()
                    })
                }
            }
            .onAppear {
                getEventsFromFirebase()
            }
            
            .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
            .background(ColorConstants.WhiteA700)
            .hideNavigationBar()
            
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
