import SwiftUI

struct EditDefaultforEventScreenView: View {
    @StateObject var editDefaultforEventScreenViewModel = EditDefaultforEventScreenViewModel()
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    var body: some View {
        NavigationView {
            VStack {
                VStack(alignment: .trailing, spacing: 0) {
                    VStack(alignment: .leading, spacing: 0) {
                        VStack {
                            ScrollView(.horizontal, showsIndicators: false) {
                                ZStack(alignment: .bottomTrailing) {
                                    Text(StringConstants.kLblWhenAreUfree)
                                        .font(FontScheme
                                            .kInterSemiBold(size: getRelativeHeight(24.0)))
                                        .fontWeight(.semibold)
                                        .foregroundColor(ColorConstants.Bluegray900)
                                        .minimumScaleFactor(0.5)
                                        .multilineTextAlignment(.leading)
                                        .frame(width: getRelativeWidth(108.0),
                                               height: getRelativeHeight(49.0),
                                               alignment: .topLeading)
                                        .padding(.bottom, getRelativeHeight(121.0))
                                        .padding(.trailing, getRelativeWidth(244.0))
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
                                                   height: getRelativeHeight(75.0),
                                                   alignment: .center)
                                            .background(RoundedCorners(topLeft: 10.0,
                                                                       topRight: 10.0,
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
                                                   height: getRelativeHeight(75.0),
                                                   alignment: .center)
                                            .background(RoundedCorners(topLeft: 10.0,
                                                                       topRight: 10.0,
                                                                       bottomLeft: 10.0,
                                                                       bottomRight: 10.0)
                                                    .fill(ColorConstants.Red300))
                                            .padding(.leading, getRelativeWidth(11.0))
                                        }
                                        .frame(width: getRelativeWidth(156.0),
                                               height: getRelativeHeight(75.0),
                                               alignment: .bottomLeading)
                                        .padding(.top, getRelativeHeight(30.09))
                                        .padding(.trailing, getRelativeWidth(252.85))
                                        HStack {
                                            Image("img_rectangle9_75X72")
                                                .resizable()
                                                .frame(width: getRelativeWidth(72.0),
                                                       height: getRelativeHeight(75.0),
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
                                                        .padding(.top, getRelativeHeight(25.0))
                                                        .padding(.horizontal,
                                                                 getRelativeWidth(24.0))
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
                                                        .padding(.horizontal,
                                                                 getRelativeWidth(24.0))
                                                }
                                                .frame(width: getRelativeWidth(72.0),
                                                       height: getRelativeHeight(75.0),
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
                                                        .frame(width: getRelativeWidth(20.0),
                                                               height: getRelativeHeight(18.0),
                                                               alignment: .topLeading)
                                                        .padding(.top, getRelativeHeight(25.0))
                                                        .padding(.horizontal,
                                                                 getRelativeWidth(22.0))
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
                                                        .padding(.horizontal,
                                                                 getRelativeWidth(22.0))
                                                }
                                                .frame(width: getRelativeWidth(72.0),
                                                       height: getRelativeHeight(75.0),
                                                       alignment: .center)
                                                .background(RoundedCorners(topLeft: 10.0,
                                                                           topRight: 10.0,
                                                                           bottomLeft: 10.0,
                                                                           bottomRight: 10.0)
                                                        .fill(ColorConstants.Gray101))
                                                .padding(.leading, getRelativeWidth(11.0))
                                                Image("img_rectangle8_75X72")
                                                    .resizable()
                                                    .frame(width: getRelativeWidth(72.0),
                                                           height: getRelativeHeight(75.0),
                                                           alignment: .center)
                                                    .scaledToFit()
                                                    .clipped()
                                                    .padding(.leading, getRelativeWidth(11.0))
                                            }
                                            .frame(width: getRelativeWidth(240.0),
                                                   height: getRelativeHeight(75.0),
                                                   alignment: .center)
                                            .padding(.leading, getRelativeWidth(180.0))
                                        }
                                        .frame(width: UIScreen.main.bounds.width,
                                               height: getRelativeHeight(75.0),
                                               alignment: .bottomLeading)
                                        .padding(.top, getRelativeHeight(29.47))
                                        Text(StringConstants.kMsgEditYourDefau)
                                            .font(FontScheme
                                                .kInterMedium(size: getRelativeHeight(16.0)))
                                            .fontWeight(.medium)
                                            .foregroundColor(ColorConstants.Bluegray900)
                                            .minimumScaleFactor(0.5)
                                            .multilineTextAlignment(.leading)
                                            .frame(width: getRelativeWidth(206.0),
                                                   height: getRelativeHeight(16.0),
                                                   alignment: .topLeading)
                                            .padding(.bottom, getRelativeHeight(89.0))
                                            .padding(.trailing, getRelativeWidth(202.0))
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
                                            DaysTimeSeleCell()
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
                                   selection: $editDefaultforEventScreenViewModel.nextScreen,
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

struct EditDefaultforEventScreenView_Previews: PreviewProvider {
    static var previews: some View {
        EditDefaultforEventScreenView()
    }
}
