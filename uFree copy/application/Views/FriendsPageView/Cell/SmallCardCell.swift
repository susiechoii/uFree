import SwiftUI

struct SmallCardCell: View {
    var body: some View {
        VStack {
            Image("img_nomadsavatar_126X122")
                .resizable()
                .frame(width: getRelativeWidth(120.0), height: getRelativeHeight(126.0),
                       alignment: .leading)
                .scaledToFit()
                .padding(.top, getRelativeHeight(49.0))
                .padding(.horizontal, getRelativeWidth(16.0))
            HStack {
                Text(StringConstants.kLblNico)
                    .font(FontScheme.kNunitoExtraBold(size: getRelativeHeight(18.0)))
                    .fontWeight(.heavy)
                    .foregroundColor(ColorConstants.Bluegray600)
                    .minimumScaleFactor(0.5)
                    .multilineTextAlignment(.leading)
                    .frame(width: getRelativeWidth(33.0), height: getRelativeHeight(18.0),
                           alignment: .leading)
                Spacer()
                Text(StringConstants.kLblAdd)
                    .font(FontScheme.kMontserratRomanRegular(size: getRelativeHeight(14.0)))
                    .fontWeight(.regular)
                    .foregroundColor(ColorConstants.Bluegray600)
                    .minimumScaleFactor(0.5)
                    .multilineTextAlignment(.leading)
                    .frame(width: getRelativeWidth(27.0), height: getRelativeHeight(16.0),
                           alignment: .leading)
            }
            .frame(width: getRelativeWidth(120.0), height: getRelativeHeight(18.0),
                   alignment: .leading)
            .padding(.vertical, getRelativeHeight(35.0))
            .padding(.horizontal, getRelativeWidth(16.0))
        }
        .frame(width: getRelativeWidth(152.0), alignment: .leading)
        .background(RoundedCorners(topLeft: 16.0, topRight: 16.0, bottomLeft: 16.0,
                                   bottomRight: 16.0)
                .fill(ColorConstants.WhiteA700))
        .hideNavigationBar()
    }
}

/* struct SmallCardCell_Previews: PreviewProvider {

 static var previews: some View {
 			SmallCardCell()
 }
 } */
