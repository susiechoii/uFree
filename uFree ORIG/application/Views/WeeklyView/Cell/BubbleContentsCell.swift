import SwiftUI

struct BubbleContentsCell: View {
    var body: some View {
        HStack {
            Button(action: {}, label: {
                Image("img_icon")
            })
            .frame(width: getRelativeWidth(46.0), height: getRelativeWidth(48.0),
                   alignment: .center)
            .background(RoundedCorners(topLeft: 10.0, topRight: 10.0, bottomLeft: 10.0,
                                       bottomRight: 10.0)
                    .fill(ColorConstants.Purple200))
            .padding(.leading, getRelativeWidth(10.0))
            VStack(alignment: .leading, spacing: 0) {
                Text(StringConstants.kLblEventD)
                    .font(FontScheme.kInterRegular(size: getRelativeHeight(12.0)))
                    .fontWeight(.regular)
                    .foregroundColor(ColorConstants.WhiteA700)
                    .minimumScaleFactor(0.5)
                    .multilineTextAlignment(.leading)
                    .frame(width: getRelativeWidth(45.0), height: getRelativeHeight(12.0),
                           alignment: .leading)
                    .padding(.trailing)
                HStack {
                    Image("img_vector_13X13")
                        .resizable()
                        .frame(width: getRelativeWidth(11.0), height: getRelativeWidth(13.0),
                               alignment: .leading)
                        .scaledToFit()
                    Text(StringConstants.kLbl15001800)
                        .font(FontScheme.kInterRegular(size: getRelativeHeight(10.0)))
                        .fontWeight(.regular)
                        .foregroundColor(ColorConstants.WhiteA700)
                        .minimumScaleFactor(0.5)
                        .multilineTextAlignment(.leading)
                        .frame(width: getRelativeWidth(66.0), height: getRelativeHeight(13.0),
                               alignment: .leading)
                        .padding(.leading, getRelativeWidth(7.0))
                }
                .frame(width: getRelativeWidth(86.0), height: getRelativeHeight(13.0),
                       alignment: .leading)
                .padding(.vertical, getRelativeHeight(11.0))
            }
            .frame(width: getRelativeWidth(88.0), height: getRelativeHeight(38.0),
                   alignment: .leading)
            .padding(.leading, getRelativeWidth(26.0))
            .padding(.trailing, getRelativeWidth(153.0))
        }
        .frame(width: getRelativeWidth(325.0), alignment: .leading)
        .background(RoundedCorners(topLeft: 10.0, topRight: 10.0, bottomLeft: 10.0,
                                   bottomRight: 10.0)
                .fill(ColorConstants.Purple300))
        .hideNavigationBar()
    }
}

/* struct BubbleContentsCell_Previews: PreviewProvider {

 static var previews: some View {
 			BubbleContentsCell()
 }
 } */
