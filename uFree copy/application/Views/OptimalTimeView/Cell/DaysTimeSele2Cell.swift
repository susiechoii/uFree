import SwiftUI

struct DaysTimeSele2Cell: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text(StringConstants.kLbl8am)
                .font(FontScheme.kInterSemiBold(size: getRelativeHeight(12.0)))
                .fontWeight(.semibold)
                .foregroundColor(ColorConstants.Gray801)
                .minimumScaleFactor(0.5)
                .multilineTextAlignment(.leading)
                .frame(width: getRelativeWidth(47.0), height: getRelativeHeight(50.0),
                       alignment: .leading)
                .background(ColorConstants.Gray101)
                .padding(.leading, getRelativeWidth(12.0))
            Text(StringConstants.kLbl9am)
                .font(FontScheme.kInterSemiBold(size: getRelativeHeight(12.0)))
                .fontWeight(.semibold)
                .padding(.leading, getRelativeWidth(12.0))
                .padding(.bottom, getRelativeHeight(19.0))
                .padding(.top, getRelativeHeight(18.0))
                .foregroundColor(ColorConstants.Gray801)
                .minimumScaleFactor(0.5)
                .multilineTextAlignment(.leading)
                .frame(width: getRelativeWidth(47.0), height: getRelativeHeight(50.0),
                       alignment: .leading)
                .background(ColorConstants.Gray101)
                .padding(.top, getRelativeHeight(13.0))
            Text(StringConstants.kLbl10am)
                .font(FontScheme.kInterSemiBold(size: getRelativeHeight(12.0)))
                .fontWeight(.semibold)
                .padding(.leading, getRelativeWidth(6.0))
                .padding(.bottom, getRelativeHeight(19.0))
                .padding(.top, getRelativeHeight(18.0))
                .foregroundColor(ColorConstants.Gray801)
                .minimumScaleFactor(0.5)
                .multilineTextAlignment(.leading)
                .frame(width: getRelativeWidth(47.0), height: getRelativeHeight(50.0),
                       alignment: .leading)
                .background(ColorConstants.Lime100)
                .padding(.top, getRelativeHeight(13.0))
            Text(StringConstants.kLbl11am)
                .font(FontScheme.kInterSemiBold(size: getRelativeHeight(12.0)))
                .fontWeight(.semibold)
                .padding(.leading, getRelativeWidth(10.0))
                .padding(.bottom, getRelativeHeight(19.0))
                .padding(.top, getRelativeHeight(18.0))
                .foregroundColor(ColorConstants.Gray801)
                .minimumScaleFactor(0.5)
                .multilineTextAlignment(.leading)
                .frame(width: getRelativeWidth(47.0), height: getRelativeHeight(50.0),
                       alignment: .leading)
                .background(ColorConstants.Lime100)
                .padding(.top, getRelativeHeight(13.0))
            Text(StringConstants.kLbl12pm)
                .font(FontScheme.kInterSemiBold(size: getRelativeHeight(12.0)))
                .fontWeight(.semibold)
                .padding(.leading, getRelativeWidth(6.0))
                .padding(.bottom, getRelativeHeight(18.0))
                .padding(.top, getRelativeHeight(19.0))
                .foregroundColor(ColorConstants.Gray801)
                .minimumScaleFactor(0.5)
                .multilineTextAlignment(.leading)
                .frame(width: getRelativeWidth(47.0), height: getRelativeHeight(50.0),
                       alignment: .leading)
                .background(ColorConstants.Gray101)
                .padding(.top, getRelativeHeight(13.0))
            VStack {
                Text(StringConstants.kLbl1pm)
                    .font(FontScheme.kInterSemiBold(size: getRelativeHeight(12.0)))
                    .fontWeight(.semibold)
                    .foregroundColor(ColorConstants.Gray801)
                    .minimumScaleFactor(0.5)
                    .multilineTextAlignment(.leading)
                    .frame(width: getRelativeWidth(21.0), height: getRelativeHeight(12.0),
                           alignment: .leading)
                    .padding(.top, getRelativeHeight(19.0))
                    .padding(.bottom, getRelativeHeight(18.0))
                    .padding(.horizontal, getRelativeWidth(12.0))
            }
            .frame(width: getRelativeWidth(47.0), height: getRelativeHeight(50.0),
                   alignment: .leading)
            .background(RoundedCorners(topLeft: 10.0, topRight: 10.0, bottomLeft: 10.0,
                                       bottomRight: 10.0)
                    .fill(ColorConstants.Lime100))
            .padding(.top, getRelativeHeight(13.0))
            Text(StringConstants.kLbl2pm)
                .font(FontScheme.kInterSemiBold(size: getRelativeHeight(12.0)))
                .fontWeight(.semibold)
                .padding(.horizontal, getRelativeWidth(6.0))
                .padding(.vertical, getRelativeHeight(13.0))
                .foregroundColor(ColorConstants.Gray801)
                .minimumScaleFactor(0.5)
                .multilineTextAlignment(.center)
                .frame(width: getRelativeWidth(47.0), height: getRelativeHeight(50.0),
                       alignment: .center)
                .background(ColorConstants.Gray101)
                .padding(.top, getRelativeHeight(13.0))
        }
        .frame(width: getRelativeWidth(47.0), alignment: .leading)
        .hideNavigationBar()
    }
}

/* struct DaysTimeSele2Cell_Previews: PreviewProvider {

 static var previews: some View {
 			DaysTimeSele2Cell()
 }
 } */
