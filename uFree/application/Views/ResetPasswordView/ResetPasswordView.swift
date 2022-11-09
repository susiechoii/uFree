import SwiftUI

struct ResetPasswordView: View {
    @StateObject var resetPasswordViewModel = ResetPasswordViewModel()
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    var body: some View {
        NavigationView {
            VStack {
                ZStack {
                    VStack {
                        HStack {
                            Button(action: {
                                self.presentationMode.wrappedValue.dismiss()
                            }, label: {
                                Image("img_arrowleft")
                            })
                            .frame(width: getRelativeWidth(45.0), height: getRelativeWidth(45.0),
                                   alignment: .center)
                            .background(RoundedCorners(topLeft: 15.0, topRight: 15.0,
                                                       bottomLeft: 15.0, bottomRight: 15.0)
                                    .fill(ColorConstants.Blue100))
                            .padding(.bottom, getRelativeHeight(199.0))
                            Image("img_tuttoriccopin_211X249")
                                .resizable()
                                .frame(width: getRelativeWidth(249.0),
                                       height: getRelativeHeight(211.0), alignment: .center)
                                .scaledToFit()
                                .clipped()
                                .padding(.top, getRelativeHeight(33.0))
                        }
                        .frame(width: getRelativeWidth(295.0), height: getRelativeHeight(244.0),
                               alignment: .leading)
                        .padding(.trailing, getRelativeWidth(10.0))
                        ZStack(alignment: .leading) {
                            VStack {
                                Image("img_hide")
                                    .resizable()
                                    .frame(width: getRelativeWidth(15.0),
                                           height: getRelativeHeight(13.0), alignment: .center)
                                    .scaledToFit()
                                    .clipped()
                                Image("img_hide")
                                    .resizable()
                                    .frame(width: getRelativeWidth(15.0),
                                           height: getRelativeHeight(13.0), alignment: .center)
                                    .scaledToFit()
                                    .clipped()
                                    .padding(.top, getRelativeHeight(64.0))
                            }
                            .frame(width: getRelativeWidth(15.0), height: getRelativeHeight(91.0),
                                   alignment: .bottomTrailing)
                            .padding(.top, getRelativeHeight(149.54))
                            .padding(.leading, getRelativeWidth(253.29))
                            VStack(alignment: .leading, spacing: 0) {
                                VStack(alignment: .leading, spacing: 0) {
                                    Text(StringConstants.kMsgItHappensToT)
                                        .font(FontScheme
                                            .kInterMedium(size: getRelativeHeight(16.0)))
                                        .fontWeight(.medium)
                                        .foregroundColor(ColorConstants.Black90099)
                                        .minimumScaleFactor(0.5)
                                        .multilineTextAlignment(.leading)
                                        .frame(width: getRelativeWidth(215.0),
                                               height: getRelativeHeight(19.0),
                                               alignment: .topLeading)
                                        .padding(.leading, getRelativeWidth(4.0))
                                        .padding(.trailing, getRelativeWidth(4.0))
                                    Text(StringConstants.kMsgCreateANewPa)
                                        .font(FontScheme
                                            .kInterExtraBold(size: getRelativeHeight(36.4127)))
                                        .fontWeight(.heavy)
                                        .foregroundColor(ColorConstants.Black900)
                                        .minimumScaleFactor(0.5)
                                        .multilineTextAlignment(.leading)
                                        .frame(width: getRelativeWidth(234.0),
                                               height: getRelativeHeight(78.0),
                                               alignment: .topLeading)
                                        .padding(.top, getRelativeHeight(12.0))
                                        .padding(.leading, getRelativeWidth(4.0))
                                        .padding(.trailing, getRelativeWidth(10.0))
                                    VStack {
                                        Group {
                                            HStack {
                                                SecureField(StringConstants.kLblNewPassword,
                                                            text: $resetPasswordViewModel
                                                                .inputtextnoneText)
                                                    .font(FontScheme
                                                        .kInterRegular(size: getRelativeHeight(12.0)))
                                                    .foregroundColor(ColorConstants.Black900Cc)
                                                    .padding()
                                                    .keyboardType(.default)
                                            }
                                            .onChange(of: resetPasswordViewModel
                                                .inputtextnoneText) { newValue in

                                                    resetPasswordViewModel
                                                        .isValidInputtextnoneText = newValue
                                                        .isValidPassword(isMandatory: true)
                                            }
                                            .frame(width: getRelativeWidth(295.0),
                                                   height: getRelativeHeight(58.0),
                                                   alignment: .leading)
                                            .overlay(RoundedCorners(topLeft: 29.0, topRight: 29.0,
                                                                    bottomLeft: 29.0,
                                                                    bottomRight: 29.0)
                                                    .stroke(ColorConstants.Gray700,
                                                            lineWidth: 1))
                                            .background(RoundedCorners(topLeft: 29.0,
                                                                       topRight: 29.0,
                                                                       bottomLeft: 29.0,
                                                                       bottomRight: 29.0)
                                                    .fill(ColorConstants.WhiteA700))
                                            if !resetPasswordViewModel.isValidInputtextnoneText {
                                                Text("Please enter valid password.")
                                                    .foregroundColor(Color.red)
                                                    .font(FontScheme
                                                        .kInterRegular(size: getRelativeHeight(12.0)))
                                                    .frame(width: getRelativeWidth(295.0),
                                                           height: getRelativeHeight(58.0),
                                                           alignment: .leading)
                                            }
                                        }
                                    }
                                    .frame(width: getRelativeWidth(295.0),
                                           height: getRelativeHeight(58.0), alignment: .leading)
                                    .clipShape(Capsule())
                                    .padding(.top, getRelativeHeight(17.0))
                                    VStack {
                                        Group {
                                            HStack {
                                                TextField(StringConstants.kLblRetypePassword,
                                                          text: $resetPasswordViewModel
                                                              .inputtextnoneoneText)
                                                    .font(FontScheme
                                                        .kInterRegular(size: getRelativeHeight(12.0)))
                                                    .foregroundColor(ColorConstants.Black900Cc)
                                                    .padding()
                                                    .keyboardType(.default)
                                            }
                                            .onChange(of: resetPasswordViewModel
                                                .inputtextnoneoneText) { newValue in

                                                    resetPasswordViewModel
                                                        .isValidInputtextnoneoneText = newValue
                                                        .isValidPassword(isMandatory: true)
                                            }
                                            .frame(width: getRelativeWidth(295.0),
                                                   height: getRelativeHeight(58.0),
                                                   alignment: .leading)
                                            .overlay(RoundedCorners(topLeft: 29.0, topRight: 29.0,
                                                                    bottomLeft: 29.0,
                                                                    bottomRight: 29.0)
                                                    .stroke(ColorConstants.Gray700,
                                                            lineWidth: 1))
                                            .background(RoundedCorners(topLeft: 29.0,
                                                                       topRight: 29.0,
                                                                       bottomLeft: 29.0,
                                                                       bottomRight: 29.0)
                                                    .fill(ColorConstants.WhiteA700))
                                            if !resetPasswordViewModel.isValidInputtextnoneoneText {
                                                Text("Please enter valid password.")
                                                    .foregroundColor(Color.red)
                                                    .font(FontScheme
                                                        .kInterRegular(size: getRelativeHeight(12.0)))
                                                    .frame(width: getRelativeWidth(295.0),
                                                           height: getRelativeHeight(58.0),
                                                           alignment: .leading)
                                            }
                                        }
                                    }
                                    .frame(width: getRelativeWidth(295.0),
                                           height: getRelativeHeight(58.0), alignment: .leading)
                                    .clipShape(Capsule())
                                    .padding(.top, getRelativeHeight(20.0))
                                }
                                .frame(width: getRelativeWidth(295.0),
                                       height: getRelativeHeight(263.0), alignment: .leading)
                                .background(RoundedCorners(topLeft: 100.0, topRight: 100.0,
                                                           bottomLeft: 100.0, bottomRight: 100.0))
                                VStack {
                                    VStack {
                                        Button(action: {
                                            resetPasswordViewModel.nextScreen = "SignInView"
                                        }, label: {
                                            HStack(spacing: 0) {
                                                Text(StringConstants.kMsgResetYourPass)
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
                                               height: getRelativeHeight(60.0),
                                               alignment: .topLeading)
                                        .background(RoundedCorners(topLeft: 28.5, topRight: 28.5,
                                                                   bottomLeft: 28.5,
                                                                   bottomRight: 28.5)
                                                .fill(ColorConstants.Red400))
                                    }
                                    .frame(width: getRelativeWidth(295.0),
                                           height: getRelativeHeight(60.0), alignment: .leading)
                                    .background(RoundedCorners(topLeft: 28.5, topRight: 28.5,
                                                               bottomLeft: 28.5, bottomRight: 28.5))
                                }
                                .frame(width: getRelativeWidth(295.0),
                                       height: getRelativeHeight(60.0), alignment: .leading)
                                .shadow(color: ColorConstants.Indigo30028, radius: 40, x: 0, y: 10)
                                .padding(.top, getRelativeHeight(21.0))
                            }
                            .frame(width: getRelativeWidth(295.0), height: getRelativeHeight(344.0),
                                   alignment: .leading)
                        }
                        .hideNavigationBar()
                        .frame(width: getRelativeWidth(295.0), height: getRelativeHeight(344.0),
                               alignment: .trailing)
                        .padding(.top, getRelativeHeight(27.0))
                        .padding(.leading, getRelativeWidth(10.0))
                        Text(StringConstants.kMsgDonTHaveAnA)
                            .font(FontScheme.kNotoSans(size: getRelativeHeight(13.0)))
                            .fontWeight(.regular)
                            .foregroundColor(ColorConstants.Black900)
                            .minimumScaleFactor(0.5)
                            .multilineTextAlignment(.leading)
                            .frame(width: getRelativeWidth(195.0), height: getRelativeHeight(14.0),
                                   alignment: .topLeading)
                            .padding(.top, getRelativeHeight(35.0))
                            .padding(.horizontal, getRelativeWidth(49.0))
                            .onTapGesture {
                                resetPasswordViewModel.nextScreen = "SignUpView"
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
                            .padding(.horizontal, getRelativeWidth(10.0))
                            .onTapGesture {
                                resetPasswordViewModel.nextScreen = "SignInView"
                            }
                    }
                    .frame(width: getRelativeWidth(313.0), height: getRelativeHeight(685.0),
                           alignment: .topLeading)
                    .padding(.trailing, getRelativeWidth(41.0))
                }
                .hideNavigationBar()
                .frame(width: UIScreen.main.bounds.width, alignment: .topLeading)
                .background(ColorConstants.WhiteA700)
                .padding(.top, getRelativeHeight(30.0))
                .padding(.bottom, getRelativeHeight(10.0))
                Group {
                    NavigationLink(destination: SignInView(),
                                   tag: "SignInView",
                                   selection: $resetPasswordViewModel.nextScreen,
                                   label: {
                                       EmptyView()
                                   })
                    NavigationLink(destination: SignUpView(),
                                   tag: "SignUpView",
                                   selection: $resetPasswordViewModel.nextScreen,
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

struct ResetPasswordView_Previews: PreviewProvider {
    static var previews: some View {
        ResetPasswordView()
    }
}
