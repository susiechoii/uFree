import SwiftUI

struct OptimalTimeView: View {
    @StateObject var optimalTimeViewModel = OptimalTimeViewModel()
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    var body: some View {
        NavigationView {
            VStack {
                VStack(alignment: .trailing, spacing: 0) {
                    VStack(alignment: .leading, spacing: 0) {
                        VStack {
                            ZStack(alignment: .bottomLeading) {
                                Text(StringConstants.kMsgConfirmAnOpti)
                                    .font(FontScheme.kInterSemiBold(size: getRelativeHeight(24.0)))
                                    .fontWeight(.semibold)
                                    .foregroundColor(ColorConstants.Bluegray900)
                                    .minimumScaleFactor(0.5)
                                    .multilineTextAlignment(.leading)
                                    .frame(width: getRelativeWidth(194.0),
                                           height: getRelativeHeight(55.0), alignment: .topLeading)
                                    .padding(.bottom, getRelativeHeight(152.0))
                                    .padding(.trailing, getRelativeWidth(157.0))
                                VStack(alignment: .leading, spacing: 0) {
                                    Text(StringConstants.kMsgOptimalMeeting)
                                        .font(FontScheme
                                            .kInterMedium(size: getRelativeHeight(16.0)))
                                        .fontWeight(.medium)
                                        .foregroundColor(ColorConstants.Bluegray900)
                                        .minimumScaleFactor(0.5)
                                        .multilineTextAlignment(.leading)
                                        .frame(width: getRelativeWidth(173.0),
                                               height: getRelativeHeight(16.0),
                                               alignment: .topLeading)
                                        .padding(.trailing)
                                    HStack {
                                        VStack(alignment: .leading, spacing: 0) {
                                            HStack {
                                                Text(StringConstants.kLblSaturday)
                                                    .font(FontScheme
                                                        .kInterMedium(size: getRelativeHeight(18.0)))
                                                    .fontWeight(.medium)
                                                    .foregroundColor(ColorConstants.Bluegray300)
                                                    .minimumScaleFactor(0.5)
                                                    .multilineTextAlignment(.leading)
                                                    .frame(width: getRelativeWidth(78.0),
                                                           height: getRelativeHeight(19.0),
                                                           alignment: .topLeading)
                                                    .padding(.top, getRelativeHeight(5.0))
                                                Spacer()
                                                Text(StringConstants.kLbl1200Pm)
                                                    .font(FontScheme
                                                        .kInterBold(size: getRelativeHeight(22.0)))
                                                    .fontWeight(.bold)
                                                    .foregroundColor(ColorConstants.Bluegray900)
                                                    .minimumScaleFactor(0.5)
                                                    .multilineTextAlignment(.leading)
                                                    .frame(width: getRelativeWidth(82.0),
                                                           height: getRelativeHeight(22.0),
                                                           alignment: .topLeading)
                                            }
                                            .frame(width: getRelativeWidth(209.0),
                                                   height: getRelativeHeight(25.0),
                                                   alignment: .center)
                                            .padding(.top, getRelativeHeight(17.0))
                                            .padding(.horizontal, getRelativeWidth(11.0))
                                            Divider()
                                                .frame(width: getRelativeWidth(21.0),
                                                       height: getRelativeHeight(1.0),
                                                       alignment: .trailing)
                                                .background(ColorConstants.Bluegray300)
                                                .padding(.horizontal, getRelativeWidth(45.0))
                                            HStack {
                                                Text(StringConstants.kLblOctober23)
                                                    .font(FontScheme
                                                        .kInterBold(size: getRelativeHeight(18.0)))
                                                    .fontWeight(.bold)
                                                    .foregroundColor(ColorConstants.Bluegray900)
                                                    .minimumScaleFactor(0.5)
                                                    .multilineTextAlignment(.leading)
                                                    .frame(width: getRelativeWidth(101.0),
                                                           height: getRelativeHeight(18.0),
                                                           alignment: .topLeading)
                                                    .padding(.bottom, getRelativeHeight(6.0))
                                                Spacer()
                                                Text(StringConstants.kLbl200Pm)
                                                    .font(FontScheme
                                                        .kInterBold(size: getRelativeHeight(22.0)))
                                                    .fontWeight(.bold)
                                                    .foregroundColor(ColorConstants.Bluegray900)
                                                    .minimumScaleFactor(0.5)
                                                    .multilineTextAlignment(.leading)
                                                    .frame(width: getRelativeWidth(71.0),
                                                           height: getRelativeHeight(22.0),
                                                           alignment: .topLeading)
                                            }
                                            .frame(width: getRelativeWidth(209.0),
                                                   height: getRelativeHeight(24.0),
                                                   alignment: .center)
                                            .padding(.vertical, getRelativeHeight(1.0))
                                            .padding(.horizontal, getRelativeWidth(11.0))
                                        }
                                        .frame(width: getRelativeWidth(235.0),
                                               height: getRelativeHeight(88.0), alignment: .center)
                                        .background(RoundedCorners(topLeft: 10.0, topRight: 10.0,
                                                                   bottomLeft: 10.0,
                                                                   bottomRight: 10.0)
                                                .fill(ColorConstants.Gray101))
                                        Spacer()
                                        ZStack(alignment: .topTrailing) {
                                            Divider()
                                                .frame(width: getRelativeWidth(15.0),
                                                       height: getRelativeHeight(14.0),
                                                       alignment: .bottomLeading)
                                                .background(ColorConstants.Black900)
                                                .padding(.top, getRelativeHeight(47.0))
                                                .padding(.trailing, getRelativeWidth(48.5))
                                            Divider()
                                                .frame(width: getRelativeWidth(22.0),
                                                       height: getRelativeHeight(30.0),
                                                       alignment: .topTrailing)
                                                .background(ColorConstants.Black900)
                                                .padding(.bottom, getRelativeHeight(31.0))
                                                .padding(.leading, getRelativeWidth(36.5))
                                        }
                                        .hideNavigationBar()
                                        .frame(width: getRelativeWidth(88.0),
                                               height: getRelativeWidth(88.0), alignment: .center)
                                        .background(RoundedCorners(topLeft: 10.0, topRight: 10.0,
                                                                   bottomLeft: 10.0,
                                                                   bottomRight: 10.0)
                                                .fill(ColorConstants.Lime100))
                                    }
                                    .frame(width: getRelativeWidth(331.0),
                                           height: getRelativeHeight(88.0), alignment: .leading)
                                    .padding(.top, getRelativeHeight(12.0))
                                }
                                .frame(width: getRelativeWidth(331.0),
                                       height: getRelativeHeight(116.0), alignment: .bottomLeading)
                                .background(RoundedCorners(topLeft: 10.0, topRight: 10.0,
                                                           bottomLeft: 10.0, bottomRight: 10.0))
                                .padding(.top, getRelativeHeight(146.68))
                                .padding(.trailing, getRelativeWidth(20.0))
                                Image("img_group6")
                                    .resizable()
                                    .frame(width: getRelativeWidth(271.0),
                                           height: getRelativeHeight(204.0), alignment: .center)
                                    .scaledToFit()
                                    .clipped()
                                    .padding(.bottom, getRelativeHeight(59.0))
                                    .padding(.leading, getRelativeWidth(80.0))
                            }
                            .hideNavigationBar()
                            .frame(width: getRelativeWidth(351.0), height: getRelativeHeight(263.0),
                                   alignment: .trailing)
                            .padding(.leading, getRelativeWidth(10.0))
                            ZStack(alignment: .topLeading) {
                                HStack {
                                    VStack {
                                        Text(StringConstants.kLbl22)
                                            .font(FontScheme
                                                .kInterSemiBold(size: getRelativeHeight(18.0)))
                                            .fontWeight(.semibold)
                                            .foregroundColor(ColorConstants.Gray801)
                                            .minimumScaleFactor(0.5)
                                            .multilineTextAlignment(.leading)
                                            .frame(width: getRelativeWidth(24.0),
                                                   height: getRelativeHeight(18.0),
                                                   alignment: .topLeading)
                                            .padding(.top, getRelativeHeight(25.0))
                                            .padding(.horizontal, getRelativeWidth(23.0))
                                        Text(StringConstants.kLblFri)
                                            .font(FontScheme
                                                .kInterRegular(size: getRelativeHeight(12.0)))
                                            .fontWeight(.regular)
                                            .foregroundColor(ColorConstants.Gray801)
                                            .minimumScaleFactor(0.5)
                                            .multilineTextAlignment(.leading)
                                            .frame(width: getRelativeWidth(13.0),
                                                   height: getRelativeHeight(14.0),
                                                   alignment: .topLeading)
                                            .padding(.vertical, getRelativeHeight(4.0))
                                            .padding(.horizontal, getRelativeWidth(23.0))
                                    }
                                    .frame(width: getRelativeWidth(72.0),
                                           height: getRelativeHeight(75.0), alignment: .center)
                                    .background(RoundedCorners(topLeft: 10.0, topRight: 10.0,
                                                               bottomLeft: 10.0, bottomRight: 10.0)
                                            .fill(ColorConstants.Gray101))
                                    VStack {
                                        Text(StringConstants.kLbl23)
                                            .font(FontScheme
                                                .kInterSemiBold(size: getRelativeHeight(18.0)))
                                            .fontWeight(.semibold)
                                            .foregroundColor(ColorConstants.WhiteA700)
                                            .minimumScaleFactor(0.5)
                                            .multilineTextAlignment(.leading)
                                            .frame(width: getRelativeWidth(24.0),
                                                   height: getRelativeHeight(18.0),
                                                   alignment: .topLeading)
                                            .padding(.top, getRelativeHeight(20.0))
                                            .padding(.horizontal, getRelativeWidth(23.0))
                                        Text(StringConstants.kLblSat)
                                            .font(FontScheme
                                                .kInterRegular(size: getRelativeHeight(12.0)))
                                            .fontWeight(.regular)
                                            .foregroundColor(ColorConstants.WhiteA700)
                                            .minimumScaleFactor(0.5)
                                            .multilineTextAlignment(.leading)
                                            .frame(width: getRelativeWidth(24.0),
                                                   height: getRelativeHeight(14.0),
                                                   alignment: .topLeading)
                                            .padding(.vertical, getRelativeHeight(4.0))
                                            .padding(.horizontal, getRelativeWidth(23.0))
                                    }
                                    .frame(width: getRelativeWidth(72.0),
                                           height: getRelativeHeight(75.0), alignment: .center)
                                    .background(RoundedCorners(topLeft: 10.0, topRight: 10.0,
                                                               bottomLeft: 10.0, bottomRight: 10.0)
                                            .fill(ColorConstants.Red300))
                                    .padding(.leading, getRelativeWidth(11.0))
                                }
                                .frame(width: getRelativeWidth(156.0),
                                       height: getRelativeHeight(75.0), alignment: .topLeading)
                                .padding(.bottom, getRelativeHeight(454.56))
                                .padding(.trailing, getRelativeWidth(252.85))
                                HStack {
                                    Image("img_rectangle9_2")
                                        .resizable()
                                        .frame(width: getRelativeWidth(72.0),
                                               height: getRelativeHeight(75.0), alignment: .center)
                                        .scaledToFit()
                                        .clipped()
                                    HStack {
                                        VStack {
                                            Text(StringConstants.kLbl24)
                                                .font(FontScheme
                                                    .kInterSemiBold(size: getRelativeHeight(18.0)))
                                                .fontWeight(.semibold)
                                                .foregroundColor(ColorConstants.Gray801)
                                                .minimumScaleFactor(0.5)
                                                .multilineTextAlignment(.leading)
                                                .frame(width: getRelativeWidth(24.0),
                                                       height: getRelativeHeight(18.0),
                                                       alignment: .topLeading)
                                                .padding(.top, getRelativeHeight(25.0))
                                                .padding(.horizontal, getRelativeWidth(24.0))
                                            Text(StringConstants.kLblSun)
                                                .font(FontScheme
                                                    .kInterRegular(size: getRelativeHeight(12.0)))
                                                .fontWeight(.regular)
                                                .foregroundColor(ColorConstants.Gray801)
                                                .minimumScaleFactor(0.5)
                                                .multilineTextAlignment(.leading)
                                                .frame(width: getRelativeWidth(24.0),
                                                       height: getRelativeHeight(14.0),
                                                       alignment: .topLeading)
                                                .padding(.vertical, getRelativeHeight(4.0))
                                                .padding(.horizontal, getRelativeWidth(24.0))
                                        }
                                        .frame(width: getRelativeWidth(72.0),
                                               height: getRelativeHeight(75.0), alignment: .center)
                                        .background(RoundedCorners(topLeft: 10.0, topRight: 10.0,
                                                                   bottomLeft: 10.0,
                                                                   bottomRight: 10.0)
                                                .fill(ColorConstants.Gray101))
                                        VStack {
                                            Text(StringConstants.kLbl25)
                                                .font(FontScheme
                                                    .kInterSemiBold(size: getRelativeHeight(18.0)))
                                                .fontWeight(.semibold)
                                                .foregroundColor(ColorConstants.Gray801)
                                                .minimumScaleFactor(0.5)
                                                .multilineTextAlignment(.leading)
                                                .frame(width: getRelativeWidth(20.0),
                                                       height: getRelativeHeight(18.0),
                                                       alignment: .topLeading)
                                                .padding(.top, getRelativeHeight(25.0))
                                                .padding(.horizontal, getRelativeWidth(22.0))
                                            Text(StringConstants.kLblMon2)
                                                .font(FontScheme
                                                    .kInterRegular(size: getRelativeHeight(12.0)))
                                                .fontWeight(.regular)
                                                .foregroundColor(ColorConstants.Gray801)
                                                .minimumScaleFactor(0.5)
                                                .multilineTextAlignment(.leading)
                                                .frame(width: getRelativeWidth(28.0),
                                                       height: getRelativeHeight(14.0),
                                                       alignment: .topLeading)
                                                .padding(.vertical, getRelativeHeight(4.0))
                                                .padding(.horizontal, getRelativeWidth(22.0))
                                        }
                                        .frame(width: getRelativeWidth(72.0),
                                               height: getRelativeHeight(75.0), alignment: .center)
                                        .background(RoundedCorners(topLeft: 10.0, topRight: 10.0,
                                                                   bottomLeft: 10.0,
                                                                   bottomRight: 10.0)
                                                .fill(ColorConstants.Gray101))
                                        .padding(.leading, getRelativeWidth(11.0))
                                        Image("img_rectangle8_2")
                                            .resizable()
                                            .frame(width: getRelativeWidth(72.0),
                                                   height: getRelativeHeight(75.0),
                                                   alignment: .center)
                                            .scaledToFit()
                                            .clipped()
                                            .padding(.leading, getRelativeWidth(11.0))
                                    }
                                    .frame(width: getRelativeWidth(240.0),
                                           height: getRelativeHeight(75.0), alignment: .center)
                                    .padding(.leading, getRelativeWidth(180.0))
                                }
                                .frame(width: UIScreen.main.bounds.width,
                                       height: getRelativeHeight(75.0), alignment: .topLeading)
                                .padding(.bottom, getRelativeHeight(455.18))
                                Text(StringConstants.kMsgChooseAlternat)
                                    .font(FontScheme.kInterMedium(size: getRelativeHeight(16.0)))
                                    .fontWeight(.medium)
                                    .foregroundColor(ColorConstants.Bluegray900)
                                    .minimumScaleFactor(0.5)
                                    .multilineTextAlignment(.leading)
                                    .frame(width: getRelativeWidth(178.0),
                                           height: getRelativeHeight(16.0), alignment: .topLeading)
                                    .padding(.bottom, getRelativeHeight(554.0))
                                    .padding(.trailing, getRelativeWidth(230.0))
                                HStack(spacing: 0) {
                                    ScrollView(.horizontal, showsIndicators: false) {
                                        LazyHStack {
                                            ForEach(0 ... 3, id: \.self) { index in
                                                DaysTimeSele2Cell()
                                            }
                                        }
                                    }
                                }
                                .frame(width: getRelativeWidth(301.0), alignment: .center)
                                .padding(.top, getRelativeHeight(142.81))
                                .padding(.horizontal, getRelativeWidth(96.0))
                            }
                            .hideNavigationBar()
                            .frame(width: UIScreen.main.bounds.width,
                                   height: getRelativeHeight(570.0), alignment: .trailing)
                            .padding(.top, getRelativeHeight(39.0))
                        }
                        .frame(width: UIScreen.main.bounds.width,
                               height: UIScreen.main.bounds.height,
                               alignment: .topLeading)
                        .background(ColorConstants.WhiteA700)
                    }
                    .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height,
                           alignment: .topLeading)
                    VStack(alignment: .trailing, spacing: 0) {
                        Text("TabBars")
                            .minimumScaleFactor(0.5)
                            .multilineTextAlignment(.leading)
                            .frame(width: UIScreen.main.bounds.width,
                                   height: getRelativeHeight(96.0), alignment: .trailing)
                    }
                    .frame(width: UIScreen.main.bounds.width, height: getRelativeHeight(96.0),
                           alignment: .leading)
                }
                .frame(width: UIScreen.main.bounds.width, alignment: .topLeading)
                .background(ColorConstants.WhiteA700)
                .padding(.top, getRelativeHeight(30.0))
                .padding(.bottom, getRelativeHeight(10.0))
                Group {
                    NavigationLink(destination: EventCreationView(),
                                   tag: "EventCreationView",
                                   selection: $optimalTimeViewModel.nextScreen,
                                   label: {
                                       EmptyView()
                                   })
                }
            }
            .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
            .background(ColorConstants.WhiteA700)
            .ignoresSafeArea()
            .hideNavigationBar()
        }
        .hideNavigationBar()
    }
}

struct OptimalTimeView_Previews: PreviewProvider {
    static var previews: some View {
        OptimalTimeView()
    }
}
