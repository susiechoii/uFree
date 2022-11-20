import SwiftUI

struct HomeViewFiveView: View {
    @StateObject var homeViewFiveViewModel = HomeViewFiveViewModel()
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    var body: some View {
        NavigationView {
            VStack {
                VStack {
                    VStack {
                        VStack(alignment: .leading, spacing: 0) {
                            HStack {
                                HStack {
                                    HStack {
                                        Spacer()
                                        Image("img_search_bluegray_600")
                                            .resizable()
                                            .frame(width: getRelativeWidth(11.0),
                                                   height: getRelativeWidth(11.0),
                                                   alignment: .center)
                                            .scaledToFit()
                                            .clipped()
                                            .padding(.vertical, getRelativeHeight(14.0))
                                            .padding(.leading, getRelativeWidth(14.0))
                                            .padding(.trailing, getRelativeWidth(10.0))
                                        TextField(StringConstants.kLblSearch,
                                                  text: $homeViewFiveViewModel.input)
                                            .font(FontScheme
                                                .kNunitoRegular(size: getRelativeHeight(14.0)))
                                            .foregroundColor(ColorConstants.Bluegray600)
                                            .padding()
                                    }
                                    .frame(width: getRelativeWidth(295.0),
                                           height: getRelativeHeight(40.0), alignment: .center)
                                    .overlay(RoundedCorners(topLeft: 4.0, topRight: 4.0,
                                                            bottomLeft: 4.0, bottomRight: 4.0)
                                            .stroke(ColorConstants.Bluegray200,
                                                    lineWidth: 1))
                                    .background(RoundedCorners(topLeft: 4.0, topRight: 4.0,
                                                               bottomLeft: 4.0, bottomRight: 4.0)
                                            .fill(ColorConstants.WhiteA700))
                                    Spacer()
                                    Image("img_nomadsavatar")
                                        .resizable()
                                        .frame(width: getRelativeWidth(32.0),
                                               height: getRelativeWidth(32.0), alignment: .center)
                                        .scaledToFit()
                                        .clipped()
                                        .padding(.vertical, getRelativeHeight(4.0))
                                }
                                .frame(width: getRelativeWidth(343.0),
                                       height: getRelativeHeight(40.0), alignment: .leading)
                            }
                            .frame(width: getRelativeWidth(343.0), height: getRelativeHeight(40.0),
                                   alignment: .leading)
                            Text(StringConstants.kLblEventSettings)
                                .font(FontScheme.kInterSemiBold(size: getRelativeHeight(32.0)))
                                .fontWeight(.semibold)
                                .foregroundColor(ColorConstants.Gray900)
                                .minimumScaleFactor(0.5)
                                .multilineTextAlignment(.leading)
                                .frame(width: getRelativeWidth(211.0),
                                       height: getRelativeHeight(33.0), alignment: .topLeading)
                                .padding(.top, getRelativeHeight(23.0))
                                .padding(.trailing, getRelativeWidth(10.0))
                            Image("img_items_1")
                                .resizable()
                                .frame(width: getRelativeWidth(343.0),
                                       height: getRelativeHeight(64.0), alignment: .center)
                                .scaledToFit()
                                .clipped()
                                .padding(.top, getRelativeHeight(16.0))
                            HStack {
                                HStack {
                                    Image("img_vector_23X30")
                                        .resizable()
                                        .frame(width: getRelativeWidth(30.0),
                                               height: getRelativeHeight(23.0), alignment: .center)
                                        .scaledToFit()
                                        .clipped()
                                    VStack(alignment: .leading, spacing: 0) {
                                        Text(StringConstants.kMsgAvailabilitySe)
                                            .font(FontScheme
                                                .kRalewaySemiBold(size: getRelativeHeight(16.0)))
                                            .fontWeight(.semibold)
                                            .foregroundColor(ColorConstants.Gray900)
                                            .minimumScaleFactor(0.5)
                                            .multilineTextAlignment(.leading)
                                            .frame(width: getRelativeWidth(148.0),
                                                   height: getRelativeHeight(17.0),
                                                   alignment: .topLeading)
                                        Text(StringConstants.kMsgChangeSchedule)
                                            .font(FontScheme
                                                .kRalewayRegular(size: getRelativeHeight(12.0)))
                                            .fontWeight(.regular)
                                            .foregroundColor(ColorConstants.Bluegray600)
                                            .minimumScaleFactor(0.5)
                                            .multilineTextAlignment(.leading)
                                            .frame(width: getRelativeWidth(144.0),
                                                   height: getRelativeHeight(12.0),
                                                   alignment: .topLeading)
                                            .padding(.top, getRelativeHeight(7.0))
                                    }
                                    .frame(width: getRelativeWidth(148.0),
                                           height: getRelativeHeight(37.0), alignment: .center)
                                    .padding(.leading, getRelativeWidth(15.0))
                                }
                                .frame(width: getRelativeWidth(193.0),
                                       height: getRelativeHeight(37.0), alignment: .bottom)
                                .padding(.vertical, getRelativeHeight(14.0))
                                .padding(.leading, getRelativeWidth(8.0))
                                Spacer()
                                Image("img_arrowright")
                                    .resizable()
                                    .frame(width: getRelativeWidth(4.0),
                                           height: getRelativeHeight(9.0), alignment: .center)
                                    .scaledToFit()
                                    .clipped()
                                    .padding(.vertical, getRelativeHeight(25.0))
                                    .padding(.trailing, getRelativeWidth(13.0))
                            }
                            .frame(width: getRelativeWidth(343.0), height: getRelativeHeight(60.0),
                                   alignment: .leading)
                            .overlay(RoundedCorners(topLeft: 8.0, topRight: 8.0, bottomLeft: 8.0,
                                                    bottomRight: 8.0)
                                    .stroke(ColorConstants.Bluegray50,
                                            lineWidth: 1))
                            .background(RoundedCorners(topLeft: 8.0, topRight: 8.0, bottomLeft: 8.0,
                                                       bottomRight: 8.0)
                                    .fill(ColorConstants.WhiteA700))
                            .padding(.top, getRelativeHeight(33.0))
                            HStack {
                                HStack {
                                    Image("img_callmissed")
                                        .resizable()
                                        .frame(width: getRelativeWidth(30.0),
                                               height: getRelativeWidth(30.0), alignment: .center)
                                        .scaledToFit()
                                        .clipped()
                                    VStack(alignment: .leading, spacing: 0) {
                                        Text(StringConstants.kLblBlocklist)
                                            .font(FontScheme
                                                .kRalewaySemiBold(size: getRelativeHeight(16.0)))
                                            .fontWeight(.semibold)
                                            .foregroundColor(ColorConstants.Gray900)
                                            .minimumScaleFactor(0.5)
                                            .multilineTextAlignment(.leading)
                                            .frame(width: getRelativeWidth(65.0),
                                                   height: getRelativeHeight(16.0),
                                                   alignment: .topLeading)
                                            .padding(.trailing)
                                        Text(StringConstants.kMsgManageBlocked)
                                            .font(FontScheme
                                                .kRalewayRegular(size: getRelativeHeight(12.0)))
                                            .fontWeight(.regular)
                                            .foregroundColor(ColorConstants.Bluegray600)
                                            .minimumScaleFactor(0.5)
                                            .multilineTextAlignment(.leading)
                                            .frame(width: getRelativeWidth(127.0),
                                                   height: getRelativeHeight(12.0),
                                                   alignment: .topLeading)
                                            .padding(.top, getRelativeHeight(11.0))
                                    }
                                    .frame(width: getRelativeWidth(127.0),
                                           height: getRelativeHeight(39.0), alignment: .center)
                                    .padding(.leading, getRelativeWidth(15.0))
                                }
                                .frame(width: getRelativeWidth(172.0),
                                       height: getRelativeHeight(39.0), alignment: .bottom)
                                .padding(.vertical, getRelativeHeight(12.0))
                                .padding(.leading, getRelativeWidth(8.0))
                                Spacer()
                                Image("img_arrowright")
                                    .resizable()
                                    .frame(width: getRelativeWidth(4.0),
                                           height: getRelativeHeight(9.0), alignment: .center)
                                    .scaledToFit()
                                    .clipped()
                                    .padding(.vertical, getRelativeHeight(25.0))
                                    .padding(.trailing, getRelativeWidth(13.0))
                            }
                            .frame(width: getRelativeWidth(343.0), height: getRelativeHeight(60.0),
                                   alignment: .leading)
                            .overlay(RoundedCorners(topLeft: 8.0, topRight: 8.0, bottomLeft: 8.0,
                                                    bottomRight: 8.0)
                                    .stroke(ColorConstants.Bluegray50,
                                            lineWidth: 1))
                            .background(RoundedCorners(topLeft: 8.0, topRight: 8.0, bottomLeft: 8.0,
                                                       bottomRight: 8.0)
                                    .fill(ColorConstants.WhiteA700))
                            .padding(.top, getRelativeHeight(16.0))
                            HStack {
                                HStack {
                                    Image("img_vector_30X30")
                                        .resizable()
                                        .frame(width: getRelativeWidth(30.0),
                                               height: getRelativeWidth(30.0), alignment: .center)
                                        .scaledToFit()
                                        .clipped()
                                    VStack(alignment: .leading, spacing: 0) {
                                        Text(StringConstants.kMsgTimePreference)
                                            .font(FontScheme
                                                .kRalewaySemiBold(size: getRelativeHeight(16.0)))
                                            .fontWeight(.semibold)
                                            .foregroundColor(ColorConstants.Gray900)
                                            .minimumScaleFactor(0.5)
                                            .multilineTextAlignment(.leading)
                                            .frame(width: getRelativeWidth(132.0),
                                                   height: getRelativeHeight(16.0),
                                                   alignment: .topLeading)
                                        Text(StringConstants.kMsgAllTimeRelate)
                                            .font(FontScheme
                                                .kRalewayRegular(size: getRelativeHeight(12.0)))
                                            .fontWeight(.regular)
                                            .foregroundColor(ColorConstants.Bluegray600)
                                            .minimumScaleFactor(0.5)
                                            .multilineTextAlignment(.leading)
                                            .frame(width: getRelativeWidth(134.0),
                                                   height: getRelativeHeight(12.0),
                                                   alignment: .topLeading)
                                            .padding(.top, getRelativeHeight(11.0))
                                    }
                                    .frame(width: getRelativeWidth(134.0),
                                           height: getRelativeHeight(39.0), alignment: .center)
                                    .padding(.leading, getRelativeWidth(15.0))
                                }
                                .frame(width: getRelativeWidth(179.0),
                                       height: getRelativeHeight(39.0), alignment: .bottom)
                                .padding(.vertical, getRelativeHeight(12.0))
                                .padding(.leading, getRelativeWidth(8.0))
                                Spacer()
                                Image("img_arrowright")
                                    .resizable()
                                    .frame(width: getRelativeWidth(4.0),
                                           height: getRelativeHeight(9.0), alignment: .center)
                                    .scaledToFit()
                                    .clipped()
                                    .padding(.vertical, getRelativeHeight(25.0))
                                    .padding(.trailing, getRelativeWidth(13.0))
                            }
                            .frame(width: getRelativeWidth(343.0), height: getRelativeHeight(60.0),
                                   alignment: .leading)
                            .overlay(RoundedCorners(topLeft: 8.0, topRight: 8.0, bottomLeft: 8.0,
                                                    bottomRight: 8.0)
                                    .stroke(ColorConstants.Bluegray50,
                                            lineWidth: 1))
                            .background(RoundedCorners(topLeft: 8.0, topRight: 8.0, bottomLeft: 8.0,
                                                       bottomRight: 8.0)
                                    .fill(ColorConstants.WhiteA700))
                            .padding(.top, getRelativeHeight(16.0))
                        }
                        .frame(width: getRelativeWidth(343.0), height: getRelativeHeight(422.0),
                               alignment: .center)
                        .padding(.horizontal, getRelativeWidth(16.0))
                    }
                    .frame(width: UIScreen.main.bounds.width, height: getRelativeHeight(422.0),
                           alignment: .leading)
                    VStack(alignment: .leading, spacing: 0) {
                        Text("TabBars")
                            .minimumScaleFactor(0.5)
                            .multilineTextAlignment(.leading)
                            .frame(width: UIScreen.main.bounds.width,
                                   height: getRelativeHeight(96.0), alignment: .leading)
                    }
                    .frame(width: UIScreen.main.bounds.width, height: getRelativeHeight(96.0),
                           alignment: .leading)
                    .padding(.top, getRelativeHeight(236.0))
                }
                .frame(width: UIScreen.main.bounds.width, alignment: .topLeading)
                .background(ColorConstants.WhiteA700)
                .padding(.top, getRelativeHeight(16.0))
                .padding(.top, getRelativeHeight(30.0))
                .padding(.bottom, getRelativeHeight(10.0))
                Group {
                    NavigationLink(destination: EventCreationView(),
                                   tag: "EventCreationView",
                                   selection: $homeViewFiveViewModel.nextScreen,
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

struct HomeViewFiveView_Previews: PreviewProvider {
    static var previews: some View {
        HomeViewFiveView()
    }
}
