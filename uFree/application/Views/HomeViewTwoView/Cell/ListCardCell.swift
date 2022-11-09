import SwiftUI

struct ListCardCell: View {
    var body: some View {
        HStack {
            ZStack {
                Image("img_nomadscampfire")
                    .resizable()
                    .frame(width: getRelativeWidth(129.0), height: getRelativeHeight(86.0),
                           alignment: .leading)
                    .scaledToFit()
                    .padding(.all, getRelativeWidth(16.0))
                    .padding(.vertical, getRelativeHeight(16.0))
                    .padding(.horizontal, getRelativeWidth(16.0))
            }
            .hideNavigationBar()
            .frame(width: getRelativeWidth(161.0), height: getRelativeHeight(118.0),
                   alignment: .leading)
            .background(RoundedCorners(topLeft: 16.0, bottomLeft: 16.0)
                .fill(ColorConstants.DeepPurple50))
            VStack(alignment: .leading, spacing: 0) {
                HStack {
                    Text(StringConstants.kLblEventA)
                        .font(FontScheme.kNunitoExtraBold(size: getRelativeHeight(24.0)))
                        .fontWeight(.heavy)
                        .foregroundColor(ColorConstants.Gray900)
                        .minimumScaleFactor(0.5)
                        .multilineTextAlignment(.leading)
                        .frame(width: getRelativeWidth(85.0), height: getRelativeHeight(24.0),
                               alignment: .leading)
                    Spacer()
                    Button(action: {}, label: {
                        HStack(spacing: 0) {
                            Text(StringConstants.kLblMon)
                                .font(FontScheme.kNunitoExtraBold(size: getRelativeHeight(14.0)))
                                .fontWeight(.heavy)
                                .padding(.horizontal, getRelativeWidth(10.0))
                                .padding(.vertical, getRelativeHeight(5.0))
                                .foregroundColor(ColorConstants.WhiteA700)
                                .minimumScaleFactor(0.5)
                                .multilineTextAlignment(.center)
                                .frame(width: getRelativeWidth(53.0),
                                       height: getRelativeHeight(27.0), alignment: .center)
                                .background(RoundedCorners(topLeft: 13.5, topRight: 13.5,
                                                           bottomLeft: 13.5, bottomRight: 13.5)
                                        .fill(ColorConstants.Gray900))
                        }
                    })
                    .frame(width: getRelativeWidth(53.0), height: getRelativeHeight(27.0),
                           alignment: .center)
                    .background(RoundedCorners(topLeft: 13.5, topRight: 13.5, bottomLeft: 13.5,
                                               bottomRight: 13.5)
                            .fill(ColorConstants.Gray900))
                }
                .frame(width: getRelativeWidth(153.0), height: getRelativeHeight(27.0),
                       alignment: .leading)
                Text(StringConstants.kMsgLocationHere2)
                    .font(FontScheme.kNunitoRegular(size: getRelativeHeight(16.0)))
                    .fontWeight(.regular)
                    .foregroundColor(ColorConstants.Bluegray600)
                    .minimumScaleFactor(0.5)
                    .multilineTextAlignment(.leading)
                    .frame(width: getRelativeWidth(103.0), height: getRelativeHeight(35.0),
                           alignment: .leading)
                    .padding(.top, getRelativeHeight(13.0))
                    .padding(.trailing, getRelativeWidth(10.0))
            }
            .frame(width: getRelativeWidth(153.0), height: getRelativeHeight(76.0),
                   alignment: .leading)
            .padding(.leading, getRelativeWidth(16.0))
            .padding(.trailing, getRelativeWidth(8.0))
        }
        .frame(width: getRelativeWidth(341.0), alignment: .leading)
        .overlay(RoundedCorners(topLeft: 16.0, topRight: 16.0, bottomLeft: 16.0, bottomRight: 16.0)
            .stroke(ColorConstants.WhiteA700,
                    lineWidth: 1))
        .background(RoundedCorners(topLeft: 16.0, topRight: 16.0, bottomLeft: 16.0,
                                   bottomRight: 16.0)
                .fill(ColorConstants.WhiteA700))
        .shadow(color: ColorConstants.Black9001e, radius: 24, x: 0, y: 12)
        .hideNavigationBar()
    }
}

/* struct ListCardCell_Previews: PreviewProvider {

 static var previews: some View {
 			ListCardCell()
 }
 } */
