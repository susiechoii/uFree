//
//  CreatorConfirmTimeView.swift
//  uFree
//
//  Created by Leung Wai Liu on 12/3/22.
//

import SwiftUI
import Firebase

struct CreatorConfirmTimeView: View {
    @StateObject var optimalTimeViewModel = OptimalTimeViewModel()
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    @EnvironmentObject var viewModel: AuthenticationViewModel
    @Environment(\.dismiss) var dismiss
        
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
    
    private func finalizeEvent() {
        Task {
            if await viewModel.finalizeEvent(event: event) == true {
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
                    Text("Confirm an")
                        .font(FontScheme.kInterRegular(size: getRelativeHeight(25)))
                        .foregroundColor(ColorConstants.Bluegray900)
                        .minimumScaleFactor(0.5)
                        .multilineTextAlignment(.leading)
                        .frame(width: getRelativeWidth(108.0),
                               height: getRelativeHeight(25), alignment: .leading)
                    Text("Optimal Time")
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
                    ForEach(0 ... 6, id: \.self) { index in
                        
                        CreatorConfirmTimeCellView(index: index).environmentObject(viewModel)
                        
                        
                        
                    }
                }
                .padding(.horizontal, getRelativeWidth(25))
            }
            .frame(width: UIScreen.main.bounds.width, height: getRelativeHeight(500))
            
            
            
            // SAVE AND CONTINUE BUTTON
            Button(action: finalizeEvent, label: {
                Text("FINALIZE EVENT")
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
        .onAppear {
            // merging the availability of all the users
            var mergedUserHours:Set<Int> = Set(allUserHours["creator"] as! [Int])
            
            for (index, userHours) in allUserHours {
                let userHoursSet:Set<Int> = Set(userHours as! [Int])
                mergedUserHours = mergedUserHours.intersection(userHoursSet)
            }
            
            viewModel.inputCommonHours = Array(mergedUserHours)
            print("MERGED INPUT COMMON HOURS \(viewModel.inputCommonHours)")
            
        }
        
    }
}

struct CreatorConfirmTimeView_Previews: PreviewProvider {
    static var previews: some View {
        CreatorConfirmTimeView(particularEvent: ["title": "null", "everyoneConfirmed": true]).environmentObject(AuthenticationViewModel())
    }
}
