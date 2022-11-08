import SwiftUI

struct StackrectanglenineoneCell: View {
    var body: some View {
        ZStack(alignment: .bottomLeading) {
            ZStack {}
                .hideNavigationBar()
                .frame(width: getRelativeWidth(298.0), height: getRelativeHeight(22.0),
                       alignment: .leading)
                .background(RoundedCorners(topLeft: 10.0, topRight: 10.0, bottomLeft: 10.0,
                                           bottomRight: 10.0)
                        .fill(ColorConstants.Gray101))
                .padding(.leading, getRelativeWidth(21.59))
            HStack {
                Image("img_vector_13X17")
                    .resizable()
                    .frame(width: getRelativeWidth(15.0), height: getRelativeHeight(13.0),
                           alignment: .leading)
                    .scaledToFit()
                Text(StringConstants.kMsgEnterInviteeE)
                    .font(FontScheme.kInterExtraLight(size: getRelativeHeight(12.0)))
                    .fontWeight(.ultraLight)
                    .foregroundColor(ColorConstants.Gray900)
                    .minimumScaleFactor(0.5)
                    .multilineTextAlignment(.leading)
                    .frame(width: getRelativeWidth(109.0), height: getRelativeHeight(12.0),
                           alignment: .leading)
                    .padding(.leading, getRelativeWidth(14.0))
            }
            .frame(width: getRelativeWidth(140.0), height: getRelativeHeight(13.0),
                   alignment: .leading)
            .padding(.top, getRelativeHeight(5.59))
            .padding(.trailing, getRelativeWidth(179.0))
        }
        .hideNavigationBar()
        .frame(width: getRelativeWidth(319.0), alignment: .leading)
    }
}

/* struct StackrectanglenineoneCell_Previews: PreviewProvider {

 static var previews: some View {
 			StackrectanglenineoneCell()
 }
 } */
