import SwiftUI

struct WeeklyView: View {
    @StateObject var weeklyViewModel = WeeklyViewModel()
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    var body: some View {
        NavigationView {
            ScrollView(.vertical, showsIndicators: false) {
                VStack(alignment: .leading, spacing: 0) {
                    ZStack(alignment: .topLeading) {
                        VStack {
                            ZStack {}
                                .hideNavigationBar()
                                .frame(width: getRelativeWidth(6.0), height: getRelativeWidth(6.0),
                                       alignment: .center)
                                .background(RoundedCorners(topLeft: 3.0, topRight: 3.0,
                                                           bottomLeft: 3.0, bottomRight: 3.0)
                                        .fill(ColorConstants.Red600))
                                .padding(.vertical, getRelativeHeight(66.0))
                                .padding(.horizontal, getRelativeWidth(24.0))
                        }
                        .frame(width: getRelativeWidth(53.0), height: getRelativeHeight(79.0),
                               alignment: .center)
                        .background(RoundedCorners(topLeft: 16.0, topRight: 16.0, bottomLeft: 16.0,
                                                   bottomRight: 16.0)
                                .fill(ColorConstants.Red50))
                        .padding(.leading, getRelativeWidth(143.0))
                        .padding(.trailing, getRelativeWidth(136.0))
                        HStack {
                            VStack(alignment: .leading, spacing: 0) {
                                Text(StringConstants.kLbl14)
                                    .font(FontScheme.kInterSemiBold(size: getRelativeHeight(18.0)))
                                    .fontWeight(.semibold)
                                    .foregroundColor(ColorConstants.Bluegray900)
                                    .minimumScaleFactor(0.5)
                                    .multilineTextAlignment(.leading)
                                    .frame(width: getRelativeWidth(24.0),
                                           height: getRelativeHeight(18.0), alignment: .topLeading)
                                Text(StringConstants.kLblMo)
                                    .font(FontScheme.kInterRegular(size: getRelativeHeight(12.0)))
                                    .fontWeight(.regular)
                                    .foregroundColor(ColorConstants.Bluegray300)
                                    .minimumScaleFactor(0.5)
                                    .multilineTextAlignment(.leading)
                                    .frame(width: getRelativeWidth(16.0),
                                           height: getRelativeHeight(14.0), alignment: .topLeading)
                                    .padding(.top, getRelativeHeight(4.0))
                                    .padding(.horizontal, getRelativeWidth(3.0))
                            }
                            .frame(width: getRelativeWidth(24.0), height: getRelativeHeight(36.0),
                                   alignment: .bottom)
                            VStack {
                                Text(StringConstants.kLbl15)
                                    .font(FontScheme.kInterSemiBold(size: getRelativeHeight(18.0)))
                                    .fontWeight(.semibold)
                                    .foregroundColor(ColorConstants.Bluegray900)
                                    .minimumScaleFactor(0.5)
                                    .multilineTextAlignment(.leading)
                                    .frame(width: getRelativeWidth(24.0),
                                           height: getRelativeHeight(18.0), alignment: .topLeading)
                                Text(StringConstants.kLblTu)
                                    .font(FontScheme.kInterRegular(size: getRelativeHeight(12.0)))
                                    .fontWeight(.regular)
                                    .foregroundColor(ColorConstants.Bluegray300)
                                    .minimumScaleFactor(0.5)
                                    .multilineTextAlignment(.leading)
                                    .frame(width: getRelativeWidth(12.0),
                                           height: getRelativeHeight(14.0), alignment: .topLeading)
                                    .padding(.top, getRelativeHeight(4.0))
                                    .padding(.horizontal, getRelativeWidth(5.0))
                            }
                            .frame(width: getRelativeWidth(24.0), height: getRelativeHeight(36.0),
                                   alignment: .bottom)
                            .padding(.leading, getRelativeWidth(26.0))
                            VStack(alignment: .leading, spacing: 0) {
                                Text(StringConstants.kLbl16)
                                    .font(FontScheme.kInterSemiBold(size: getRelativeHeight(18.0)))
                                    .fontWeight(.semibold)
                                    .foregroundColor(ColorConstants.Bluegray900)
                                    .minimumScaleFactor(0.5)
                                    .multilineTextAlignment(.leading)
                                    .frame(width: getRelativeWidth(18.0),
                                           height: getRelativeWidth(18.0), alignment: .topLeading)
                                    .padding(.horizontal, getRelativeWidth(3.0))
                                Text(StringConstants.kLblWed)
                                    .font(FontScheme.kInterRegular(size: getRelativeHeight(12.0)))
                                    .fontWeight(.regular)
                                    .foregroundColor(ColorConstants.Bluegray300)
                                    .minimumScaleFactor(0.5)
                                    .multilineTextAlignment(.leading)
                                    .frame(width: getRelativeWidth(24.0),
                                           height: getRelativeHeight(14.0), alignment: .topLeading)
                                    .padding(.top, getRelativeHeight(4.0))
                            }
                            .frame(width: getRelativeWidth(24.0), height: getRelativeHeight(36.0),
                                   alignment: .bottom)
                            .padding(.leading, getRelativeWidth(29.0))
                            VStack(alignment: .leading, spacing: 0) {
                                Text(StringConstants.kLbl17)
                                    .font(FontScheme.kInterBold(size: getRelativeHeight(20.0)))
                                    .fontWeight(.bold)
                                    .foregroundColor(ColorConstants.Red600)
                                    .minimumScaleFactor(0.5)
                                    .multilineTextAlignment(.leading)
                                    .frame(width: getRelativeWidth(24.0),
                                           height: getRelativeHeight(20.0), alignment: .topLeading)
                                Text(StringConstants.kLblTh)
                                    .font(FontScheme.kInterMedium(size: getRelativeHeight(14.0)))
                                    .fontWeight(.medium)
                                    .foregroundColor(ColorConstants.Red600)
                                    .minimumScaleFactor(0.5)
                                    .multilineTextAlignment(.leading)
                                    .frame(width: getRelativeWidth(16.0),
                                           height: getRelativeHeight(14.0), alignment: .topLeading)
                                    .padding(.top, getRelativeHeight(4.0))
                                    .padding(.horizontal, getRelativeWidth(3.0))
                            }
                            .frame(width: getRelativeWidth(24.0), height: getRelativeHeight(38.0),
                                   alignment: .bottom)
                            .padding(.leading, getRelativeWidth(30.0))
                            VStack {
                                Text(StringConstants.kLbl18)
                                    .font(FontScheme.kInterSemiBold(size: getRelativeHeight(18.0)))
                                    .fontWeight(.semibold)
                                    .foregroundColor(ColorConstants.Bluegray900)
                                    .minimumScaleFactor(0.5)
                                    .multilineTextAlignment(.leading)
                                    .frame(width: getRelativeWidth(24.0),
                                           height: getRelativeHeight(18.0), alignment: .topLeading)
                                Text(StringConstants.kLblFr)
                                    .font(FontScheme.kInterRegular(size: getRelativeHeight(12.0)))
                                    .fontWeight(.regular)
                                    .foregroundColor(ColorConstants.Bluegray300)
                                    .minimumScaleFactor(0.5)
                                    .multilineTextAlignment(.leading)
                                    .frame(width: getRelativeWidth(10.0),
                                           height: getRelativeHeight(14.0), alignment: .topLeading)
                                    .padding(.top, getRelativeHeight(4.0))
                                    .padding(.horizontal, getRelativeWidth(7.0))
                            }
                            .frame(width: getRelativeWidth(24.0), height: getRelativeHeight(36.0),
                                   alignment: .bottom)
                            .padding(.leading, getRelativeWidth(26.0))
                            VStack {
                                Text(StringConstants.kLbl19)
                                    .font(FontScheme.kInterSemiBold(size: getRelativeHeight(18.0)))
                                    .fontWeight(.semibold)
                                    .foregroundColor(ColorConstants.Bluegray900)
                                    .minimumScaleFactor(0.5)
                                    .multilineTextAlignment(.leading)
                                    .frame(width: getRelativeWidth(24.0),
                                           height: getRelativeHeight(18.0), alignment: .topLeading)
                                Text(StringConstants.kLblSa)
                                    .font(FontScheme.kInterRegular(size: getRelativeHeight(12.0)))
                                    .fontWeight(.regular)
                                    .foregroundColor(ColorConstants.Bluegray300)
                                    .minimumScaleFactor(0.5)
                                    .multilineTextAlignment(.leading)
                                    .frame(width: getRelativeWidth(13.0),
                                           height: getRelativeHeight(14.0), alignment: .topLeading)
                                    .padding(.top, getRelativeHeight(4.0))
                                    .padding(.horizontal, getRelativeWidth(5.0))
                            }
                            .frame(width: getRelativeWidth(24.0), height: getRelativeHeight(36.0),
                                   alignment: .bottom)
                            .padding(.leading, getRelativeWidth(26.0))
                            VStack {
                                Text(StringConstants.kLbl20)
                                    .font(FontScheme.kInterSemiBold(size: getRelativeHeight(18.0)))
                                    .fontWeight(.semibold)
                                    .foregroundColor(ColorConstants.Bluegray900)
                                    .minimumScaleFactor(0.5)
                                    .multilineTextAlignment(.leading)
                                    .frame(width: getRelativeWidth(24.0),
                                           height: getRelativeHeight(18.0), alignment: .topLeading)
                                Text(StringConstants.kLblSu)
                                    .font(FontScheme.kInterRegular(size: getRelativeHeight(12.0)))
                                    .fontWeight(.regular)
                                    .foregroundColor(ColorConstants.Bluegray300)
                                    .minimumScaleFactor(0.5)
                                    .multilineTextAlignment(.leading)
                                    .frame(width: getRelativeWidth(13.0),
                                           height: getRelativeHeight(14.0), alignment: .topLeading)
                                    .padding(.top, getRelativeHeight(4.0))
                                    .padding(.horizontal, getRelativeWidth(5.0))
                            }
                            .frame(width: getRelativeWidth(24.0), height: getRelativeHeight(36.0),
                                   alignment: .bottom)
                            .padding(.leading, getRelativeWidth(26.0))
                        }
                        .frame(width: getRelativeWidth(332.0), height: getRelativeHeight(40.0),
                               alignment: .topLeading)
                        .padding(.bottom, getRelativeHeight(23.0))
                    }
                    .hideNavigationBar()
                    .frame(width: getRelativeWidth(332.0), height: getRelativeHeight(79.0),
                           alignment: .leading)
                    HStack {
                        Text(StringConstants.kMsgTodaySSchedul)
                            .font(FontScheme.kInterSemiBold(size: getRelativeHeight(16.0)))
                            .fontWeight(.semibold)
                            .foregroundColor(ColorConstants.Bluegray900)
                            .minimumScaleFactor(0.5)
                            .multilineTextAlignment(.leading)
                            .frame(width: getRelativeWidth(138.0), height: getRelativeHeight(16.0),
                                   alignment: .topLeading)
                        Image("img_vector_10X10")
                            .resizable()
                            .frame(width: getRelativeWidth(10.0), height: getRelativeWidth(10.0),
                                   alignment: .center)
                            .scaledToFit()
                            .clipped()
                            .padding(.leading, getRelativeWidth(12.0))
                    }
                    .frame(width: getRelativeWidth(161.0), height: getRelativeHeight(16.0),
                           alignment: .leading)
                    .padding(.top, getRelativeHeight(7.0))
                    .padding(.trailing, getRelativeWidth(10.0))
                    HStack {
                        VStack(alignment: .leading, spacing: 0) {
                            Text(StringConstants.kLbl1200)
                                .font(FontScheme.kInterRegular(size: getRelativeHeight(12.0)))
                                .fontWeight(.regular)
                                .foregroundColor(ColorConstants.Bluegray300)
                                .minimumScaleFactor(0.5)
                                .multilineTextAlignment(.leading)
                                .frame(width: getRelativeWidth(34.0),
                                       height: getRelativeHeight(14.0), alignment: .topLeading)
                            Text(StringConstants.kLbl1400)
                                .font(FontScheme.kInterRegular(size: getRelativeHeight(12.0)))
                                .fontWeight(.regular)
                                .foregroundColor(ColorConstants.Bluegray300)
                                .minimumScaleFactor(0.5)
                                .multilineTextAlignment(.leading)
                                .frame(width: getRelativeWidth(34.0),
                                       height: getRelativeHeight(12.0), alignment: .topLeading)
                                .padding(.top, getRelativeHeight(33.0))
                            Text(StringConstants.kLbl1600)
                                .font(FontScheme.kInterRegular(size: getRelativeHeight(12.0)))
                                .fontWeight(.regular)
                                .foregroundColor(ColorConstants.Bluegray300)
                                .minimumScaleFactor(0.5)
                                .multilineTextAlignment(.leading)
                                .frame(width: getRelativeWidth(34.0),
                                       height: getRelativeHeight(14.0), alignment: .topLeading)
                                .padding(.top, getRelativeHeight(33.0))
                            Text(StringConstants.kLbl1800)
                                .font(FontScheme.kInterRegular(size: getRelativeHeight(12.0)))
                                .fontWeight(.regular)
                                .foregroundColor(ColorConstants.Bluegray300)
                                .minimumScaleFactor(0.5)
                                .multilineTextAlignment(.leading)
                                .frame(width: getRelativeWidth(34.0),
                                       height: getRelativeHeight(14.0), alignment: .topLeading)
                                .padding(.top, getRelativeHeight(34.0))
                            Text(StringConstants.kLbl2000)
                                .font(FontScheme.kInterRegular(size: getRelativeHeight(12.0)))
                                .fontWeight(.regular)
                                .foregroundColor(ColorConstants.Bluegray300)
                                .minimumScaleFactor(0.5)
                                .multilineTextAlignment(.leading)
                                .frame(width: getRelativeWidth(34.0),
                                       height: getRelativeHeight(12.0), alignment: .topLeading)
                                .padding(.top, getRelativeHeight(33.0))
                        }
                        .frame(width: getRelativeWidth(34.0), height: getRelativeHeight(200.0),
                               alignment: .center)
                        .padding(.vertical, getRelativeHeight(4.0))
                        .padding(.leading, getRelativeWidth(4.0))
                        Spacer()
                        VStack(spacing: 0) {
                            ScrollView(.vertical, showsIndicators: false) {
                                LazyVStack {
                                    ForEach(0 ... 1, id: \.self) { index in
                                        EventABubbleCell()
                                    }
                                }
                            }
                        }
                        .frame(width: getRelativeWidth(242.0), alignment: .center)
                    }
                    .frame(width: getRelativeWidth(327.0), height: getRelativeHeight(208.0),
                           alignment: .center)
                    .padding(.top, getRelativeHeight(28.0))
                    .padding(.horizontal, getRelativeWidth(2.0))
                    Text(StringConstants.kMsgTomorrowSEven)
                        .font(FontScheme.kInterSemiBold(size: getRelativeHeight(16.0)))
                        .fontWeight(.semibold)
                        .foregroundColor(ColorConstants.Bluegray900)
                        .minimumScaleFactor(0.5)
                        .multilineTextAlignment(.leading)
                        .frame(width: getRelativeWidth(150.0), height: getRelativeHeight(16.0),
                               alignment: .topLeading)
                        .padding(.top, getRelativeHeight(34.0))
                        .padding(.trailing, getRelativeWidth(10.0))
                    Text(StringConstants.kMsgSomeReminders)
                        .font(FontScheme.kInterRegular(size: getRelativeHeight(12.0)))
                        .fontWeight(.regular)
                        .foregroundColor(ColorConstants.Gray702)
                        .minimumScaleFactor(0.5)
                        .multilineTextAlignment(.leading)
                        .frame(width: getRelativeWidth(193.0), height: getRelativeHeight(12.0),
                               alignment: .topLeading)
                        .padding(.top, getRelativeHeight(11.0))
                        .padding(.trailing, getRelativeWidth(10.0))
                    VStack(spacing: 0) {
                        ScrollView(.vertical, showsIndicators: false) {
                            LazyVStack {
                                ForEach(0 ... 1, id: \.self) { index in
                                    BubbleContentsCell()
                                }
                            }
                        }
                    }
                    .frame(width: getRelativeWidth(328.0), alignment: .center)
                    .padding(.top, getRelativeHeight(13.0))
                    .padding(.horizontal, getRelativeWidth(1.0))
                }
                .frame(width: getRelativeWidth(332.0), alignment: .topLeading)
                Group {
                    NavigationLink(destination: EventCreationView(),
                                   tag: "EventCreationView",
                                   selection: $weeklyViewModel.nextScreen,
                                   label: {
                                       EmptyView()
                                   })
                    NavigationLink(destination: ProfileView(),
                                   tag: "ProfileView",
                                   selection: $weeklyViewModel.nextScreen,
                                   label: {
                                       EmptyView()
                                   })
                }
            }
            .hideNavigationBar()
        }
        .hideNavigationBar()
    }
}

struct WeeklyView_Previews: PreviewProvider {
    static var previews: some View {
        WeeklyView()
    }
}
