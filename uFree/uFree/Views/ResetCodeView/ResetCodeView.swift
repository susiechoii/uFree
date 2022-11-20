import SwiftUI

struct ResetCodeView: View {
    @StateObject var resetCodeViewModel = ResetCodeViewModel()
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    var body: some View {
        NavigationView {
            VStack {
                VStack {
                    VStack(alignment: .leading, spacing: 0) {
                        Button(action: {
                            self.presentationMode.wrappedValue.dismiss()
                        }, label: {
                            Image("img_arrowleft")
                        })
                        .frame(width: getRelativeWidth(45.0), height: getRelativeWidth(45.0),
                               alignment: .center)
                        .background(RoundedCorners(topLeft: 15.0, topRight: 15.0, bottomLeft: 15.0,
                                                   bottomRight: 15.0)
                                .fill(ColorConstants.Blue100))
                        .padding(.trailing)
                    }
                    .frame(width: getRelativeWidth(316.0), height: getRelativeHeight(45.0),
                           alignment: .leading)
                    .padding(.top, getRelativeHeight(9.0))
                    .padding(.horizontal, getRelativeWidth(21.0))
                    VStack {
                        Image("img_tuttoriccomar")
                            .resizable()
                            .frame(width: getRelativeWidth(300.0), height: getRelativeHeight(247.0),
                                   alignment: .center)
                            .scaledToFit()
                            .clipped()
                            .padding(.leading, getRelativeWidth(16.0))
                    }
                    .frame(width: getRelativeWidth(316.0), height: getRelativeHeight(247.0),
                           alignment: .leading)
                    .padding(.top, getRelativeHeight(61.0))
                    .padding(.horizontal, getRelativeWidth(21.0))
                    VStack(alignment: .leading, spacing: 0) {
                        Text(StringConstants.kMsgWeJustSentYo)
                            .font(FontScheme.kInterMedium(size: getRelativeHeight(16.0)))
                            .fontWeight(.medium)
                            .foregroundColor(ColorConstants.Black90099)
                            .minimumScaleFactor(0.5)
                            .multilineTextAlignment(.leading)
                            .frame(width: getRelativeWidth(187.0), height: getRelativeHeight(19.0),
                                   alignment: .topLeading)
                            .padding(.horizontal, getRelativeWidth(22.0))
                        Text(StringConstants.kLblEnterItBelow)
                            .font(FontScheme.kInterExtraBold(size: getRelativeHeight(36.4127)))
                            .fontWeight(.heavy)
                            .foregroundColor(ColorConstants.Black900)
                            .minimumScaleFactor(0.5)
                            .multilineTextAlignment(.leading)
                            .frame(width: getRelativeWidth(256.0), height: getRelativeHeight(36.0),
                                   alignment: .topLeading)
                            .padding(.top, getRelativeHeight(5.0))
                            .padding(.horizontal, getRelativeWidth(23.0))
                    }
                    .frame(width: getRelativeWidth(316.0), height: getRelativeHeight(61.0),
                           alignment: .leading)
                    .padding(.top, getRelativeHeight(32.0))
                    .padding(.horizontal, getRelativeWidth(21.0))
                    VStack {
                        Group {
                            HStack {
                                SecureField(StringConstants.kLblNewPassword,
                                            text: $resetCodeViewModel.inputtextnoneText)
                                    .font(FontScheme.kInterRegular(size: getRelativeHeight(12.0)))
                                    .foregroundColor(ColorConstants.Black900Cc)
                                    .padding()
                                    .keyboardType(.default)
                                Image("img_hide")
                                    .resizable()
                                    .frame(width: getRelativeWidth(15.0),
                                           height: getRelativeHeight(13.0), alignment: .center)
                                    .scaledToFit()
                                    .clipped()
                                    .padding(.vertical, getRelativeHeight(22.0))
                                    .padding(.leading, getRelativeWidth(30.0))
                                    .padding(.trailing, getRelativeWidth(26.0))
                                Spacer()
                            }
                            .onChange(of: resetCodeViewModel.inputtextnoneText) { newValue in

                                resetCodeViewModel.isValidInputtextnoneText = newValue
                                    .isValidPassword(isMandatory: true)
                            }
                            .frame(width: getRelativeWidth(295.0), height: getRelativeHeight(58.0),
                                   alignment: .center)
                            .overlay(RoundedCorners(topLeft: 29.0, topRight: 29.0, bottomLeft: 29.0,
                                                    bottomRight: 29.0)
                                    .stroke(ColorConstants.Gray700,
                                            lineWidth: 1))
                            .background(RoundedCorners(topLeft: 29.0, topRight: 29.0,
                                                       bottomLeft: 29.0, bottomRight: 29.0)
                                    .fill(ColorConstants.WhiteA700))
                            .padding(.leading, getRelativeWidth(19.0))
                            if !resetCodeViewModel.isValidInputtextnoneText {
                                Text("Please enter valid password.")
                                    .foregroundColor(Color.red)
                                    .font(FontScheme.kInterRegular(size: getRelativeHeight(12.0)))
                                    .frame(width: getRelativeWidth(295.0),
                                           height: getRelativeHeight(58.0), alignment: .center)
                            }
                        }
                        VStack {
                            VStack {
                                Button(action: {
                                    resetCodeViewModel.nextScreen = "ResetPasswordView"
                                }, label: {
                                    HStack(spacing: 0) {
                                        Text(StringConstants.kMsgResetYourPass)
                                            .font(FontScheme
                                                .kRobotoBlack(size: getRelativeHeight(15.0)))
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
                        .shadow(color: ColorConstants.Indigo30028, radius: 40, x: 0, y: 10)
                        .padding(.top, getRelativeHeight(24.0))
                        .padding(.leading, getRelativeWidth(19.0))
                        Text(StringConstants.kMsgDonTHaveAnA)
                            .font(FontScheme.kNotoSans(size: getRelativeHeight(13.0)))
                            .fontWeight(.regular)
                            .foregroundColor(ColorConstants.Black900)
                            .minimumScaleFactor(0.5)
                            .multilineTextAlignment(.leading)
                            .frame(width: getRelativeWidth(195.0), height: getRelativeHeight(14.0),
                                   alignment: .topLeading)
                            .padding(.top, getRelativeHeight(31.0))
                            .padding(.horizontal, getRelativeWidth(19.0))
                            .onTapGesture {
                                resetCodeViewModel.nextScreen = "SignUpView"
                            }
                        Text(StringConstants.kMsgFalseAlarmSi)
                            .font(FontScheme.kNotoSans(size: getRelativeHeight(13.0)))
                            .fontWeight(.regular)
                            .foregroundColor(ColorConstants.Black900)
                            .minimumScaleFactor(0.5)
                            .multilineTextAlignment(.leading)
                            .frame(width: getRelativeWidth(124.0), height: getRelativeHeight(14.0),
                                   alignment: .topLeading)
                            .padding(.top, getRelativeHeight(5.0))
                            .padding(.horizontal, getRelativeWidth(19.0))
                            .onTapGesture {
                                resetCodeViewModel.nextScreen = "SignInView"
                            }
                    }
                    .frame(width: getRelativeWidth(316.0), height: getRelativeHeight(208.0),
                           alignment: .leading)
                    .padding(.vertical, getRelativeHeight(29.0))
                    .padding(.horizontal, getRelativeWidth(21.0))
                }
                .frame(width: UIScreen.main.bounds.width, alignment: .topLeading)
                .background(ColorConstants.WhiteA700)
                .padding(.top, getRelativeHeight(30.0))
                .padding(.bottom, getRelativeHeight(10.0))
                Group {
                    NavigationLink(destination: SignInView(),
                                   tag: "SignInView",
                                   selection: $resetCodeViewModel.nextScreen,
                                   label: {
                                       EmptyView()
                                   })
                    NavigationLink(destination: SignUpView(),
                                   tag: "SignUpView",
                                   selection: $resetCodeViewModel.nextScreen,
                                   label: {
                                       EmptyView()
                                   })
                    NavigationLink(destination: ResetPasswordView(),
                                   tag: "ResetPasswordView",
                                   selection: $resetCodeViewModel.nextScreen,
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

struct ResetCodeView_Previews: PreviewProvider {
    static var previews: some View {
        ResetCodeView()
    }
}
