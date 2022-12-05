import SwiftUI
import Firebase
import FirebaseFirestore

struct GenericCell: View {
    @EnvironmentObject var viewModel:AuthenticationViewModel
    
    // index value of generic cell as passed in from home model
    var indexValue: Int
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
    
    init(indexValue: Int, particularEvent: [String: Any]) {
        self.indexValue = indexValue
        
        self.eventUID = particularEvent["eventUID"] as! String
        self.title = particularEvent["title"] as! String
        
        var dateObject = (particularEvent["date"] as! Timestamp).dateValue()
        dateFormatter.locale = Locale(identifier: "en_US")
        dateFormatter.dateFormat = "E, MM/dd/yyyy"
        self.date = dateFormatter.string(from:dateObject)
        
        dateFormatter.dateFormat = "hh:mm a"
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
        // HStack for the original row
        HStack {
            
            // ZStack for the image
            ZStack {
                Image("img_nomadscampfire")
                    .resizable()
                    .frame(width: getRelativeWidth(129.0), height: getRelativeHeight(86.0),
                           alignment: .leading)
                    .scaledToFit()
                    .padding(.vertical, getRelativeHeight(16.0))
                    .padding(.horizontal, getRelativeWidth(16.0))
            }
            .frame(width: getRelativeWidth(161.0), height: getRelativeHeight(130.0),
                   alignment: .leading)
            .background(RoundedCorners(topLeft: 16.0, bottomLeft: 16.0)
                .fill(isShared ? (
                    
                    checkIfAllInviteesConfirmed() ?
                    (
                        isCreator ? (
                            !selfConfirmed ? ColorConstants.OrangeA200 : ColorConstants.Lime100
                        ) : !creatorConfirmed ? ColorConstants.Gray300 : ColorConstants.Lime100
                    ) : (
                        isCreator ? ColorConstants.Amber100 : (
                            selfConfirmed ? ColorConstants.Gray100 : ColorConstants.Red50
                        )
                    )
                    
                ) : ColorConstants.WhiteA700))
            
            // VStack for the details oon the row
            VStack(alignment: .leading, spacing: 0) {
                
                // Title Text
                Text(self.title)
                .font(FontScheme.kNunitoExtraBold(size: getRelativeHeight(24.0)))
                    .fontWeight(.heavy)
                    .foregroundColor(ColorConstants.Gray900)
                    .minimumScaleFactor(0.5)
                    .multilineTextAlignment(.leading)
                    .frame(width: getRelativeWidth(180), height: getRelativeHeight(60),
                           alignment: .leading)
                    .padding(.top, getRelativeHeight(15))
                
                // Date Text
                Text(self.date)
                    .font(FontScheme.kNunitoRegular(size: getRelativeHeight(16.0)))
                    .fontWeight(.regular)
                    .foregroundColor(ColorConstants.Bluegray600)
                    .minimumScaleFactor(0.5)
                    .multilineTextAlignment(.leading)
                    .frame(width: getRelativeWidth(200), height: getRelativeHeight(32.0),
                           alignment: .leading)
                    .padding(.trailing, getRelativeWidth(5))
                    .padding(.top, getRelativeHeight(-5))
                
                // Time text if creator confirmed, if not then says time pending
                if (creatorConfirmed) {
                    Text(self.time)
                        .font(FontScheme.kNunitoRegular(size: getRelativeHeight(16.0)))
                        .fontWeight(.regular)
                        .foregroundColor(ColorConstants.Bluegray600)
                        .minimumScaleFactor(0.5)
                        .multilineTextAlignment(.leading)
                        .frame(width: getRelativeWidth(103.0), height: getRelativeHeight(32.0),
                               alignment: .leading)
                        .padding(.trailing, getRelativeWidth(10.0))
                        .padding(.top, getRelativeHeight(-5))

                } else {
                    Text("Time Pending")
                        .font(FontScheme.kNunitoRegular(size: getRelativeHeight(16.0)))
                        .fontWeight(.regular)
                        .foregroundColor(ColorConstants.Bluegray600)
                        .minimumScaleFactor(0.5)
                        .multilineTextAlignment(.leading)
                        .frame(width: getRelativeWidth(103.0), height: getRelativeHeight(32.0),
                               alignment: .leading)
                        .padding(.trailing, getRelativeWidth(10.0))
                        .padding(.top, getRelativeHeight(-5))

                }
            }
            .frame(width: getRelativeWidth(153.0), height: getRelativeHeight(27.0),
                   alignment: .leading)
            .padding(.leading, getRelativeWidth(5))
            .padding (.bottom, getRelativeHeight(15))
            
        }
        .frame(width: getRelativeWidth(341.0), alignment: .leading)
        .overlay(RoundedCorners(topLeft: 16.0, topRight: 16.0, bottomLeft: 16.0, bottomRight: 16.0)
            .stroke(ColorConstants.WhiteA700,
                    lineWidth: 1))
        .background(RoundedCorners(topLeft: 16.0, topRight: 16.0, bottomLeft: 16.0,
                                   bottomRight: 16.0)
            .fill(ColorConstants.WhiteA700))
        .shadow(color: ColorConstants.Black9001e, radius: 12, x: 0, y: 6)
        .hideNavigationBar()
    }
}



struct GenericCell_Previews: PreviewProvider {
    
    static var previews: some View {
        GenericCell(indexValue: 1, particularEvent: ["eventUID" : "1", "title" : "eventTitle", "date" : "", "description" : "Test Description", "duration": 1, "participantIDs" : ["UID1", "UID2"], "isCreator" : true, "isShared": false, "everyConfirmed" : true, "allUserHours" : ["creator" : [0,1,2,3]]]).environmentObject(AuthenticationViewModel())
    }
}
