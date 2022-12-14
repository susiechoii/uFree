import SwiftUI

struct IntroPageView: View {
    @StateObject var introPageViewModel = IntroPageViewModel()
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    var body: some View {
        NavigationView {
            VStack {
                VStack(alignment: .leading, spacing: 0) {
                    VStack {
                        Text(StringConstants.kMsgCleanInterface)
                            .font(FontScheme.kMontserratExtraBold(size: getRelativeHeight(30.0)))
                            .fontWeight(.heavy)
                            .foregroundColor(ColorConstants.Black900)
                            .minimumScaleFactor(0.5)
                            .multilineTextAlignment(.leading)
                            .frame(width: getRelativeWidth(293.0), height: getRelativeHeight(66.0),
                                   alignment: .topLeading)
                            .padding(.trailing, getRelativeWidth(5.0))
                    }
                    .frame(width: getRelativeWidth(299.0), height: getRelativeHeight(66.0),
                           alignment: .center)
                    .padding(.top, getRelativeHeight(64.0))
                    .padding(.horizontal, getRelativeWidth(36.0))
                    VStack(alignment: .leading, spacing: 0) {
                        Text(StringConstants.kLblUfree)
                            .font(FontScheme.kMontserratExtraBold(size: getRelativeHeight(45.0)))
                            .fontWeight(.heavy)
                            .foregroundColor(ColorConstants.Black900)
                            .minimumScaleFactor(0.5)
                            .multilineTextAlignment(.leading)
                            .frame(width: getRelativeWidth(162.0), height: getRelativeHeight(45.0),
                                   alignment: .topLeading)
                            .padding(.trailing)
                    }
                    .frame(width: getRelativeWidth(299.0), height: getRelativeHeight(45.0),
                           alignment: .center)
                    .padding(.top, getRelativeHeight(36.0))
                    .padding(.horizontal, getRelativeWidth(36.0))
                    VStack {
                        Image("img_tuttoriccopin")
                            .resizable()
                            .frame(width: getRelativeWidth(275.0), height: getRelativeHeight(296.0),
                                   alignment: .center)
                            .scaledToFit()
                            .clipped()
                            .padding(.leading, getRelativeWidth(14.0))
                            .padding(.trailing, getRelativeWidth(10.0))
                        VStack {
                            VStack {
                                Button(action: {
                                    introPageViewModel.nextScreen = "SignUpView"
                                }, label: {
                                    HStack(spacing: 0) {
                                        Text(StringConstants.kLblStartPlanning)
                                            .font(FontScheme
                                                .kInterBlack(size: getRelativeHeight(15.0)))
                                            .fontWeight(.black)
                                            .padding(.horizontal, getRelativeWidth(30.0))
                                            .padding(.vertical, getRelativeHeight(22.0))
                                            .foregroundColor(ColorConstants.WhiteA700)
                                            .minimumScaleFactor(0.5)
                                            .multilineTextAlignment(.leading)
                                            .frame(width: getRelativeWidth(295.0),
                                                   height: getRelativeHeight(60.0),
                                                   alignment: .topLeading)
                                            .background(RoundedCorners(topLeft: 28.5,
                                                                       topRight: 28.5,
                                                                       bottomLeft: 28.5,
                                                                       bottomRight: 28.5)
                                                    .fill(ColorConstants.Red400))
                                    }
                                })
                                .frame(width: getRelativeWidth(295.0),
                                       height: getRelativeHeight(60.0), alignment: .topLeading)
                                .background(RoundedCorners(topLeft: 28.5, topRight: 28.5,
                                                           bottomLeft: 28.5, bottomRight: 28.5)
                                        .fill(ColorConstants.Red400))
                            }
                            .frame(width: getRelativeWidth(295.0), height: getRelativeHeight(60.0),
                                   alignment: .leading)
                            .background(RoundedCorners(topLeft: 28.5, topRight: 28.5,
                                                       bottomLeft: 28.5, bottomRight: 28.5))
                        }
                        .frame(width: getRelativeWidth(295.0), height: getRelativeHeight(60.0),
                               alignment: .center)
                        .background(RoundedCorners(topLeft: 28.5, topRight: 28.5, bottomLeft: 28.5,
                                                   bottomRight: 28.5))
                        .shadow(color: ColorConstants.Indigo30028, radius: 40, x: 0, y: 10)
                        .padding(.top, getRelativeHeight(81.0))
                        .padding(.leading, getRelativeWidth(4.0))
                    }
                    .frame(width: getRelativeWidth(299.0), height: getRelativeHeight(437.0),
                           alignment: .center)
                    .padding(.vertical, getRelativeHeight(64.0))
                    .padding(.horizontal, getRelativeWidth(36.0))
                }
                .frame(width: UIScreen.main.bounds.width, alignment: .topLeading)
                .background(ColorConstants.WhiteA700)
                .padding(.top, getRelativeHeight(30.0))
                .padding(.bottom, getRelativeHeight(10.0))
                Group {
                    NavigationLink(destination: SignUpView(),
                                   tag: "SignUpView",
                                   selection: $introPageViewModel.nextScreen,
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

struct IntroPageView_Previews: PreviewProvider {
    static var previews: some View {
        IntroPageView()
    }
}
