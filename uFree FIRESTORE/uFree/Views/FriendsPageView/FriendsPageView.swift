import SwiftUI

struct FriendsPageView: View {
    @StateObject var friendsPageViewModel = FriendsPageViewModel()
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    var body: some View {
        NavigationView {
            VStack {
                VStack(alignment: .trailing, spacing: 0) {
                    VStack(alignment: .trailing, spacing: 0) {
                        VStack(alignment: .leading, spacing: 0) {
                            HStack {
                                HStack {
                                    Text(StringConstants.kLblYourFriends)
                                        .font(FontScheme
                                            .kNunitoSemiBold(size: getRelativeHeight(32.0)))
                                        .fontWeight(.semibold)
                                        .foregroundColor(ColorConstants.Gray900)
                                        .minimumScaleFactor(0.5)
                                        .multilineTextAlignment(.leading)
                                        .frame(width: getRelativeWidth(184.0),
                                               height: getRelativeHeight(32.0),
                                               alignment: .topLeading)
                                    Spacer()
                                    HStack {
                                        Image("img_vector_17X17")
                                            .resizable()
                                            .frame(width: getRelativeWidth(17.0),
                                                   height: getRelativeWidth(17.0),
                                                   alignment: .center)
                                            .scaledToFit()
                                            .clipped()
                                        Image("img_vector_24X20")
                                            .resizable()
                                            .frame(width: getRelativeWidth(20.0),
                                                   height: getRelativeHeight(24.0),
                                                   alignment: .center)
                                            .scaledToFit()
                                            .clipped()
                                            .padding(.leading, getRelativeWidth(19.0))
                                    }
                                    .frame(width: getRelativeWidth(57.0),
                                           height: getRelativeHeight(24.0), alignment: .top)
                                    .padding(.bottom, getRelativeHeight(11.0))
                                }
                                .frame(width: getRelativeWidth(343.0),
                                       height: getRelativeHeight(35.0), alignment: .leading)
                            }
                            .frame(width: getRelativeWidth(343.0), height: getRelativeHeight(35.0),
                                   alignment: .leading)
                            .padding(.trailing)
                            VStack(spacing: 0) {
                                ScrollView(.vertical, showsIndicators: false) {
                                    LazyVStack {
                                        ForEach(0 ... 2, id: \.self) { index in
                                            CellsCell()
                                        }
                                    }
                                }
                            }
                            .frame(width: getRelativeWidth(343.0), alignment: .leading)
                            .shadow(color: ColorConstants.Black9003f, radius: 4, x: 0, y: 4)
                            .padding(.top, getRelativeHeight(21.0))
                            .padding(.trailing, getRelativeWidth(10.0))
                            Text(StringConstants.kMsgMeetNewFriend)
                                .font(FontScheme.kInterSemiBold(size: getRelativeHeight(32.0)))
                                .fontWeight(.semibold)
                                .foregroundColor(ColorConstants.Gray900)
                                .minimumScaleFactor(0.5)
                                .multilineTextAlignment(.leading)
                                .frame(width: getRelativeWidth(263.0),
                                       height: getRelativeHeight(32.0), alignment: .topLeading)
                                .padding(.top, getRelativeHeight(31.0))
                                .padding(.trailing, getRelativeWidth(10.0))
                            Text(StringConstants.kMsgWeThinkYouMi)
                                .font(FontScheme
                                    .kMontserratRomanRegular(size: getRelativeHeight(14.0)))
                                .fontWeight(.regular)
                                .foregroundColor(ColorConstants.Bluegray600)
                                .minimumScaleFactor(0.5)
                                .multilineTextAlignment(.leading)
                                .frame(width: getRelativeWidth(279.0),
                                       height: getRelativeHeight(16.0), alignment: .topLeading)
                                .padding(.top, getRelativeHeight(7.0))
                                .padding(.trailing, getRelativeWidth(10.0))
                            HStack(spacing: 0) {
                                ScrollView(.horizontal, showsIndicators: false) {
                                    LazyHStack {
                                        ForEach(0 ... 2, id: \.self) { index in
                                            SmallCardCell()
                                        }
                                    }
                                }
                            }
                            .frame(width: getRelativeWidth(359.0), alignment: .leading)
                            .shadow(color: ColorConstants.Black9003f, radius: 4, x: 0, y: 4)
                            .padding(.top, getRelativeHeight(6.0))
                        }
                        .frame(width: getRelativeWidth(359.0), height: getRelativeHeight(646.0),
                               alignment: .trailing)
                        .padding(.leading)
                        .padding(.leading)
                    }
                    .frame(width: UIScreen.main.bounds.width, height: getRelativeHeight(646.0),
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
                    .padding(.top, getRelativeHeight(12.0))
                }
                .frame(width: UIScreen.main.bounds.width, alignment: .topLeading)
                .background(ColorConstants.WhiteA700)
                .padding(.top, getRelativeHeight(16.0))
                .padding(.top, getRelativeHeight(30.0))
                .padding(.bottom, getRelativeHeight(10.0))
                Group {
                    NavigationLink(destination: EventCreationView(),
                                   tag: "EventCreationView",
                                   selection: $friendsPageViewModel.nextScreen,
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

struct FriendsPageView_Previews: PreviewProvider {
    static var previews: some View {
        FriendsPageView()
    }
}
