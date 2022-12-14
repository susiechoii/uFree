import SwiftUI
import Firebase
import FirebaseCore
import FirebaseFirestore
import FirebaseAuth

struct OptimalTimeView: View {
    @StateObject var optimalTimeViewModel = OptimalTimeViewModel()
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    
    @EnvironmentObject var viewModel: AuthenticationViewModel
    @Environment(\.dismiss) var dismiss
    
    var event: [String: Any]!
    var dateFormatter = DateFormatter()
    
    var eventUID: String!
    var title: String!
    var date: String!
    var weekday: Int!
    var weekArray: [Int] = []
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
    
    private func addInviteeAvailabilityToEvent() {
        Task {
            if await viewModel.addInviteeAvailabilityToEvent(event: event) == true {
                self.presentationMode.wrappedValue.dismiss()
            }
        }
    }
    
    init(particularEvent: [String: Any]) {
        self.event = particularEvent as! [String: Any]
        self.eventUID = particularEvent["eventUID"] as! String
        self.title = particularEvent["title"] as! String
        
        var dateObject = (particularEvent["date"] as! Timestamp).dateValue()
        dateFormatter.locale = Locale(identifier: "en_US")
        dateFormatter.dateFormat = "MM/dd/yyyy"
        self.date = dateFormatter.string(from:dateObject)
        
        dateFormatter.dateFormat = "HH:mm"
        self.time = dateFormatter.string(from:dateObject)
        
        self.weekday = Calendar.current.component(.weekday, from: dateObject) - 1
//        weekArray.concat(weekArray.splice(0,weekArray.indexOf(weekday)))
        var i: Int = weekday, count = 0, n = 7

        // while loop from i = 1 to 5
        while (count < n) {
            if(i < 7){
                self.weekArray.append(i)
                i += 1
            }
            else{
                i = 0
                self.weekArray.append(i)
                i += 1
            }
            count += 1
        }
        print(self.weekArray)
        
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
    
    var body: some View {
        VStack (alignment: .center, spacing: 0){
            
            // TOP HEADER BAR
            ZStack(alignment: .topLeading) {
                
                // WHEN ARE YOU FREE TEXT
                VStack (alignment: .leading, spacing: 0){
                    Text("Set Your")
                        .font(FontScheme.kInterRegular(size: getRelativeHeight(25)))
                        .foregroundColor(ColorConstants.Bluegray900)
                        .minimumScaleFactor(0.5)
                        .multilineTextAlignment(.leading)
                        .frame(width: getRelativeWidth(108.0),
                               height: getRelativeHeight(25), alignment: .leading)
                    Text("Availability")
                        .font(FontScheme.kInterRegular(size: getRelativeHeight(30)))
                        .fontWeight(.bold)
                        .foregroundColor(ColorConstants.Bluegray900)
                        .minimumScaleFactor(0.5)
                        .multilineTextAlignment(.leading)
                        .frame(width: getRelativeWidth(160.0),
                               height: getRelativeHeight(40), alignment: .leading)
                        .padding(.top, getRelativeHeight(-5))
                    Text("Choose an alternative date.")
                        .font(FontScheme.kInterRegular(size: getRelativeHeight(15)))
                    
                        .foregroundColor(ColorConstants.Bluegray900)
                        .minimumScaleFactor(0.5)
                        .multilineTextAlignment(.leading)
                        .frame(width: getRelativeWidth(200),
                               height: getRelativeHeight(20), alignment: .leading)
                        .padding(.top, getRelativeHeight(7))
                }
                .frame(width: getRelativeWidth(250),
                       height: getRelativeHeight(100), alignment: .leading)
                .padding(.leading, getRelativeWidth(20))
                .padding(.top, getRelativeHeight(60))
                
                Image("img_group6")
                    .resizable()
                    .frame(width: getRelativeWidth(271.0),
                           height: getRelativeHeight(204.0), alignment: .center)
                    .scaledToFit()
                    .clipped()
                    .padding(.bottom, getRelativeHeight(10))
                    .padding(.leading, getRelativeWidth(140))
            }
            .lineSpacing(26).padding(.top, 40)
            .frame(width: UIScreen.main.bounds.width,
                   height: getRelativeHeight(150.0), alignment: .leading)
            
            
            // SCROLL VIEW FOR THE DAYS OF THE WEEK
            ScrollView([.horizontal, .vertical], showsIndicators: false) {
                LazyHStack {
                    ForEach(self.weekArray, id: \.self) { index in
//                        let _ = print(index)
//                        let _ = print(self.weekArray[index])
//                        let _ = print(self.weekArray)
                        DaysTimeSele2Cell(index: index, defaultHours: viewModel.savedUserDefaultHours).environmentObject(viewModel)
                    }
                }
                .padding(.horizontal, getRelativeWidth(25))
            }
            .frame(width: UIScreen.main.bounds.width, height: getRelativeHeight(500))
            
            
            
            // SAVE AND CONTINUE BUTTON
            Button(action: addInviteeAvailabilityToEvent, label: {
                Text("SAVE AND CONTINUE")
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
            .padding(.top, 25)
            
            
            // NAVIGATION LINK GROUP
            Group {
                NavigationLink(destination: PrimaryView().environmentObject(viewModel),
                               tag: "PrimaryView",
                               selection: $optimalTimeViewModel.nextScreen,
                               label: {
                    EmptyView()
                })
            }
            
            
        }
        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height, alignment: .top)
        .padding(.top, 0)
        .background(ColorConstants.WhiteA700)
        .ignoresSafeArea()
        .hideNavigationBar()
        
    }
}

struct OptimalTimeView_Previews: PreviewProvider {
    static var previews: some View {
        OptimalTimeView(particularEvent: ["eventUID": "0", "title" : "Test Title", "date": Date.now, "description" : "Test Description", "duration" : 5, "participantIDs" : ["CreatorUID", "InviteeUID"], "isCreator": true, "isShared" : true, "selfConfirmed": false, "everyoneConfirmed": false, "creatorConfirmed": false, "allUserHours" : ["creator": [0,1,2,3], "InviteeID1": [2,3,4,5]]]).environmentObject(AuthenticationViewModel())
    }
}
