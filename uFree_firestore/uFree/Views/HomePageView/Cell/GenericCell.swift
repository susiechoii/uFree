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

    var everyoneConfirmed: Bool!
    var allUserHours: [String: [Int]]!
    
    init(indexValue: Int, particularEvent: [String: Any]) {
        self.indexValue = indexValue
        
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
        
        self.everyoneConfirmed = particularEvent["everyoneConfirmed"] as! Bool
        self.allUserHours = particularEvent["allUserHours"] as! [String: [Int]]
    }
    
    var body: some View {
        VStack {
            ZStack {
                Image("img_nomadscalendar")
                    .resizable()
                    .frame(width: getRelativeWidth(325.0), height: getRelativeHeight(184.0),
                           alignment: .leading)
                    .scaledToFit()
                    .padding(.all, getRelativeWidth(8.0))
                    .padding(.vertical, getRelativeHeight(8.0))
                    .padding(.horizontal, getRelativeWidth(8.0))
            }
            .hideNavigationBar()
            .frame(width: getRelativeWidth(341.0), height: getRelativeHeight(200.0),
                   alignment: .leading)
            .background(ColorConstants.Blue100)
            
            if (everyoneConfirmed == true) {
                Text(self.date + " | " + self.time + " | Duration: " + String(describing: self.duration as! Int))
                        .font(FontScheme.kInterRegular(size: getRelativeHeight(14.0)))
                        .fontWeight(.regular)
                        .foregroundColor(ColorConstants.Bluegray600)
                        .minimumScaleFactor(0.5)
                        .multilineTextAlignment(.leading)
                        .frame(width: getRelativeWidth(206.0), height: getRelativeHeight(16.0),
                               alignment: .leading)
                        .padding(.top, getRelativeHeight(16.0))
                        .padding(.horizontal, getRelativeWidth(16.0))
            } else {
                Text(self.date + " | Time Pending | Duration: " + String(describing: self.duration as! Int))
                        .font(FontScheme.kInterRegular(size: getRelativeHeight(14.0)))
                        .fontWeight(.regular)
                        .foregroundColor(ColorConstants.Bluegray600)
                        .minimumScaleFactor(0.5)
                        .multilineTextAlignment(.leading)
                        .frame(width: getRelativeWidth(206.0), height: getRelativeHeight(16.0),
                               alignment: .leading)
                        .padding(.top, getRelativeHeight(16.0))
                        .padding(.horizontal, getRelativeWidth(16.0))
            }
            
            Text(self.title)
                .font(FontScheme.kInterBold(size: getRelativeHeight(24.0)))
                .fontWeight(.bold)
                .foregroundColor(ColorConstants.Black900)
                .minimumScaleFactor(0.5)
                .multilineTextAlignment(.leading)
                .frame(width: getRelativeWidth(86.0), height: getRelativeHeight(24.0),
                       alignment: .leading)
                .padding(.vertical, getRelativeHeight(5.0))
                .padding(.horizontal, getRelativeWidth(16.0))
        }
        .frame(width: getRelativeWidth(341.0), alignment: .leading)
        .background(RoundedCorners(topLeft: 16.0, topRight: 16.0, bottomLeft: 16.0,
                                   bottomRight: 16.0)
            .fill((!everyoneConfirmed && isCreator) ? ColorConstants.Amber100 : (!everyoneConfirmed && !isCreator) ? ColorConstants.Red401 : ColorConstants.WhiteA700))
        .shadow(color: ColorConstants.Black9001e, radius: 16, x: 0, y: 8)
        .hideNavigationBar()
    }
}



struct GenericCell_Previews: PreviewProvider {

 static var previews: some View {
     GenericCell(indexValue: 1, particularEvent: ["eventUID" : "1", "title" : "eventTitle", "date" : "", "description" : "Test Description", "duration": 1, "participantIDs" : ["UID1", "UID2"], "isCreator" : true, "isShared": false, "everyConfirmed" : true, "allUserHours" : ["creator" : [0,1,2,3]]]).environmentObject(AuthenticationViewModel())
 }
}
