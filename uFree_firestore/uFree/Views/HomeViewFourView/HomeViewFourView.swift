import SwiftUI

struct HomeViewFourView: View {
    @StateObject var homeViewFourViewModel = HomeViewFourViewModel()
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    var body: some View {
        NavigationView {
            VStack {
                VStack(alignment: .leading, spacing: 0) {
                    VStack {
                        HStack {
                            HStack {
                                HStack {
                                    Spacer()
                                    Image("img_search")
                                        .resizable()
                                        .frame(width: getRelativeWidth(11.0),
                                               height: getRelativeWidth(11.0), alignment: .center)
                                        .scaledToFit()
                                        .clipped()
                                        .padding(.vertical, getRelativeHeight(14.0))
                                        .padding(.leading, getRelativeWidth(14.0))
                                        .padding(.trailing, getRelativeWidth(10.0))
                                    TextField(StringConstants.kLblSearch,
                                              text: $homeViewFourViewModel.input)
                                        .font(FontScheme
                                            .kNunitoRegular(size: getRelativeHeight(14.0)))
                                        .foregroundColor(ColorConstants.Bluegray600)
                                        .padding()
                                }
                                .frame(width: getRelativeWidth(295.0),
                                       height: getRelativeHeight(40.0), alignment: .center)
                                .overlay(RoundedCorners(topLeft: 4.0, topRight: 4.0,
                                                        bottomLeft: 4.0,
                                                        bottomRight: 4.0)
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
                            .frame(width: getRelativeWidth(343.0), height: getRelativeHeight(40.0),
                                   alignment: .leading)
                        }
                        .frame(width: getRelativeWidth(343.0), height: getRelativeHeight(40.0),
                               alignment: .leading)
                        .padding(.horizontal, getRelativeWidth(16.0))
                        ScrollView(.vertical, showsIndicators: false) {
                            VStack(alignment: .leading, spacing: 0) {
                                Text(StringConstants.kLblInvitations)
                                    .font(FontScheme.kInterSemiBold(size: getRelativeHeight(32.0)))
                                    .fontWeight(.semibold)
                                    .foregroundColor(ColorConstants.Gray900)
                                    .minimumScaleFactor(0.5)
                                    .multilineTextAlignment(.leading)
                                    .frame(width: getRelativeWidth(150.0),
                                           height: getRelativeHeight(32.0), alignment: .topLeading)
                                    .padding(.trailing)
                                Image("img_items_64X343")
                                    .resizable()
                                    .frame(width: getRelativeWidth(343.0),
                                           height: getRelativeHeight(64.0), alignment: .center)
                                    .scaledToFit()
                                    .clipped()
                                    .padding(.top, getRelativeHeight(21.0))
                                HStack {
                                    ZStack {
                                        Image("img_nomadscitytou")
                                            .resizable()
                                            .frame(width: getRelativeWidth(124.0),
                                                   height: getRelativeHeight(151.0),
                                                   alignment: .center)
                                            .scaledToFit()
                                            .clipped()
                                            .padding(.all, getRelativeWidth(8.0))
                                            .padding(.vertical, getRelativeHeight(8.0))
                                            .padding(.horizontal, getRelativeWidth(8.0))
                                    }
                                    .hideNavigationBar()
                                    .onTapGesture {
                                        homeViewFourViewModel.nextScreen = "OptimalTimeView"
                                    }
                                    .frame(width: getRelativeWidth(140.0),
                                           height: getRelativeHeight(167.0), alignment: .center)
                                    .background(ColorConstants.WhiteA700)
                                    VStack(alignment: .leading, spacing: 0) {
                                        HStack {
                                            VStack(alignment: .leading, spacing: 0) {
                                                Text(StringConstants.kLblEventA)
                                                    .font(FontScheme
                                                        .kNunitoExtraBold(size: getRelativeHeight(24.0)))
                                                    .fontWeight(.heavy)
                                                    .foregroundColor(ColorConstants.Black900)
                                                    .minimumScaleFactor(0.5)
                                                    .multilineTextAlignment(.leading)
                                                    .frame(width: getRelativeWidth(87.0),
                                                           height: getRelativeHeight(24.0),
                                                           alignment: .topLeading)
                                                Text(StringConstants.kMsgLocationHere5)
                                                    .font(FontScheme
                                                        .kNunitoRegular(size: getRelativeHeight(14.0)))
                                                    .fontWeight(.regular)
                                                    .foregroundColor(ColorConstants.Bluegray600)
                                                    .minimumScaleFactor(0.5)
                                                    .multilineTextAlignment(.leading)
                                                    .frame(width: getRelativeWidth(89.0),
                                                           height: getRelativeHeight(28.0),
                                                           alignment: .topLeading)
                                                    .padding(.top, getRelativeHeight(12.0))
                                            }
                                            .frame(width: getRelativeWidth(89.0),
                                                   height: getRelativeHeight(65.0),
                                                   alignment: .center)
                                            Spacer()
                                            Image("img_arrowright_gray_900")
                                                .resizable()
                                                .frame(width: getRelativeWidth(7.0),
                                                       height: getRelativeHeight(12.0),
                                                       alignment: .center)
                                                .scaledToFit()
                                                .clipped()
                                                .padding(.vertical, getRelativeHeight(22.0))
                                        }
                                        .frame(width: getRelativeWidth(169.0),
                                               height: getRelativeHeight(65.0), alignment: .center)
                                        .padding(.top, getRelativeHeight(8.0))
                                        Image("img_items_deep_orange_50")
                                            .resizable()
                                            .frame(width: getRelativeWidth(171.0),
                                                   height: getRelativeHeight(45.0),
                                                   alignment: .center)
                                            .scaledToFit()
                                            .clipped()
                                            .padding(.top, getRelativeHeight(16.0))
                                    }
                                    .frame(width: getRelativeWidth(171.0),
                                           height: getRelativeHeight(135.0), alignment: .center)
                                    .padding(.vertical, getRelativeHeight(16.0))
                                    .padding(.leading, getRelativeWidth(16.0))
                                }
                                .frame(width: getRelativeWidth(343.0),
                                       height: getRelativeHeight(167.0), alignment: .leading)
                                .background(RoundedCorners(topLeft: 16.0, topRight: 16.0,
                                                           bottomLeft: 16.0, bottomRight: 16.0)
                                        .fill(ColorConstants.WhiteA700))
                                .shadow(color: ColorConstants.Black9001e, radius: 24, x: 0, y: 12)
                                .padding(.top, getRelativeHeight(16.0))
                                HStack {
                                    VStack(alignment: .leading, spacing: 0) {
                                        Text(StringConstants.kLblEventB)
                                            .font(FontScheme
                                                .kNunitoExtraBold(size: getRelativeHeight(16.0)))
                                            .fontWeight(.heavy)
                                            .foregroundColor(ColorConstants.Gray900)
                                            .minimumScaleFactor(0.5)
                                            .multilineTextAlignment(.leading)
                                            .frame(width: getRelativeWidth(57.0),
                                                   height: getRelativeHeight(16.0),
                                                   alignment: .topLeading)
                                            .padding(.trailing)
                                        Text(StringConstants.kMsgLocationHere6)
                                            .font(FontScheme
                                                .kNunitoRegular(size: getRelativeHeight(14.0)))
                                            .fontWeight(.regular)
                                            .foregroundColor(ColorConstants.Bluegray600)
                                            .minimumScaleFactor(0.5)
                                            .multilineTextAlignment(.leading)
                                            .frame(width: getRelativeWidth(162.0),
                                                   height: getRelativeHeight(14.0),
                                                   alignment: .topLeading)
                                            .padding(.top, getRelativeHeight(11.0))
                                    }
                                    .onTapGesture {
                                        homeViewFourViewModel
                                            .nextScreen = "EditDefaultforEventScreenView"
                                    }
                                    .frame(width: getRelativeWidth(162.0),
                                           height: getRelativeHeight(41.0), alignment: .bottom)
                                    .padding(.vertical, getRelativeHeight(19.0))
                                    .padding(.leading, getRelativeWidth(16.0))
                                    Spacer()
                                    Image("img_arrowright_gray_900")
                                        .resizable()
                                        .frame(width: getRelativeWidth(7.0),
                                               height: getRelativeHeight(12.0), alignment: .center)
                                        .scaledToFit()
                                        .clipped()
                                        .padding(.vertical, getRelativeHeight(32.0))
                                        .padding(.trailing, getRelativeWidth(16.0))
                                }
                                .frame(width: getRelativeWidth(343.0),
                                       height: getRelativeHeight(76.0), alignment: .leading)
                                .background(RoundedCorners(topLeft: 8.0, topRight: 8.0,
                                                           bottomLeft: 8.0, bottomRight: 8.0)
                                        .fill(ColorConstants.WhiteA700))
                                .shadow(color: ColorConstants.Black9001e, radius: 24, x: 0, y: 12)
                                .padding(.top, getRelativeHeight(16.0))
                                HStack {
                                    VStack(alignment: .leading, spacing: 0) {
                                        Text(StringConstants.kLblEventC)
                                            .font(FontScheme
                                                .kNunitoExtraBold(size: getRelativeHeight(16.0)))
                                            .fontWeight(.heavy)
                                            .foregroundColor(ColorConstants.Gray900)
                                            .minimumScaleFactor(0.5)
                                            .multilineTextAlignment(.leading)
                                            .frame(width: getRelativeWidth(57.0),
                                                   height: getRelativeHeight(16.0),
                                                   alignment: .topLeading)
                                            .padding(.trailing)
                                        Text(StringConstants.kMsgLocationHere6)
                                            .font(FontScheme
                                                .kNunitoRegular(size: getRelativeHeight(14.0)))
                                            .fontWeight(.regular)
                                            .foregroundColor(ColorConstants.Bluegray600)
                                            .minimumScaleFactor(0.5)
                                            .multilineTextAlignment(.leading)
                                            .frame(width: getRelativeWidth(162.0),
                                                   height: getRelativeHeight(14.0),
                                                   alignment: .topLeading)
                                            .padding(.top, getRelativeHeight(11.0))
                                    }
                                    .frame(width: getRelativeWidth(162.0),
                                           height: getRelativeHeight(41.0), alignment: .bottom)
                                    .padding(.vertical, getRelativeHeight(19.0))
                                    .padding(.leading, getRelativeWidth(16.0))
                                    Spacer()
                                    Image("img_arrowright_gray_900")
                                        .resizable()
                                        .frame(width: getRelativeWidth(7.0),
                                               height: getRelativeHeight(12.0), alignment: .center)
                                        .scaledToFit()
                                        .clipped()
                                        .padding(.vertical, getRelativeHeight(32.0))
                                        .padding(.trailing, getRelativeWidth(16.0))
                                }
                                .frame(width: getRelativeWidth(343.0),
                                       height: getRelativeHeight(76.0), alignment: .leading)
                                .background(RoundedCorners(topLeft: 8.0, topRight: 8.0,
                                                           bottomLeft: 8.0, bottomRight: 8.0)
                                        .fill(ColorConstants.WhiteA700))
                                .shadow(color: ColorConstants.Black9001e, radius: 24, x: 0, y: 12)
                                .padding(.top, getRelativeHeight(16.0))
                                HStack {
                                    VStack(alignment: .leading, spacing: 0) {
                                        Text(StringConstants.kLblEventD)
                                            .font(FontScheme
                                                .kNunitoExtraBold(size: getRelativeHeight(16.0)))
                                            .fontWeight(.heavy)
                                            .foregroundColor(ColorConstants.Gray900)
                                            .minimumScaleFactor(0.5)
                                            .multilineTextAlignment(.leading)
                                            .frame(width: getRelativeWidth(58.0),
                                                   height: getRelativeHeight(16.0),
                                                   alignment: .topLeading)
                                            .padding(.trailing)
                                        Text(StringConstants.kMsgLocationHere6)
                                            .font(FontScheme
                                                .kNunitoRegular(size: getRelativeHeight(14.0)))
                                            .fontWeight(.regular)
                                            .foregroundColor(ColorConstants.Bluegray600)
                                            .minimumScaleFactor(0.5)
                                            .multilineTextAlignment(.leading)
                                            .frame(width: getRelativeWidth(162.0),
                                                   height: getRelativeHeight(14.0),
                                                   alignment: .topLeading)
                                            .padding(.top, getRelativeHeight(11.0))
                                    }
                                    .frame(width: getRelativeWidth(162.0),
                                           height: getRelativeHeight(41.0), alignment: .bottom)
                                    .padding(.vertical, getRelativeHeight(19.0))
                                    .padding(.leading, getRelativeWidth(16.0))
                                    Spacer()
                                    Image("img_arrowright_gray_900")
                                        .resizable()
                                        .frame(width: getRelativeWidth(7.0),
                                               height: getRelativeHeight(12.0), alignment: .center)
                                        .scaledToFit()
                                        .clipped()
                                        .padding(.vertical, getRelativeHeight(32.0))
                                        .padding(.trailing, getRelativeWidth(16.0))
                                }
                                .frame(width: getRelativeWidth(343.0),
                                       height: getRelativeHeight(76.0), alignment: .leading)
                                .background(RoundedCorners(topLeft: 8.0, topRight: 8.0,
                                                           bottomLeft: 8.0, bottomRight: 8.0)
                                        .fill(ColorConstants.WhiteA700))
                                .shadow(color: ColorConstants.Black9001e, radius: 24, x: 0, y: 12)
                                .padding(.top, getRelativeHeight(16.0))
                                HStack {
                                    VStack(alignment: .leading, spacing: 0) {
                                        Text(StringConstants.kLblNewRoomies)
                                            .font(FontScheme
                                                .kNunitoExtraBold(size: getRelativeHeight(16.0)))
                                            .fontWeight(.heavy)
                                            .foregroundColor(ColorConstants.Gray900)
                                            .minimumScaleFactor(0.5)
                                            .multilineTextAlignment(.leading)
                                            .frame(width: getRelativeWidth(103.0),
                                                   height: getRelativeHeight(16.0),
                                                   alignment: .topLeading)
                                        Text(StringConstants.kLblUkraine)
                                            .font(FontScheme
                                                .kNunitoRegular(size: getRelativeHeight(14.0)))
                                            .fontWeight(.regular)
                                            .foregroundColor(ColorConstants.Bluegray600)
                                            .minimumScaleFactor(0.5)
                                            .multilineTextAlignment(.leading)
                                            .frame(width: getRelativeWidth(47.0),
                                                   height: getRelativeHeight(14.0),
                                                   alignment: .topLeading)
                                            .padding(.top, getRelativeHeight(11.0))
                                            .padding(.trailing, getRelativeWidth(10.0))
                                    }
                                    .frame(width: getRelativeWidth(103.0),
                                           height: getRelativeHeight(41.0), alignment: .bottom)
                                    .padding(.vertical, getRelativeHeight(19.0))
                                    .padding(.leading, getRelativeWidth(16.0))
                                    Spacer()
                                    Image("img_arrowright_gray_900")
                                        .resizable()
                                        .frame(width: getRelativeWidth(7.0),
                                               height: getRelativeHeight(12.0), alignment: .center)
                                        .scaledToFit()
                                        .clipped()
                                        .padding(.vertical, getRelativeHeight(32.0))
                                        .padding(.trailing, getRelativeWidth(16.0))
                                }
                                .frame(width: getRelativeWidth(343.0),
                                       height: getRelativeHeight(76.0), alignment: .leading)
                                .background(RoundedCorners(topLeft: 8.0, topRight: 8.0,
                                                           bottomLeft: 8.0, bottomRight: 8.0)
                                        .fill(ColorConstants.WhiteA700))
                                .shadow(color: ColorConstants.Black9001e, radius: 24, x: 0, y: 12)
                                .padding(.top, getRelativeHeight(16.0))
                                HStack {
                                    Spacer()
                                    VStack(alignment: .leading, spacing: 0) {
                                        Text(StringConstants.kLblSpanishRoomies)
                                            .font(FontScheme
                                                .kNunitoExtraBold(size: getRelativeHeight(16.0)))
                                            .fontWeight(.heavy)
                                            .foregroundColor(ColorConstants.Gray900)
                                            .minimumScaleFactor(0.5)
                                            .multilineTextAlignment(.leading)
                                            .frame(width: getRelativeWidth(287.0),
                                                   height: getRelativeHeight(24.0),
                                                   alignment: .leading)
                                        Text(StringConstants.kLblSpain)
                                            .font(FontScheme
                                                .kNunitoRegular(size: getRelativeHeight(14.0)))
                                            .fontWeight(.regular)
                                            .foregroundColor(ColorConstants.Bluegray600)
                                            .minimumScaleFactor(0.5)
                                            .multilineTextAlignment(.leading)
                                            .frame(width: getRelativeWidth(287.0),
                                                   height: getRelativeHeight(16.0),
                                                   alignment: .leading)
                                            .padding(.top, getRelativeHeight(4.0))
                                    }
                                    .frame(width: getRelativeWidth(287.0),
                                           height: getRelativeHeight(44.0), alignment: .center)
                                    .padding(.vertical, getRelativeHeight(16.0))
                                    Spacer()
                                    Image("img_arrowright_gray_900")
                                        .resizable()
                                        .frame(width: getRelativeWidth(7.0),
                                               height: getRelativeHeight(12.0), alignment: .center)
                                        .scaledToFit()
                                        .clipped()
                                        .padding(.vertical, getRelativeHeight(32.0))
                                    Spacer()
                                }
                                .frame(width: getRelativeWidth(343.0),
                                       height: getRelativeHeight(76.0), alignment: .leading)
                                .background(RoundedCorners(topLeft: 8.0, topRight: 8.0,
                                                           bottomLeft: 8.0, bottomRight: 8.0)
                                        .fill(ColorConstants.WhiteA700))
                                .shadow(color: ColorConstants.Black9001e, radius: 24, x: 0, y: 12)
                                .padding(.top, getRelativeHeight(16.0))
                                HStack {
                                    Spacer()
                                    VStack(alignment: .leading, spacing: 0) {
                                        Text(StringConstants.kLblBritishRoomies)
                                            .font(FontScheme
                                                .kNunitoExtraBold(size: getRelativeHeight(16.0)))
                                            .fontWeight(.heavy)
                                            .foregroundColor(ColorConstants.Gray900)
                                            .minimumScaleFactor(0.5)
                                            .multilineTextAlignment(.leading)
                                            .frame(width: getRelativeWidth(287.0),
                                                   height: getRelativeHeight(24.0),
                                                   alignment: .leading)
                                        Text(StringConstants.kLblGreatBritain)
                                            .font(FontScheme
                                                .kNunitoRegular(size: getRelativeHeight(14.0)))
                                            .fontWeight(.regular)
                                            .foregroundColor(ColorConstants.Bluegray600)
                                            .minimumScaleFactor(0.5)
                                            .multilineTextAlignment(.leading)
                                            .frame(width: getRelativeWidth(287.0),
                                                   height: getRelativeHeight(16.0),
                                                   alignment: .leading)
                                            .padding(.top, getRelativeHeight(4.0))
                                    }
                                    .frame(width: getRelativeWidth(287.0),
                                           height: getRelativeHeight(44.0), alignment: .center)
                                    .padding(.vertical, getRelativeHeight(16.0))
                                    Spacer()
                                    Image("img_arrowright_gray_900")
                                        .resizable()
                                        .frame(width: getRelativeWidth(7.0),
                                               height: getRelativeHeight(12.0), alignment: .center)
                                        .scaledToFit()
                                        .clipped()
                                        .padding(.vertical, getRelativeHeight(32.0))
                                    Spacer()
                                }
                                .frame(width: getRelativeWidth(343.0),
                                       height: getRelativeHeight(76.0), alignment: .leading)
                                .background(RoundedCorners(topLeft: 8.0, topRight: 8.0,
                                                           bottomLeft: 8.0, bottomRight: 8.0)
                                        .fill(ColorConstants.WhiteA700))
                                .shadow(color: ColorConstants.Black9001e, radius: 24, x: 0, y: 12)
                                .padding(.top, getRelativeHeight(16.0))
                            }
                            .frame(width: getRelativeWidth(343.0), alignment: .topLeading)
                        }
                        .padding(.horizontal, getRelativeWidth(16.0))
                    }
                    .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height,
                           alignment: .topLeading)
                    VStack(alignment: .leading, spacing: 0) {
                        Text("TabBars")
                            .minimumScaleFactor(0.5)
                            .multilineTextAlignment(.leading)
                            .frame(width: UIScreen.main.bounds.width,
                                   height: getRelativeHeight(96.0), alignment: .leading)
                    }
                    .frame(width: UIScreen.main.bounds.width, height: getRelativeHeight(96.0),
                           alignment: .leading)
                }
                .frame(width: UIScreen.main.bounds.width, alignment: .topLeading)
                .background(ColorConstants.WhiteA700)
                .padding(.top, getRelativeHeight(30.0))
                .padding(.bottom, getRelativeHeight(10.0))
                Group {
                    NavigationLink(destination: OptimalTimeView(),
                                   tag: "OptimalTimeView",
                                   selection: $homeViewFourViewModel.nextScreen,
                                   label: {
                                       EmptyView()
                                   })
                    NavigationLink(destination: EditDefaultforEventScreenView(),
                                   tag: "EditDefaultforEventScreenView",
                                   selection: $homeViewFourViewModel.nextScreen,
                                   label: {
                                       EmptyView()
                                   })
                    NavigationLink(destination: EventCreationView(),
                                   tag: "EventCreationView",
                                   selection: $homeViewFourViewModel.nextScreen,
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

struct HomeViewFourView_Previews: PreviewProvider {
    static var previews: some View {
        HomeViewFourView()
    }
}
