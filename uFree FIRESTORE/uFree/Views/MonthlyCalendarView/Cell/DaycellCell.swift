import SwiftUI

struct DaycellCell: View {
    var body: some View {
        VStack {
            VStack {
                VStack {
                    Text(StringConstants.kLbl29)
                        .font(FontScheme.kRobotoRomanThin(size: getRelativeHeight(14.0)))
                        .fontWeight(.thin)
                        .foregroundColor(ColorConstants.Gray701)
                        .minimumScaleFactor(0.5)
                        .multilineTextAlignment(.leading)
                        .frame(width: getRelativeWidth(14.0), height: getRelativeHeight(14.0),
                               alignment: .leading)
                }
                .frame(width: getRelativeWidth(14.0), height: getRelativeHeight(14.0),
                       alignment: .leading)
                .clipShape(Capsule())
                .padding(.top, getRelativeHeight(33.0))
                .padding(.bottom, getRelativeHeight(32.0))
                .padding(.horizontal, getRelativeWidth(17.0))
            }
            .frame(width: getRelativeWidth(48.0), height: getRelativeHeight(80.0),
                   alignment: .leading)
            .background(RoundedCorners(topLeft: 8.0, topRight: 8.0, bottomLeft: 8.0,
                                       bottomRight: 8.0))
        }
        .frame(width: getRelativeWidth(49.0), alignment: .leading)
        .background(RoundedCorners(topLeft: 8.0, topRight: 8.0, bottomLeft: 8.0, bottomRight: 8.0))
        .hideNavigationBar()
    }
}

/* struct DaycellCell_Previews: PreviewProvider {

 static var previews: some View {
 			DaycellCell()
 }
 } */
