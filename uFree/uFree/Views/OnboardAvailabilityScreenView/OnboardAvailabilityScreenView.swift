import SwiftUI

struct OnboardAvailabilityScreenView: View {
    @StateObject var onboardAvailabilityScreenViewModel = OnboardAvailabilityScreenViewModel()
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    var body: some View {
        VStack {
            VStack(alignment: .trailing, spacing: 0) {
                VStack(alignment: .leading, spacing: 0) {
                    VStack {
                        ScrollView(.horizontal, showsIndicators: false) {
                            ZStack(alignment: .bottomTrailing) {
                                Text(StringConstants.kLblWhenAreUfree)
                                    .font(FontScheme.kInterSemiBold(size: getRelativeHeight(24.0)))
                                    .fontWeight(.semibold)
                                    .foregroundColor(ColorConstants.Bluegray900)
                                    .minimumScaleFactor(0.5)
                                    .multilineTextAlignment(.leading)
                                    .frame(width: getRelativeWidth(108.0),
                                           height: getRelativeHeight(49.0), alignment: .topLeading)
                                    .padding(.bottom, getRelativeHeight(122.0))
                                    .padding(.trailing, getRelativeWidth(243.0))
                                ZStack(alignment: .bottomTrailing) {
                                    HStack {
                                        HStack {
                                            Image("img_rectangle9_1")
                                                .resizable()
                                                .frame(width: getRelativeWidth(72.0),
                                                       height: getRelativeHeight(75.0),
                                                       alignment: .center)
                                                .scaledToFit()
                                                .clipped()
                                            Button(action: {}, label: {
                                                HStack(spacing: 0) {
                                                    Text(StringConstants.kLblFri)
                                                        .font(FontScheme
                                                            .kInterSemiBold(size: getRelativeHeight(18.0)))
                                                        .fontWeight(.semibold)
                                                        .padding(.horizontal,
                                                                 getRelativeWidth(23.0))
                                                        .padding(.vertical, getRelativeHeight(28.0))
                                                        .foregroundColor(ColorConstants.Gray801)
                                                        .minimumScaleFactor(0.5)
                                                        .multilineTextAlignment(.center)
                                                        .frame(width: getRelativeWidth(72.0),
                                                               height: getRelativeHeight(75.0),
                                                               alignment: .center)
                                                        .background(RoundedCorners(topLeft: 10.0,
                                                                                   topRight: 10.0,
                                                                                   bottomLeft: 10.0,
                                                                                   bottomRight: 10.0)
                                                                .fill(ColorConstants.Gray101))
                                                        .padding(.leading, getRelativeWidth(11.0))
                                                }
                                            })
                                            .frame(width: getRelativeWidth(72.0),
                                                   height: getRelativeHeight(75.0),
                                                   alignment: .center)
                                            .background(RoundedCorners(topLeft: 10.0,
                                                                       topRight: 10.0,
                                                                       bottomLeft: 10.0,
                                                                       bottomRight: 10.0)
                                                    .fill(ColorConstants.Gray101))
                                            .padding(.leading, getRelativeWidth(11.0))
                                            VStack {
                                                Text(StringConstants.kLblSat)
                                                    .font(FontScheme
                                                        .kInterSemiBold(size: getRelativeHeight(18.0)))
                                                    .fontWeight(.semibold)
                                                    .foregroundColor(ColorConstants.Gray801)
                                                    .minimumScaleFactor(0.5)
                                                    .multilineTextAlignment(.leading)
                                                    .frame(width: getRelativeWidth(30.0),
                                                           height: getRelativeHeight(18.0),
                                                           alignment: .topLeading)
                                                    .padding(.top, getRelativeHeight(29.0))
                                                    .padding(.bottom, getRelativeHeight(27.0))
                                                    .padding(.horizontal, getRelativeWidth(21.0))
                                            }
                                            .frame(width: getRelativeWidth(72.0),
                                                   height: getRelativeHeight(75.0),
                                                   alignment: .center)
                                            .background(RoundedCorners(topLeft: 10.0,
                                                                       topRight: 10.0,
                                                                       bottomLeft: 10.0,
                                                                       bottomRight: 10.0)
                                                    .fill(ColorConstants.Gray101))
                                            .padding(.leading, getRelativeWidth(12.0))
                                        }
                                        .frame(width: getRelativeWidth(241.0),
                                               height: getRelativeHeight(76.0), alignment: .center)
                                        Image("img_rectangle8_1")
                                            .resizable()
                                            .frame(width: getRelativeWidth(72.0),
                                                   height: getRelativeHeight(75.0),
                                                   alignment: .center)
                                            .scaledToFit()
                                            .clipped()
                                            .padding(.leading, getRelativeWidth(179.0))
                                    }
                                    .frame(width: UIScreen.main.bounds.width,
                                           height: getRelativeHeight(76.0),
                                           alignment: .bottomLeading)
                                    .padding(.top, getRelativeHeight(29.46))
                                    VStack {
                                        Text(StringConstants.kLblSun)
                                            .font(FontScheme
                                                .kInterSemiBold(size: getRelativeHeight(18.0)))
                                            .fontWeight(.semibold)
                                            .foregroundColor(ColorConstants.Gray801)
                                            .minimumScaleFactor(0.5)
                                            .multilineTextAlignment(.leading)
                                            .frame(width: getRelativeWidth(32.0),
                                                   height: getRelativeHeight(18.0),
                                                   alignment: .topLeading)
                                            .padding(.vertical, getRelativeHeight(28.0))
                                            .padding(.horizontal, getRelativeWidth(19.0))
                                    }
                                    .frame(width: getRelativeWidth(72.0),
                                           height: getRelativeHeight(75.0),
                                           alignment: .bottomTrailing)
                                    .background(RoundedCorners(topLeft: 10.0, topRight: 10.0,
                                                               bottomLeft: 10.0, bottomRight: 10.0)
                                            .fill(ColorConstants.Gray101))
                                    .padding(.top, getRelativeHeight(30.09))
                                    .padding(.leading, getRelativeWidth(252.44))
                                    VStack {
                                        Text(StringConstants.kLblMon2)
                                            .font(FontScheme
                                                .kInterSemiBold(size: getRelativeHeight(18.0)))
                                            .fontWeight(.semibold)
                                            .foregroundColor(ColorConstants.Gray801)
                                            .minimumScaleFactor(0.5)
                                            .multilineTextAlignment(.leading)
                                            .frame(width: getRelativeWidth(40.0),
                                                   height: getRelativeHeight(18.0),
                                                   alignment: .topLeading)
                                            .padding(.vertical, getRelativeHeight(28.0))
                                            .padding(.horizontal, getRelativeWidth(16.0))
                                    }
                                    .frame(width: getRelativeWidth(72.0),
                                           height: getRelativeHeight(75.0),
                                           alignment: .bottomTrailing)
                                    .background(RoundedCorners(topLeft: 10.0, topRight: 10.0,
                                                               bottomLeft: 10.0, bottomRight: 10.0)
                                            .fill(ColorConstants.Gray101))
                                    .padding(.top, getRelativeHeight(30.09))
                                    .padding(.leading, getRelativeWidth(336.59))
                                    Text(StringConstants.kMsgSetYourDefaul)
                                        .font(FontScheme
                                            .kInterMedium(size: getRelativeHeight(16.0)))
                                        .fontWeight(.medium)
                                        .foregroundColor(ColorConstants.Bluegray900)
                                        .minimumScaleFactor(0.5)
                                        .multilineTextAlignment(.leading)
                                        .frame(width: getRelativeWidth(214.0),
                                               height: getRelativeHeight(16.0),
                                               alignment: .topLeading)
                                        .padding(.bottom, getRelativeHeight(89.0))
                                        .padding(.trailing, getRelativeWidth(194.0))
                                }
                                .hideNavigationBar()
                                .frame(width: UIScreen.main.bounds.width,
                                       height: getRelativeHeight(105.0),
                                       alignment: .bottomTrailing)
                                .padding(.top, getRelativeHeight(121.54))
                                Image("img_group6")
                                    .resizable()
                                    .frame(width: getRelativeWidth(271.0),
                                           height: getRelativeHeight(204.0), alignment: .center)
                                    .scaledToFit()
                                    .clipped()
                                    .padding(.bottom, getRelativeHeight(23.0))
                                    .padding(.leading, getRelativeWidth(165.0))
                            }
                            .hideNavigationBar()
                            .frame(width: UIScreen.main.bounds.width,
                                   height: getRelativeHeight(227.0), alignment: .leading)
                        }
                        HStack(spacing: 0) {
                            ScrollView(.horizontal, showsIndicators: false) {
                                LazyHStack {
                                    ForEach(0 ... 3, id: \.self) { index in
                                        DaysTimeSele1Cell()
                                    }
                                }
                            }
                        }
                        .frame(width: getRelativeWidth(301.0), alignment: .trailing)
                        .padding(.top, getRelativeHeight(27.0))
                        .padding(.horizontal, getRelativeWidth(39.0))
                    }
                    .frame(width: UIScreen.main.bounds.width, height: getRelativeHeight(745.0),
                           alignment: .leading)
                    .background(ColorConstants.WhiteA700)
                }
                .frame(width: UIScreen.main.bounds.width, height: getRelativeHeight(745.0),
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

struct OnboardAvailabilityScreenView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardAvailabilityScreenView()
    }
}
