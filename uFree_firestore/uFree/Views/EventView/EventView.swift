import SwiftUI
import Firebase
import FirebaseFirestore
import FirebaseAuth

// Personal: img_nomadscampfire
// Shared: img_calendar

struct EventView: View {
    
    @StateObject var eventViewModel = EventViewModel()
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @EnvironmentObject var viewModel: AuthenticationViewModel
    
    var event: [String: Any]!
    var dateFormatter = DateFormatter()
    
    var eventUID: String!
    var title: String!
    
    var date: String!
    
    var time: String!
    var description: String!
    var duration: Int!
    
    var participantIDs: [String]!
    
    var isCreator: Bool!
    var isShared: Bool!
    
    var selfConfirmed: Bool!
    var everyoneConfirmed: Bool!
    var creatorConfirmed: Bool!
    
    var allUserHours: [String: [Int]]!
    
    var allUserNames: [String]!
    
    @State var checkIfEveryOneSubmitted: Bool!
    
    private func getUsersFromFirebase() {
        Task {
            return await viewModel.getUsersFromFirestore(listOfUsers: self.participantIDs)
        }
    }
    
    private func generateParticipantText() -> String {
        var participantString = ""
        
        for userName in viewModel.allUsersInEvent {
            if userName != "" {
                participantString += userName + ", "
            }
        }
        
        if participantString.count >= 2 {
            participantString = String(describing: participantString.prefix(participantString.count - 2))
        }
        
        return participantString
    }
    
    
    init(particularEvent: [String: Any]) {
        self.event = particularEvent as! [String: Any]
        self.eventUID = particularEvent["eventUID"] as! String
        self.title = particularEvent["title"] as! String
        self.allUserNames = []
        
        
        var dateObject = (particularEvent["date"] as! Timestamp).dateValue()
        
        dateFormatter.locale = Locale(identifier: "en_US")
        dateFormatter.dateFormat = "MM/dd/yyyy"
        self.date = dateFormatter.string(from:dateObject)
        
        dateFormatter.dateFormat = "HH:mm"
        self.time = dateFormatter.string(from:dateObject)
        
        self.description = particularEvent["description"] as! String
        self.duration = particularEvent["duration"] as! Int
        
        self.participantIDs = particularEvent["participantIDs"] as! [String]
        
        self.isCreator = particularEvent["isCreator"] as! Bool
        self.isShared = particularEvent["isShared"] as! Bool
        
        self.selfConfirmed = particularEvent["selfConfirmed"] as! Bool
        self.everyoneConfirmed = particularEvent["everyoneConfirmed"] as! Bool
        self.creatorConfirmed = particularEvent["creatorConfirmed"] as! Bool
        
        self.allUserHours = particularEvent["allUserHours"] as! [String: [Int]]
    }
    
    func checkIfAllInviteesConfirmed() -> Bool {
        for (_, userHours) in allUserHours {
            if (userHours == []) {
                print("NOT ALL INVITEES HAVE CONFIRMED")
                return false
                
            }
        }
        print("ALL INVITEES HAVE CONFIRMED")
        return true
    }
    
    
    
    var body: some View {
        NavigationView {
            
            VStack {
                
                VStack {
                    
                    Button(action: {
                        self.presentationMode.wrappedValue.dismiss()
                    }, label: {
                        Image("img_arrowleft")
                    })
                    .padding(.top, getRelativeHeight(100.0))
                    .padding(.trailing, getRelativeWidth(300.0))
                    
                    VStack {
                        
                        HStack {
                            ZStack {}
                                .hideNavigationBar()
                                .frame(width: getRelativeWidth(8.0), height: getRelativeHeight(87.0), alignment: .leading)
                                .background(RoundedCorners(topLeft: 4.0, topRight: 4.0, bottomLeft: 4.0, bottomRight: 4.0)
                                    .fill(ColorConstants.OrangeA200))
                            
                            VStack(alignment: .leading, spacing: 0) {
                                Text("Event Details")
                                    .font(FontScheme.kInterRegular(size: getRelativeHeight(20)))
                                    .fontWeight(.bold)
                                    .foregroundColor(ColorConstants.OrangeA200)
                                    .minimumScaleFactor(0.5)
                                    .multilineTextAlignment(.leading)
                                    .frame(width: getRelativeWidth(120), height: getRelativeHeight(40), alignment: .topLeading)
                                    .padding(.trailing)
                                    .padding(.bottom, 0)
                                
                                
                                Text(self.title)
                                    .font(FontScheme.kInterSemiBold(size: getRelativeHeight(50)))
                                    .fontWeight(.semibold)
                                    .foregroundColor(ColorConstants.Gray900)
                                    .minimumScaleFactor(0.5)
                                    .multilineTextAlignment(.leading)
                                    .frame(width: getRelativeWidth(200),
                                           height: getRelativeHeight(50), alignment: .topLeading)
                                    .padding(.trailing, getRelativeWidth(10.0))
                                    .padding(.top, getRelativeHeight(-5))
                                
                                Text("Date: " + String(describing: self.date))
                                    .font(FontScheme.kInterBold(size: getRelativeHeight(16.0)))
                                    .fontWeight(.bold)
                                    .foregroundColor(ColorConstants.Gray600)
                                    .minimumScaleFactor(0.5)
                                    .multilineTextAlignment(.leading)
                                    .frame(width: getRelativeWidth(157.0), height: getRelativeHeight(16.0), alignment: .topLeading)
                                    .padding(.top, getRelativeHeight(15.0))
                                
                                Text("Time: " + String(describing: self.time))
                                    .font(FontScheme.kInterBold(size: getRelativeHeight(16.0)))
                                    .fontWeight(.bold)
                                    .foregroundColor(ColorConstants.Gray600)
                                    .minimumScaleFactor(0.5)
                                    .multilineTextAlignment(.leading)
                                    .frame(width: getRelativeWidth(157.0), height: getRelativeHeight(16.0), alignment: .topLeading)
                                    .padding(.top, getRelativeHeight(15.0))
                                
                                Text("Duration: " + String(describing: self.duration))
                                    .font(FontScheme.kInterBold(size: getRelativeHeight(16.0)))
                                    .fontWeight(.bold)
                                    .foregroundColor(ColorConstants.Gray600)
                                    .minimumScaleFactor(0.5)
                                    .multilineTextAlignment(.leading)
                                    .frame(width: getRelativeWidth(157.0), height: getRelativeHeight(16.0), alignment: .topLeading)
                                    .padding(.top, getRelativeHeight(15.0))
                            }
                            .frame(width: getRelativeWidth(157.0), height: getRelativeHeight(83.0), alignment: .top)
                            .padding(.leading, getRelativeWidth(16.0))
                            
                        }
                        .frame(width: getRelativeWidth(232.0), height: getRelativeHeight(200.0), alignment: .leading)
                        .padding(.top, getRelativeHeight(-150.0))
                        .padding(.trailing, getRelativeWidth(300.0))
                        
                        if (isShared) {
                            
                            ZStack {
                                Image("img_amigosshopping")
                                    .resizable()
                                    .frame(width: getRelativeWidth(350.0), height: getRelativeHeight(200.0), alignment: .leading)
                                    .scaledToFit()
                                    .clipped()
                                    .padding(.all, getRelativeWidth(8.0))
                                    .padding(.vertical, getRelativeHeight(0.0))
                                    .padding(.horizontal, getRelativeWidth(-80.0))
                            }
                            .hideNavigationBar()
                            .frame(width: UIScreen.main.bounds.width, height: getRelativeHeight(200.0), alignment: .leading)
                            .background(ColorConstants.WhiteA700)
                            .padding(.top, getRelativeHeight(16.0))
                        } else {
                            ZStack {
                                Image("img_nomadscampfire")
                                    .resizable()
                                    .frame(width: getRelativeWidth(350.0), height: getRelativeHeight(200.0), alignment: .center)
                                    .scaledToFit()
                                    .clipped()
                                    .padding(.all, getRelativeWidth(8.0))
                                    .padding(.vertical, getRelativeHeight(0.0))
                                    .padding(.horizontal, getRelativeWidth(-80.0))
                            }
                            .hideNavigationBar()
                            .frame(width: UIScreen.main.bounds.width, height: getRelativeHeight(200.0), alignment: .leading)
                            .background(ColorConstants.WhiteA700)
                            .padding(.top, getRelativeHeight(16.0))
                        }
                        
                        
                        VStack(alignment: .leading, spacing: 0) {
                            Text("Description")
                                .font(FontScheme.kInterBold(size: getRelativeHeight(16.0)))
                                .fontWeight(.bold)
                                .foregroundColor(ColorConstants.Gray900)
                                .minimumScaleFactor(0.5)
                                .multilineTextAlignment(.leading)
                                .frame(width: getRelativeWidth(85.0), height: getRelativeHeight(18.0), alignment: .topLeading)
                                .padding(.trailing)
                            
                            Text(self.description)
                                .font(FontScheme.kInterRegular(size: getRelativeHeight(14.0)))
                                .fontWeight(.regular)
                                .foregroundColor(ColorConstants.Gray900)
                                .minimumScaleFactor(0.5)
                                .multilineTextAlignment(.leading)
                                .frame(width: getRelativeWidth(331.0), height: getRelativeHeight(78.0), alignment: .topLeading)
                                .padding(.top, getRelativeHeight(9.0))
                                .padding(.trailing, getRelativeWidth(11.0))
                            
                            
                            Text("Participants: " + generateParticipantText())
                                .font(FontScheme.kInterBold(size: getRelativeHeight(16.0)))
                                .fontWeight(.bold)
                                .foregroundColor(ColorConstants.Gray900)
                                .minimumScaleFactor(0.5)
                                .multilineTextAlignment(.leading)
                                .frame(width: getRelativeWidth(460.0), height: getRelativeHeight(16.0), alignment: .topLeading)
                                .padding(.top, getRelativeHeight(20.0))
                                .padding(.trailing, getRelativeWidth(10.0))
                            
                        }
                        .frame(width: getRelativeWidth(343.0), height: getRelativeHeight(170.0), alignment: .center)
                        // .background(RoundedCorners(topLeft: 8.0, topRight: 8.0, bottomLeft: 8.0, bottomRight: 8.0))
                        .padding(.vertical, getRelativeHeight(16.0))
                        .padding(.horizontal, getRelativeWidth(16.0))
                        
                        let _ = print(isShared)
                        if (isShared) {
                            let _ = print(checkIfAllInviteesConfirmed())
                            if (checkIfAllInviteesConfirmed()) {
                                
                                if (isCreator) {
                                    if (!selfConfirmed) {
                                        // confirm availability button
                                        Button(action: {
                                            eventViewModel.nextScreen = "CreatorConfirmTimeView"
                                        }, label: {
                                            HStack(spacing: 0) {
                                                Text("FINALIZE AVAILABILITY")
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
                                                    .background(RoundedCorners(topLeft: 20, topRight: 20, bottomLeft: 20, bottomRight: 20)
                                                    .fill(ColorConstants.Red400))
                                            }
                                        })
                                        .frame(width: getRelativeWidth(295.0),
                                               height: getRelativeHeight(60.0), alignment: .topLeading)
                                        
                                    } else {
                                        // Text that says Confirmed
                                        Text("Event Confirmed!")
                                            .font(FontScheme.kInterRegular(size: getRelativeHeight(20)))
                                            .fontWeight(.medium)
                                            .frame(width: getRelativeWidth(300), height: 12, alignment: .leading)
                                            .lineSpacing(26)
                                    }
                                } else {
                                    // not creator
                                    // Text that says waiting
                                    if (creatorConfirmed) {
                                        Text("Event Confirmed!")
                                            .font(FontScheme.kInterRegular(size: getRelativeHeight(20)))
                                            .fontWeight(.medium)
                                            .frame(width: getRelativeWidth(300), height: 12, alignment: .leading)
                                            .lineSpacing(26)
                                    } else {
                                        Text("Waiting for other users to confirm...")
                                            .font(FontScheme.kInterRegular(size: getRelativeHeight(15)))
                                            .fontWeight(.medium)
                                            .frame(width: getRelativeWidth(470), height: 1, alignment: .leading)
                                            .lineSpacing(26)
                                    }
                                    
                                }
                            } else {
                                // not checkifallinviteesconfirmed
                                if (isCreator) {
                                    // Text that says waiting other
                                    Text("Waiting for other users to confirm...")
                                        .font(FontScheme.kInterRegular(size: getRelativeHeight(15)))
                                        .fontWeight(.medium)
                                        .frame(width: getRelativeWidth(470), height: 1, alignment: .leading)
                                        .lineSpacing(26)
                                }
                                else {
                                    if (!selfConfirmed) {
                                        // Button that says set availability
                                        Button(action: {
                                            eventViewModel.nextScreen = "OptimalTimeView"
                                        }, label: {
                                            HStack(spacing: 0) {
                                                Text("SET AVAILABILITY")
                                                    .font(FontScheme
                                                        .kInterExtraBold(size: getRelativeHeight(35.0)))
                                                    .fontWeight(.heavy)
                                                    .padding(.horizontal, getRelativeWidth(30.0))
                                                    .padding(.vertical, getRelativeHeight(22.0))
                                                    .foregroundColor(ColorConstants.WhiteA700)
                                                    .minimumScaleFactor(0.5)
                                                    .frame(width: getRelativeWidth(295.0), height: getRelativeHeight(60.0), alignment: .center)
                                                    .background(RoundedCorners(topLeft: 20, topRight: 20, bottomLeft: 20, bottomRight: 20)
                                                    .fill(ColorConstants.Red400))
                                            }
                                        })
                                        .frame(width: getRelativeWidth(295.0),
                                               height: getRelativeHeight(60.0), alignment: .topLeading)
                                        
                                    } else {
                                        // Text that says waiting
                                        Text("Waiting for other users to confirm...")
                                            .font(FontScheme.kInterRegular(size: getRelativeHeight(15)))
                                            .fontWeight(.medium)
                                            .frame(width: getRelativeWidth(470), height: 1, alignment: .leading)
                                            .lineSpacing(26)
                                    }
                                }
                            }
                        } else {
                            Text("Personal Event Confirmed")
                                .font(FontScheme.kInterRegular(size: getRelativeHeight(20)))
                                .fontWeight(.medium)
                                .frame(width: getRelativeWidth(300), height: 12, alignment: .leading)
                                .lineSpacing(26)
                        }
                        
                        Button(action: {
                            viewModel.signOut()
                        }, label: {
                            Text("DELETE EVENT")
                                .font(FontScheme
                                    .kInterExtraBold(size: getRelativeHeight(25.0)))
                                .fontWeight(.heavy)
                                .padding(.horizontal, getRelativeWidth(30.0))
                                .padding(.vertical, getRelativeHeight(22.0))
                                .foregroundColor(ColorConstants.WhiteA700)
                                .minimumScaleFactor(0.5)
                                .frame(width: getRelativeWidth(250),
                                       height: getRelativeHeight(40.0),
                                       alignment: .center)
                                .background(RoundedCorners(topLeft: 15,
                                                           topRight: 15,
                                                           bottomLeft: 15,
                                                           bottomRight: 15)
                                    .fill(ColorConstants.Gray600))
                        })
                        .padding(.vertical, getRelativeHeight(20))
                        .padding(.horizontal, getRelativeWidth(-200.0))
                        
                        
                    }
                    .frame(width: UIScreen.main.bounds.width, height: getRelativeHeight(768.0), alignment: .leading)
                    
                }
                .frame(width: UIScreen.main.bounds.width, alignment: .topLeading)
                .background(ColorConstants.WhiteA700)
                .padding(.top, getRelativeHeight(30.0))
                .padding(.bottom, getRelativeHeight(10.0))
                
                Group {
                    NavigationLink(destination: OptimalTimeView(particularEvent: event).environmentObject(viewModel),
                                   tag: "OptimalTimeView",
                                   selection: $eventViewModel.nextScreen,
                                   label: {
                        EmptyView()
                    })
                    
                    NavigationLink(destination: CreatorConfirmTimeView(particularEvent: event).environmentObject(viewModel),
                                   tag: "CreatorConfirmTimeView",
                                   selection: $eventViewModel.nextScreen,
                                   label: {
                        EmptyView()
                    })
                }
            }
            .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
            .background(ColorConstants.WhiteA700)
        }
        .hideNavigationBar()
        .onAppear  {
            if (isShared) {
                getUsersFromFirebase()
            }
        }
    }
}

struct EventView_Previews: PreviewProvider {
    static var previews: some View {
        //        EventView().environmentObject(AuthenticationViewModel())
        EventView(particularEvent: ["eventUID": "0", "title" : "Test Title", "date": nil, "description" : "Test Description", "duration" : 5, "participantIDs" : ["CreatorUID", "InviteeUID"], "isCreator": true, "isShared" : true, "selfConfirmed": false, "everyoneConfirmed": false, "creatorConfirmed": false, "allUserHours" : ["creator": [0,1,2,3], "InviteeID1": [2,3,4,5]]]).environmentObject(AuthenticationViewModel())
    }
}
