import SwiftUI

struct GenericCell: View {
    @EnvironmentObject var viewModel:AuthenticationViewModel
    var title: String!
//    var indexValue: Int!
//    var date: String!
//    var duration: String!
    
    
    init(particularEvent: [String: Any]) {
        title = particularEvent["title"] as! String
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
//            Text(self.date + " | Duration: " + self.duration)
//                .font(FontScheme.kInterRegular(size: getRelativeHeight(14.0)))
//                .fontWeight(.regular)
//                .foregroundColor(ColorConstants.Bluegray600)
//                .minimumScaleFactor(0.5)
//                .multilineTextAlignment(.leading)
//                .frame(width: getRelativeWidth(206.0), height: getRelativeHeight(16.0),
//                       alignment: .leading)
//                .padding(.top, getRelativeHeight(16.0))
//                .padding(.horizontal, getRelativeWidth(16.0))
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
                .fill(ColorConstants.WhiteA700))
        .shadow(color: ColorConstants.Black9001e, radius: 16, x: 0, y: 8)
        .hideNavigationBar()
    }
}

/* struct GenericCell_Previews: PreviewProvider {

 static var previews: some View {
 			GenericCell()
 }
 } */
