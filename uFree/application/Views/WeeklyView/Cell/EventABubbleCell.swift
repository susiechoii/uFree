import SwiftUI

struct EventABubbleCell: View {
    var body: some View {
        HStack {
            Text(StringConstants.kLblEventA)
                .font(FontScheme.kInterSemiBold(size: getRelativeHeight(12.0)))
                .fontWeight(.semibold)
                .foregroundColor(ColorConstants.WhiteA700)
                .minimumScaleFactor(0.5)
                .multilineTextAlignment(.leading)
                .frame(width: getRelativeWidth(44.0), height: getRelativeHeight(12.0),
                       alignment: .leading)
                .padding(.leading, getRelativeWidth(18.0))
            ZStack(alignment: .leading) {
                VStack {
                    Image("img_shutterstock18")
                        .resizable()
                        .frame(width: getRelativeWidth(16.0), height: getRelativeWidth(18.0),
                               alignment: .leading)
                        .scaledToFit()
                        .clipShape(Circle())
                        .clipShape(Capsule())
                        .padding(.horizontal, getRelativeWidth(1.0))
                }
                .frame(width: getRelativeWidth(19.0), height: getRelativeWidth(21.0),
                       alignment: .leading)
                .overlay(RoundedCorners(topLeft: 10.94, topRight: 10.94, bottomLeft: 10.94,
                                        bottomRight: 10.94)
                        .stroke(ColorConstants.Gray100,
                                lineWidth: 1))
                .background(RoundedCorners(topLeft: 10.94, topRight: 10.94, bottomLeft: 10.94,
                                           bottomRight: 10.94)
                        .fill(Color.clear.opacity(0.7)))
                .padding(.leading, getRelativeWidth(14.06))
                ZStack(alignment: .center) {
                    Image("img_shutterstock18")
                        .resizable()
                        .frame(width: getRelativeWidth(16.0), height: getRelativeWidth(18.0),
                               alignment: .leading)
                        .scaledToFit()
                        .clipShape(Circle())
                        .clipShape(Capsule())
                        .padding(.horizontal, getRelativeWidth(1.75))
                    Image("img_shutterstock19")
                        .resizable()
                        .frame(width: getRelativeWidth(16.0), height: getRelativeWidth(18.0),
                               alignment: .leading)
                        .scaledToFit()
                        .clipShape(Circle())
                        .clipShape(Capsule())
                        .padding(.horizontal, getRelativeWidth(1.75))
                }
                .hideNavigationBar()
                .frame(width: getRelativeWidth(19.0), height: getRelativeWidth(21.0),
                       alignment: .leading)
                .overlay(RoundedCorners(topLeft: 10.94, topRight: 10.94, bottomLeft: 10.94,
                                        bottomRight: 10.94)
                        .stroke(ColorConstants.Gray100,
                                lineWidth: 1))
                .background(RoundedCorners(topLeft: 10.94, topRight: 10.94, bottomLeft: 10.94,
                                           bottomRight: 10.94)
                        .fill(Color.clear.opacity(0.7)))
                .padding(.trailing, getRelativeWidth(14.0))
            }
            .hideNavigationBar()
            .frame(width: getRelativeWidth(33.0), height: getRelativeHeight(21.0),
                   alignment: .leading)
            .padding(.leading, getRelativeWidth(129.0))
            .padding(.trailing, getRelativeWidth(12.0))
        }
        .frame(width: getRelativeWidth(240.0), alignment: .leading)
        .background(RoundedCorners(topLeft: 14.0, topRight: 14.0, bottomLeft: 14.0,
                                   bottomRight: 14.0)
                .fill(ColorConstants.Red401))
        .hideNavigationBar()
    }
}

/* struct EventABubbleCell_Previews: PreviewProvider {

 static var previews: some View {
 			EventABubbleCell()
 }
 } */
