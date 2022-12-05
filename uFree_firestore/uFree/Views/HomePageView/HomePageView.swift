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
                    
                }.padding(.top, 0)
                
                
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
                    }.padding(.top, getRelativeHeight(12))
                }.frame(width: UIScreen.main.bounds.width,
                        height: getRelativeHeight(600), alignment: .center)
                
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
