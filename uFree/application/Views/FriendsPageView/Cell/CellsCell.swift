import SwiftUI

struct CellsCell: View {
    var body: some View {
        HStack {
            HStack {
                ZStack {
                    Image("img_nomadsavatar_32X32")
                        .resizable()
                        .frame(width: getRelativeWidth(30.0), height: getRelativeWidth(32.0),
                               alignment: .leading)
                        .scaledToFit()
                        .padding(.all, getRelativeWidth(4.0))
                        .padding(.vertical, getRelativeHeight(4.0))
                        .padding(.horizontal, getRelativeWidth(4.0))
                }
                .hideNavigationBar()
                .frame(width: getRelativeWidth(38.0), height: getRelativeWidth(40.0),
                       alignment: .leading)
                .overlay(RoundedCorners(topLeft: 20.0, topRight: 20.0, bottomLeft: 20.0,
                                        bottomRight: 20.0)
                        .stroke(ColorConstants.Bluegray200,
                                lineWidth: 1))
                .background(RoundedCorners(topLeft: 20.0, topRight: 20.0, bottomLeft: 20.0,
                                           bottomRight: 20.0)
                        .fill(ColorConstants.WhiteA700))
                VStack(alignment: .leading, spacing: 0) {
                    Text(StringConstants.kLblLeungWaiLiu)
                        .font(FontScheme.kNunitoExtraBold(size: getRelativeHeight(16.0)))
                        .fontWeight(.heavy)
                        .foregroundColor(ColorConstants.Black900)
                        .minimumScaleFactor(0.5)
                        .multilineTextAlignment(.leading)
                        .frame(width: getRelativeWidth(105.0), height: getRelativeHeight(16.0),
                               alignment: .leading)
                    Text(StringConstants.kLblAdded010122)
                        .font(FontScheme.kMontserratRomanRegular(size: getRelativeHeight(14.0)))
                        .fontWeight(.regular)
                        .foregroundColor(ColorConstants.Bluegray600)
                        .minimumScaleFactor(0.5)
                        .multilineTextAlignment(.leading)
                        .frame(width: getRelativeWidth(101.0), height: getRelativeHeight(16.0),
                               alignment: .leading)
                        .padding(.trailing, getRelativeWidth(4.0))
                }
                .frame(width: getRelativeWidth(105.0), height: getRelativeHeight(35.0),
                       alignment: .leading)
                .padding(.leading, getRelativeWidth(8.0))
            }
            .frame(width: getRelativeWidth(153.0), height: getRelativeHeight(40.0),
                   alignment: .leading)
            .padding(.leading, getRelativeWidth(8.0))
            Divider()
                .frame(width: getRelativeWidth(2.0), height: getRelativeHeight(16.0),
                       alignment: .leading)
                .background(ColorConstants.Bluegray600)
                .padding(.leading, getRelativeWidth(157.0))
                .padding(.trailing, getRelativeWidth(18.0))
        }
        .frame(width: getRelativeWidth(341.0), alignment: .leading)
        .background(RoundedCorners(topLeft: 8.0, topRight: 8.0, bottomLeft: 8.0, bottomRight: 8.0)
            .fill(ColorConstants.WhiteA700))
        .hideNavigationBar()
    }
}

/* struct CellsCell_Previews: PreviewProvider {

 static var previews: some View {
 			CellsCell()
 }
 } */
