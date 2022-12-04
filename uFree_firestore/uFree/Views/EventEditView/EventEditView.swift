import SwiftUI

struct EventEditView: View {
    @StateObject var eventEditViewModel = EventEditViewModel()
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    var body: some View {
        VStack {
            VStack(alignment: .trailing, spacing: 0) {
                VStack(alignment: .leading, spacing: 0) {
                    VStack {
                        ScrollView(.horizontal, showsIndicators: false) {
                            ZStack(alignment: .bottomTrailing) {
                                Text(StringConstants.kMsgLetSEditYour)
                                    .font(FontScheme.kInterSemiBold(size: getRelativeHeight(24.0)))
                                    .fontWeight(.semibold)
                                    .foregroundColor(ColorConstants.Bluegray900)
                                    .minimumScaleFactor(0.5)
                                    .multilineTextAlignment(.leading)
                                    .frame(width: getRelativeWidth(158.0),
                                           height: getRelativeHeight(49.0), alignment: .topLeading)
                                    .padding(.bottom, getRelativeHeight(183.0))
                                    .padding(.trailing, getRelativeWidth(193.0))
                                ZStack(alignment: .bottomLeading) {
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
                                                .padding(.top, getRelativeHeight(43.0))
                                                .padding(.horizontal, getRelativeWidth(25.0))
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
                                                .padding(.horizontal, getRelativeWidth(25.0))
                                        }
                                        .frame(width: getRelativeWidth(73.0),
                                               height: getRelativeHeight(120.0), alignment: .center)
                                        .background(RoundedCorners(topLeft: 10.0, topRight: 10.0,
                                                                   bottomLeft: 10.0,
                                                                   bottomRight: 10.0)
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
                                                .padding(.top, getRelativeHeight(43.0))
                                                .padding(.horizontal, getRelativeWidth(25.0))
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
                                                .padding(.horizontal, getRelativeWidth(25.0))
                                        }
                                        .frame(width: getRelativeWidth(73.0),
                                               height: getRelativeHeight(120.0), alignment: .center)
                                        .background(RoundedCorners(topLeft: 10.0, topRight: 10.0,
                                                                   bottomLeft: 10.0,
                                                                   bottomRight: 10.0)
                                                .fill(ColorConstants.Red300))
                                        .padding(.leading, getRelativeWidth(12.0))
                                    }
                                    .frame(width: getRelativeWidth(158.0),
                                           height: getRelativeHeight(120.0),
                                           alignment: .bottomLeading)
                                    .padding(.top, getRelativeHeight(28.36))
                                    .padding(.trailing, getRelativeWidth(255.0))
                                    HStack {
                                        Image("img_rectangle9_120X73")
                                            .resizable()
                                            .frame(width: getRelativeWidth(73.0),
                                                   height: getRelativeHeight(120.0),
                                                   alignment: .center)
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
                                                    .padding(.top, getRelativeHeight(43.0))
                                                    .padding(.horizontal, getRelativeWidth(25.0))
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
                                                    .padding(.horizontal, getRelativeWidth(25.0))
                                            }
                                            .frame(width: getRelativeWidth(73.0),
                                                   height: getRelativeHeight(120.0),
                                                   alignment: .center)
                                            .background(RoundedCorners(topLeft: 10.0,
                                                                       topRight: 10.0,
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
                                                    .frame(width: getRelativeWidth(24.0),
                                                           height: getRelativeHeight(18.0),
                                                           alignment: .topLeading)
                                                    .padding(.top, getRelativeHeight(43.0))
                                                    .padding(.horizontal, getRelativeWidth(25.0))
                                                Text(StringConstants.kLblMo)
                                                    .font(FontScheme
                                                        .kInterRegular(size: getRelativeHeight(12.0)))
                                                    .fontWeight(.regular)
                                                    .foregroundColor(ColorConstants.Gray801)
                                                    .minimumScaleFactor(0.5)
                                                    .multilineTextAlignment(.leading)
                                                    .frame(width: getRelativeWidth(16.0),
                                                           height: getRelativeHeight(14.0),
                                                           alignment: .topLeading)
                                                    .padding(.vertical, getRelativeHeight(4.0))
                                                    .padding(.horizontal, getRelativeWidth(25.0))
                                            }
                                            .frame(width: getRelativeWidth(73.0),
                                                   height: getRelativeHeight(120.0),
                                                   alignment: .center)
                                            .background(RoundedCorners(topLeft: 10.0,
                                                                       topRight: 10.0,
                                                                       bottomLeft: 10.0,
                                                                       bottomRight: 10.0)
                                                    .fill(ColorConstants.Gray101))
                                            .padding(.leading, getRelativeWidth(12.0))
                                            Image("img_rectangle8_120X73")
                                                .resizable()
                                                .frame(width: getRelativeWidth(73.0),
                                                       height: getRelativeHeight(120.0),
                                                       alignment: .center)
                                                .scaledToFit()
                                                .clipped()
                                                .padding(.leading, getRelativeWidth(12.0))
                                        }
                                        .frame(width: getRelativeWidth(243.0),
                                               height: getRelativeHeight(120.0), alignment: .center)
                                        .padding(.leading, getRelativeWidth(182.0))
                                    }
                                    .frame(width: UIScreen.main.bounds.width,
                                           height: getRelativeHeight(121.0),
                                           alignment: .bottomLeading)
                                    .padding(.top, getRelativeHeight(27.36))
                                    Text(StringConstants.kMsgSelectYourDat)
                                        .font(FontScheme
                                            .kInterMedium(size: getRelativeHeight(16.0)))
                                        .fontWeight(.medium)
                                        .foregroundColor(ColorConstants.Bluegray900)
                                        .minimumScaleFactor(0.5)
                                        .multilineTextAlignment(.leading)
                                        .frame(width: getRelativeWidth(137.0),
                                               height: getRelativeHeight(16.0),
                                               alignment: .topLeading)
                                        .padding(.bottom, getRelativeHeight(132.0))
                                        .padding(.trailing, getRelativeWidth(276.0))
                                }
                                .hideNavigationBar()
                                .frame(width: UIScreen.main.bounds.width,
                                       height: getRelativeHeight(148.0),
                                       alignment: .bottomTrailing)
                                .padding(.top, getRelativeHeight(139.64))
                                Image("img_group6")
                                    .resizable()
                                    .frame(width: getRelativeWidth(271.0),
                                           height: getRelativeHeight(204.0), alignment: .center)
                                    .scaledToFit()
                                    .clipped()
                                    .padding(.bottom, getRelativeHeight(84.0))
                                    .padding(.leading, getRelativeWidth(165.0))
                            }
                            .hideNavigationBar()
                            .frame(width: UIScreen.main.bounds.width,
                                   height: getRelativeHeight(288.0), alignment: .leading)
                        }
                        Text(StringConstants.kMsgMeetingDuratio)
                            .font(FontScheme.kInterMedium(size: getRelativeHeight(16.0)))
                            .fontWeight(.medium)
                            .foregroundColor(ColorConstants.Bluegray900)
                            .minimumScaleFactor(0.5)
                            .multilineTextAlignment(.leading)
                            .frame(width: getRelativeWidth(135.0), height: getRelativeHeight(16.0),
                                   alignment: .topLeading)
                            .padding(.top, getRelativeHeight(35.0))
                            .padding(.horizontal, getRelativeWidth(85.0))
                        HStack {
                            Spacer()
                            VStack(alignment: .leading, spacing: 0) {
                                Text(StringConstants.kLblFrom)
                                    .font(FontScheme.kInterMedium(size: getRelativeHeight(12.0)))
                                    .fontWeight(.medium)
                                    .foregroundColor(ColorConstants.Bluegray300)
                                    .minimumScaleFactor(0.5)
                                    .multilineTextAlignment(.leading)
                                    .frame(width: getRelativeWidth(29.0),
                                           height: getRelativeHeight(12.0), alignment: .topLeading)
                                    .padding(.trailing)
                                Text(StringConstants.kLbl12002)
                                    .font(FontScheme.kInterBold(size: getRelativeHeight(24.0)))
                                    .fontWeight(.bold)
                                    .foregroundColor(ColorConstants.Bluegray900)
                                    .minimumScaleFactor(0.5)
                                    .multilineTextAlignment(.leading)
                                    .frame(width: getRelativeWidth(67.0),
                                           height: getRelativeHeight(24.0), alignment: .topLeading)
                                    .padding(.top, getRelativeHeight(8.0))
                            }
                            .frame(width: getRelativeWidth(67.0), height: getRelativeHeight(44.0),
                                   alignment: .center)
                            .padding(.top, getRelativeHeight(22.0))
                            .padding(.bottom, getRelativeHeight(21.0))
                            Image("img_arrowright_black_900")
                                .resizable()
                                .frame(width: getRelativeWidth(7.0),
                                       height: getRelativeHeight(14.0), alignment: .center)
                                .scaledToFit()
                                .clipped()
                                .padding(.vertical, getRelativeHeight(42.0))
                                .padding(.leading, getRelativeWidth(60.0))
                            VStack(alignment: .leading, spacing: 0) {
                                Text(StringConstants.kLblTo)
                                    .font(FontScheme.kInterMedium(size: getRelativeHeight(12.0)))
                                    .fontWeight(.medium)
                                    .foregroundColor(ColorConstants.Gray500)
                                    .minimumScaleFactor(0.5)
                                    .multilineTextAlignment(.leading)
                                    .frame(width: getRelativeWidth(13.0),
                                           height: getRelativeHeight(12.0), alignment: .topLeading)
                                    .padding(.trailing)
                                Text(StringConstants.kLbl14002)
                                    .font(FontScheme.kInterBold(size: getRelativeHeight(24.0)))
                                    .fontWeight(.bold)
                                    .foregroundColor(ColorConstants.Bluegray900)
                                    .minimumScaleFactor(0.5)
                                    .multilineTextAlignment(.leading)
                                    .frame(width: getRelativeWidth(71.0),
                                           height: getRelativeHeight(24.0), alignment: .topLeading)
                                    .padding(.top, getRelativeHeight(8.0))
                            }
                            .frame(width: getRelativeWidth(71.0), height: getRelativeHeight(44.0),
                                   alignment: .center)
                            .padding(.top, getRelativeHeight(21.0))
                            .padding(.bottom, getRelativeHeight(22.0))
                            .padding(.leading, getRelativeWidth(56.0))
                            .padding(.trailing, getRelativeWidth(33.0))
                        }
                        .frame(width: getRelativeWidth(328.0), height: getRelativeHeight(88.0),
                               alignment: .trailing)
                        .background(RoundedCorners(topLeft: 10.0, topRight: 10.0, bottomLeft: 10.0,
                                                   bottomRight: 10.0)
                                .fill(ColorConstants.Gray101))
                        .padding(.top, getRelativeHeight(12.0))
                        .padding(.horizontal, getRelativeWidth(23.0))
                        Text(StringConstants.kLblInvitees)
                            .font(FontScheme.kInterMedium(size: getRelativeHeight(16.0)))
                            .fontWeight(.medium)
                            .foregroundColor(ColorConstants.Bluegray900)
                            .minimumScaleFactor(0.5)
                            .multilineTextAlignment(.leading)
                            .frame(width: getRelativeWidth(61.0), height: getRelativeHeight(16.0),
                                   alignment: .topLeading)
                            .padding(.top, getRelativeHeight(19.0))
                            .padding(.horizontal, getRelativeWidth(85.0))
                        VStack(spacing: 0) {
                            ScrollView(.vertical, showsIndicators: false) {
                                LazyVStack {
                                    ForEach(0 ... 1, id: \.self) { index in
                                        Stackrectanglenineone1Cell()
                                    }
                                }
                            }
                        }
                        .frame(width: getRelativeWidth(321.0), alignment: .trailing)
                        .padding(.top, getRelativeHeight(11.0))
                        .padding(.horizontal, getRelativeWidth(26.0))
                        HStack {
                            Image("img_combinedshape_24X24")
                                .resizable()
                                .frame(width: getRelativeWidth(24.0),
                                       height: getRelativeWidth(24.0), alignment: .center)
                                .scaledToFit()
                                .clipped()
                            Text(StringConstants.kLblAddNewInvitee)
                                .font(FontScheme.kInterExtraLight(size: getRelativeHeight(12.0)))
                                .fontWeight(.ultraLight)
                                .foregroundColor(ColorConstants.Gray900)
                                .minimumScaleFactor(0.5)
                                .multilineTextAlignment(.leading)
                                .frame(width: getRelativeWidth(89.0),
                                       height: getRelativeHeight(12.0), alignment: .topLeading)
                                .padding(.top, getRelativeHeight(5.0))
                                .padding(.bottom, getRelativeHeight(6.0))
                                .padding(.leading, getRelativeWidth(11.0))
                        }
                        .frame(width: getRelativeWidth(124.0), height: getRelativeHeight(24.0),
                               alignment: .leading)
                        .padding(.top, getRelativeHeight(8.0))
                        .padding(.horizontal, getRelativeWidth(85.0))
                        VStack(alignment: .leading, spacing: 0) {
                            Text(StringConstants.kLblDescription)
                                .font(FontScheme.kInterMedium(size: getRelativeHeight(16.0)))
                                .fontWeight(.medium)
                                .foregroundColor(ColorConstants.Bluegray900)
                                .minimumScaleFactor(0.5)
                                .multilineTextAlignment(.leading)
                                .frame(width: getRelativeWidth(89.0),
                                       height: getRelativeHeight(16.0), alignment: .topLeading)
                                .padding(.trailing)
                            ZStack {}
                                .hideNavigationBar()
                                .frame(width: getRelativeWidth(328.0),
                                       height: getRelativeHeight(88.0), alignment: .leading)
                                .background(RoundedCorners(topLeft: 10.0, topRight: 10.0,
                                                           bottomLeft: 10.0, bottomRight: 10.0)
                                        .fill(ColorConstants.Gray101))
                                .padding(.top, getRelativeHeight(12.0))
                        }
                        .frame(width: getRelativeWidth(328.0), height: getRelativeHeight(116.0),
                               alignment: .trailing)
                        .background(RoundedCorners(topLeft: 10.0, topRight: 10.0, bottomLeft: 10.0,
                                                   bottomRight: 10.0))
                        .padding(.top, getRelativeHeight(19.0))
                        .padding(.horizontal, getRelativeWidth(23.0))
                    }
                    .frame(width: UIScreen.main.bounds.width, height: getRelativeHeight(711.0),
                           alignment: .leading)
                    .background(ColorConstants.WhiteA700)
                }
                .frame(width: UIScreen.main.bounds.width, height: getRelativeHeight(711.0),
                       alignment: .leading)
                VStack(alignment: .trailing, spacing: 0) {
                    Text("TabBars")
                        .minimumScaleFactor(0.5)
                        .multilineTextAlignment(.leading)
                        .frame(width: UIScreen.main.bounds.width, height: getRelativeHeight(96.0),
                               alignment: .trailing)
                }
                .frame(width: UIScreen.main.bounds.width, height: getRelativeHeight(96.0),
                       alignment: .leading)
                .padding(.top, getRelativeHeight(7.0))
            }
            .frame(width: UIScreen.main.bounds.width, alignment: .topLeading)
            .background(ColorConstants.WhiteA700)
            .padding(.top, getRelativeHeight(30.0))
            .padding(.bottom, getRelativeHeight(10.0))
        }
        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        .background(ColorConstants.WhiteA700)
        .ignoresSafeArea()
        .hideNavigationBar()
    }
}

struct EventEditView_Previews: PreviewProvider {
    static var previews: some View {
        EventEditView()
    }
}
