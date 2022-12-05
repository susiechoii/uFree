import SwiftUI
import Firebase
import FirebaseCore
import FirebaseFirestore
import FirebaseAuth


//Sheet for the event creation (modal)
@available(iOS 15.0, *)
struct SheetView2: View {
    @EnvironmentObject var viewModel: AuthenticationViewModel
    @Environment(\.dismiss) var dismiss
    var indexVal = 0
    
    // init method
    init(index: Int) {
        indexVal = index
        print("Creating Home Page View")
    }
    
    var body: some View {
        let _ = print("indexVal: \(indexVal)")
        EventView(particularEvent: viewModel.savedUserEvents[indexVal]).environmentObject(viewModel)
    }
}

struct HomePageView: View {
    @StateObject var homePageViewModel = HomePageViewModel()
    @State private var eventDetailModal = false
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
                            Button {
                                eventDetailModal.toggle()
                            } label: {
                                let _ = print("regIndex \(index)")
                                GenericCell(indexValue: index, particularEvent: viewModel.savedUserEvents[index])
                            }
                            .sheet(isPresented: $eventDetailModal) {
                                    let _ = print("PASSEDIndex \(index)")
                                    SheetView2(index: index).environmentObject(viewModel)
                            }
                            
                            
//                            NavigationLink {
//                                EventView(particularEvent: viewModel.savedUserEvents[index]).environmentObject(viewModel)
//                            } label: {
//                                GenericCell(indexValue: index, particularEvent: viewModel.savedUserEvents[index])
//                            }
                        }
                    }
                }.frame(width: UIScreen.main.bounds.width,
                        height: getRelativeHeight(580), alignment: .center)
        
                Button(action: getEventsFromFirebase) {
                    Text("REFRESH")
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
                }
                .frame(width: getRelativeWidth(295.0),
                       height: getRelativeHeight(60.0), alignment: .center)
                .background(RoundedCorners(topLeft: 28.5, topRight: 28.5,
                                           bottomLeft: 28.5, bottomRight: 28.5)
                    .fill(ColorConstants.Red400))
                
                
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
