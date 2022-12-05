import SwiftUI

struct ProfileView: View {
    @StateObject var profileViewModel = ProfileViewModel()
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @EnvironmentObject var viewModel: AuthenticationViewModel
    
    var body: some View {
        VStack {
            VStack{
                Image("img_nomadsavatar")
                    .resizable()
                    .frame(width: 140, height: 140)
                    .clipShape(Circle())
                
                Text(viewModel.savedName)
                    .font(.title)
                    .bold()
            }
//            .redacted(reason: .placeholder)
            
            Spacer().frame(height: 30)
            VStack(alignment: .leading, spacing: 12) {
                HStack {
                    Image(systemName: "envelope")
                    Text(viewModel.savedEmail)
                }
            }
//            .redacted(reason: .placeholder)
            
            Spacer().frame(height: 30)
            
            Button(action: {
                viewModel.signOut()
            }, label: {
                Text("DELETE ACCOUNT")
                    .font(FontScheme
                        .kInterExtraBold(size: getRelativeHeight(25.0)))
                    .fontWeight(.heavy)
                    .padding(.horizontal, getRelativeWidth(30.0))
                    .padding(.vertical, getRelativeHeight(22.0))
                    .foregroundColor(ColorConstants.WhiteA700)
                    .minimumScaleFactor(0.5)
                    .frame(width: getRelativeWidth(250),
                           height: getRelativeHeight(40.0),
                           alignment: .center)
                    .background(RoundedCorners(topLeft: 15,
                                               topRight: 15,
                                               bottomLeft: 15,
                                               bottomRight: 15)
                        .fill(ColorConstants.Gray600))
            })//.redacted(reason: .placeholder)
            
            Button(action: {
                viewModel.signOut()
            }, label: {
                Text("SIGN OUT")
                    .font(FontScheme
                        .kInterExtraBold(size: getRelativeHeight(35.0)))
                    .fontWeight(.heavy)
                    .padding(.horizontal, getRelativeWidth(30.0))
                    .padding(.vertical, getRelativeHeight(22.0))
                    .foregroundColor(ColorConstants.WhiteA700)
                    .minimumScaleFactor(0.5)
                    .frame(width: getRelativeWidth(250),
                           height: getRelativeHeight(60.0),
                           alignment: .center)
                    .background(RoundedCorners(topLeft: 20,
                                               topRight: 20,
                                               bottomLeft: 20,
                                               bottomRight: 20)
                        .fill(ColorConstants.Red400))
            })
//            .redacted(reason: .placeholder)
        }
    }
}
//        NavigationView {
//            VStack {
//                VStack {
//                    VStack {
//                        VStack(alignment: .leading, spacing: 0) {
//                            Group {
//                                ZStack(alignment: .bottomTrailing) {
//                                    ZStack(alignment: .center) {
//                                        Image("img_nomadsavatar")
//                                            .resizable()
//                                            .frame(width: getRelativeWidth(162.0),
//                                                   height: getRelativeHeight(151.0),
//                                                   alignment: .center)
//                                            .scaledToFit()
//                                            .clipped()
//                                            .padding(.vertical, getRelativeHeight(8.0))
//                                            .padding(.horizontal, getRelativeWidth(7.0))
//                                        Image("img_toddtest31")
//                                            .resizable()
//                                            .frame(width: getRelativeWidth(144.0),
//                                                   height: getRelativeHeight(148.0),
//                                                   alignment: .center)
//                                            .scaledToFit()
//                                            .clipped()
//                                            .background(RoundedCorners(topLeft: 72.0,
//                                                                       topRight: 72.0,
//                                                                       bottomLeft: 72.0,
//                                                                       bottomRight: 72.0))
//                                            .padding(.top, getRelativeHeight(11.0))
//                                            .padding(.bottom, getRelativeHeight(8.0))
//                                            .padding(.horizontal, getRelativeWidth(16.0))
//                                    }
//                                    .hideNavigationBar()
//                                    .frame(width: getRelativeWidth(176.0),
//                                           height: getRelativeHeight(167.0), alignment: .leading)
//                                    .overlay(RoundedCorners(topLeft: 75.0, topRight: 75.0,
//                                                            bottomLeft: 75.0, bottomRight: 75.0)
//                                            .stroke(LinearGradient(gradient: Gradient(colors: [ColorConstants
//                                                            .PurpleA201,
//                                                        ColorConstants
//                                                            .IndigoA201]),
//                                                    startPoint: .topLeading,
//                                                    endPoint: .bottomTrailing),
//                                                    lineWidth: 5))
//                                    .background(RoundedCorners(topLeft: 75.0, topRight: 75.0,
//                                                               bottomLeft: 75.0, bottomRight: 75.0)
//                                            .fill(Color.clear.opacity(0.7)))
//                                    .padding(.trailing, getRelativeWidth(8.0))
//                                    ZStack {
//                                        Image("img_vector_23X24")
//                                            .resizable()
//                                            .frame(width: getRelativeWidth(24.0),
//                                                   height: getRelativeHeight(23.0),
//                                                   alignment: .center)
//                                            .scaledToFit()
//                                            .clipped()
//                                            .padding(.top, getRelativeHeight(11.87))
//                                            .padding(.bottom, getRelativeHeight(11.13))
//                                            .padding(.horizontal, getRelativeWidth(12.12))
//                                    }
//                                    .hideNavigationBar()
//                                    .frame(width: getRelativeWidth(49.0),
//                                           height: getRelativeHeight(46.0),
//                                           alignment: .bottomTrailing)
//                                    .background(RoundedCorners(topLeft: 23.0, topRight: 23.0,
//                                                               bottomLeft: 23.0, bottomRight: 23.0)
//                                            .fill(ColorConstants.WhiteA700))
//                                    .shadow(color: ColorConstants.Black90028, radius: 8, x: 0, y: 4)
//                                    .padding(.top, getRelativeHeight(113.0))
//                                    .padding(.leading, getRelativeWidth(135.0))
//                                }
//                                .hideNavigationBar()
//                                .frame(width: getRelativeWidth(184.0),
//                                       height: getRelativeHeight(167.0), alignment: .center)
//                                .padding(.horizontal, getRelativeWidth(67.0))
//
//                                Text("Todd Sproull")
//                                    .font(.title)
//                                    .bold()
//                                    .frame(alignment: .center)
////                                    .redacted(reason: .placeholder)
//
//                                Text(viewModel.savedName)
//                                    .font(FontScheme.kInterMedium(size: getRelativeHeight(32.0)))
//                                    .fontWeight(.medium)
//                                    .foregroundColor(ColorConstants.Bluegray901)
//                                    .minimumScaleFactor(0.5)
//                                    .multilineTextAlignment(.leading)
//                                    .frame(width: getRelativeWidth(193.0),
//                                           height: getRelativeHeight(32.0), alignment: .topLeading)
//                                    .padding(.top, getRelativeHeight(28.0))
//                                    .padding(.horizontal, getRelativeWidth(67.0))
//                                HStack {
//                                    Image("img_icon_14X14")
//                                        .resizable()
//                                        .frame(width: getRelativeWidth(14.0),
//                                               height: getRelativeWidth(14.0), alignment: .center)
//                                        .scaledToFit()
//                                        .clipped()
//                                        .padding(.top, getRelativeHeight(11.0))
//                                        .padding(.bottom, getRelativeHeight(12.0))
//                                        .padding(.leading, getRelativeWidth(111.0))
//                                    Text(StringConstants.kLblEditProfile)
//                                        .font(FontScheme
//                                            .kInterMedium(size: getRelativeHeight(16.0)))
//                                        .fontWeight(.medium)
//                                        .foregroundColor(ColorConstants.Purple400)
//                                        .minimumScaleFactor(0.5)
//                                        .multilineTextAlignment(.leading)
//                                        .frame(width: getRelativeWidth(83.0),
//                                               height: getRelativeHeight(16.0),
//                                               alignment: .topLeading)
//                                        .padding(.vertical, getRelativeHeight(11.0))
//                                        .padding(.leading, getRelativeWidth(10.0))
//                                        .padding(.trailing, getRelativeWidth(108.0))
//                                }
//                                .frame(width: getRelativeWidth(328.0),
//                                       height: getRelativeHeight(38.0), alignment: .leading)
//                                .overlay(RoundedCorners(topLeft: 19.0, topRight: 19.0,
//                                                        bottomLeft: 19.0, bottomRight: 19.0)
//                                        .stroke(ColorConstants.Purple400,
//                                                lineWidth: 1))
//                                .background(RoundedCorners(topLeft: 19.0, topRight: 19.0,
//                                                           bottomLeft: 19.0, bottomRight: 19.0)
//                                        .fill(ColorConstants.WhiteA700))
//                                .padding(.top, getRelativeHeight(21.0))
//                                HStack {
//                                    HStack {
//                                        Image("img_icon_18X16")
//                                            .resizable()
//                                            .frame(width: getRelativeWidth(16.0),
//                                                   height: getRelativeHeight(18.0),
//                                                   alignment: .center)
//                                            .scaledToFit()
//                                            .clipped()
//                                        Text(StringConstants.kLblDeleteAccount)
//                                            .font(FontScheme
//                                                .kInterMedium(size: getRelativeHeight(16.0)))
//                                            .fontWeight(.medium)
//                                            .foregroundColor(ColorConstants.Gray903)
//                                            .minimumScaleFactor(0.5)
//                                            .multilineTextAlignment(.leading)
//                                            .frame(width: getRelativeWidth(139.0),
//                                                   height: getRelativeHeight(16.0),
//                                                   alignment: .topLeading)
//                                            .padding(.leading, getRelativeWidth(16.0))
//                                    }
//                                    .frame(width: getRelativeWidth(171.0),
//                                           height: getRelativeHeight(20.0), alignment: .center)
//                                    .padding(.top, getRelativeHeight(19.0))
//                                    .padding(.bottom, getRelativeHeight(17.0))
//                                    .padding(.leading, getRelativeWidth(12.0))
//                                    Spacer()
//                                    Image("img_arrowright")
//                                        .resizable()
//                                        .frame(width: getRelativeWidth(4.0),
//                                               height: getRelativeHeight(9.0), alignment: .center)
//                                        .scaledToFit()
//                                        .clipped()
//                                        .padding(.vertical, getRelativeHeight(25.0))
//                                        .padding(.trailing, getRelativeWidth(13.0))
//                                }
//                                .frame(width: getRelativeWidth(328.0),
//                                       height: getRelativeHeight(56.0), alignment: .leading)
//                                .background(RoundedCorners(topLeft: 8.0, topRight: 8.0,
//                                                           bottomLeft: 8.0, bottomRight: 8.0)
//                                        .fill(ColorConstants.WhiteA700))
//                                .padding(.top, getRelativeHeight(17.0))
//                                HStack {
//                                    HStack {
//                                        Image("img_icon_1")
//                                            .resizable()
//                                            .frame(width: getRelativeWidth(16.0),
//                                                   height: getRelativeHeight(18.0),
//                                                   alignment: .center)
//                                            .scaledToFit()
//                                            .clipped()
//                                        Text(StringConstants.kLblNotifications)
//                                            .font(FontScheme
//                                                .kInterMedium(size: getRelativeHeight(16.0)))
//                                            .fontWeight(.medium)
//                                            .foregroundColor(ColorConstants.Gray903)
//                                            .minimumScaleFactor(0.5)
//                                            .multilineTextAlignment(.leading)
//                                            .frame(width: getRelativeWidth(98.0),
//                                                   height: getRelativeHeight(16.0),
//                                                   alignment: .topLeading)
//                                            .padding(.leading, getRelativeWidth(16.0))
//                                    }
//                                    .frame(width: getRelativeWidth(130.0),
//                                           height: getRelativeHeight(18.0), alignment: .center)
//                                    .padding(.vertical, getRelativeHeight(19.0))
//                                    .padding(.leading, getRelativeWidth(12.0))
//                                    Spacer()
//                                    Text(StringConstants.kLblAllActive)
//                                        .font(FontScheme
//                                            .kInterRegular(size: getRelativeHeight(12.0)))
//                                        .fontWeight(.regular)
//                                        .foregroundColor(ColorConstants.Gray600)
//                                        .minimumScaleFactor(0.5)
//                                        .multilineTextAlignment(.leading)
//                                        .frame(width: getRelativeWidth(52.0),
//                                               height: getRelativeHeight(15.0),
//                                               alignment: .topLeading)
//                                        .padding(.top, getRelativeHeight(22.0))
//                                        .padding(.bottom, getRelativeHeight(19.0))
//                                        .padding(.trailing, getRelativeWidth(8.0))
//                                }
//                                .frame(width: getRelativeWidth(328.0),
//                                       height: getRelativeHeight(56.0), alignment: .leading)
//                                .background(RoundedCorners(topLeft: 8.0, topRight: 8.0,
//                                                           bottomLeft: 8.0, bottomRight: 8.0)
//                                        .fill(ColorConstants.WhiteA700))
//
//
//
//                            }
//                            Button(action: {
//                                viewModel.signOut()
//                            }, label: {
//                                Text("SIGN OUT")
//                                    .font(FontScheme
//                                        .kInterExtraBold(size: getRelativeHeight(35.0)))
//                                    .fontWeight(.heavy)
//                                    .padding(.horizontal, getRelativeWidth(30.0))
//                                    .padding(.vertical, getRelativeHeight(22.0))
//                                    .foregroundColor(ColorConstants.WhiteA700)
//                                    .minimumScaleFactor(0.5)
//                                    .frame(width: getRelativeWidth(295.0),
//                                           height: getRelativeHeight(60.0),
//                                           alignment: .center)
//                                    .background(RoundedCorners(topLeft: 28.5,
//                                                               topRight: 28.5,
//                                                               bottomLeft: 28.5,
//                                                               bottomRight: 28.5)
//                                        .fill(ColorConstants.Red400))
//                            })
//                            .frame(width: getRelativeWidth(325.0),
//                                   height: getRelativeHeight(60.0), alignment: .center)
//                            .background(RoundedCorners(topLeft: 28.5, topRight: 28.5,
//                                                       bottomLeft: 28.5, bottomRight: 28.5)
//                                .fill(ColorConstants.Red400))
//
//                            Group {
//                                HStack {
//                                    Spacer()
//                                    Image("img_icon_16X18")
//                                        .resizable()
//                                        .frame(width: getRelativeWidth(18.0),
//                                               height: getRelativeHeight(16.0), alignment: .center)
//                                        .scaledToFit()
//                                        .clipped()
//                                        .padding(.vertical, getRelativeHeight(20.0))
//                                        .padding(.leading, getRelativeWidth(11.0))
//                                        .padding(.trailing, getRelativeWidth(15.0))
//                                    TextField(StringConstants.kLblLogOut,
//                                              text: $profileViewModel.logoutText)
//                                        .font(FontScheme
//                                            .kInterMedium(size: getRelativeHeight(16.0)))
//                                        .foregroundColor(ColorConstants.Purple400)
//                                        .padding()
//                                }
//                                .frame(width: getRelativeWidth(328.0),
//                                       height: getRelativeHeight(56.0), alignment: .leading)
//                                .background(RoundedCorners(topLeft: 8.0, topRight: 8.0,
//                                                           bottomLeft: 8.0, bottomRight: 8.0)
//                                        .fill(ColorConstants.WhiteA700))
//                                Image("img_search_white_A700")
//                                    .resizable()
//                                    .frame(width: getRelativeWidth(18.0),
//                                           height: getRelativeHeight(19.0), alignment: .center)
//                                    .scaledToFit()
//                                    .clipped()
//                                    .padding(.top, getRelativeHeight(6.0))
//                                    .padding(.horizontal, getRelativeWidth(76.0))
//                            }
//                        }
//                        .frame(width: getRelativeWidth(328.0), height: getRelativeHeight(666.0),
//                               alignment: .center)
//                        .background(ColorConstants.WhiteA700)
//                        .padding(.horizontal, getRelativeWidth(24.0))
//                    }
//                    .frame(width: UIScreen.main.bounds.width, height: getRelativeHeight(666.0),
//                           alignment: .leading)
//                }
//                .frame(width: UIScreen.main.bounds.width, alignment: .topLeading)
//                .background(ColorConstants.WhiteA700)
//                .padding(.top, getRelativeHeight(56.0))
//                .padding(.top, getRelativeHeight(30.0))
//                .padding(.bottom, getRelativeHeight(10.0))
//                Group {
//                    NavigationLink(destination: EventCreationView(),
//                                   tag: "EventCreationView",
//                                   selection: $profileViewModel.nextScreen,
//                                   label: {
//                                       EmptyView()
//                                   })
//                }
//            }
//            .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
//            .background(ColorConstants.WhiteA700)
//            .ignoresSafeArea()
//            .hideNavigationBar()
//        }
//        .hideNavigationBar()
//    }
//}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView().environmentObject(AuthenticationViewModel())
    }
}
