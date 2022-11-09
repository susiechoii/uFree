import SwiftUI

struct SignUpView: View {
    @StateObject var signUpViewModel = SignUpViewModel()
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
                        Text(StringConstants.kLblSignUp)
                            .font(FontScheme.kInterExtraBold(size: getRelativeHeight(36.4127)))
                            .fontWeight(.heavy)
                            .foregroundColor(ColorConstants.Black900)
                            .minimumScaleFactor(0.5)
                            .multilineTextAlignment(.leading)
                            .frame(width: getRelativeWidth(137.0), height: getRelativeHeight(36.0),
                                   alignment: .topLeading)
                            .padding(.top, getRelativeHeight(48.0))
                            .padding(.horizontal, getRelativeWidth(20.0))
                        Text(StringConstants.kMsgCreateANewAc)
                            .font(FontScheme.kInterMedium(size: getRelativeHeight(16.0)))
                            .fontWeight(.medium)
                            .foregroundColor(ColorConstants.Black90099)
                            .minimumScaleFactor(0.5)
                            .multilineTextAlignment(.leading)
                            .frame(width: getRelativeWidth(172.0), height: getRelativeHeight(16.0),
                                   alignment: .topLeading)
                            .padding(.top, getRelativeHeight(12.0))
                            .padding(.horizontal, getRelativeWidth(20.0))
                    }
                    .frame(width: getRelativeWidth(313.0), height: getRelativeHeight(158.0),
                           alignment: .leading)
                    .padding(.top, getRelativeHeight(9.0))
                    .padding(.horizontal, getRelativeWidth(21.0))
                    VStack {
                        ZStack(alignment: .topLeading) {
                            VStack {
                                VStack {
                                    Text(StringConstants.kLblFullName)
                                        .font(FontScheme
                                            .kInterRegular(size: getRelativeHeight(12.0)))
                                        .fontWeight(.regular)
                                        .foregroundColor(ColorConstants.Black900Cc)
                                        .minimumScaleFactor(0.5)
                                        .multilineTextAlignment(.leading)
                                        .frame(width: getRelativeWidth(54.0),
                                               height: getRelativeHeight(12.0),
                                               alignment: .topLeading)
                                        .padding(.horizontal, getRelativeWidth(27.0))
                                    Group {
                                        HStack {
                                            TextField(StringConstants.kLblEmail,
                                                      text: $signUpViewModel.groupsevenText)
                                                .font(FontScheme
                                                    .kInterRegular(size: getRelativeHeight(12.0)))
                                                .foregroundColor(ColorConstants.Black900Cc)
                                                .padding()
                                                .keyboardType(.emailAddress)
                                        }
                                        .onChange(of: signUpViewModel.groupsevenText) { newValue in

                                            signUpViewModel.isValidGroupsevenText = newValue
                                                .isValidEmail(isMandatory: true)
                                        }
                                        .frame(width: getRelativeWidth(295.0),
                                               height: getRelativeHeight(58.0), alignment: .leading)
                                        .overlay(RoundedCorners(topLeft: 29.0, topRight: 29.0,
                                                                bottomLeft: 29.0, bottomRight: 29.0)
                                                .stroke(ColorConstants.Gray700,
                                                        lineWidth: 1))
                                        .background(RoundedCorners(topLeft: 29.0, topRight: 29.0,
                                                                   bottomLeft: 29.0,
                                                                   bottomRight: 29.0)
                                                .fill(ColorConstants.WhiteA700))
                                        .padding(.top, getRelativeHeight(43.0))
                                        if !signUpViewModel.isValidGroupsevenText {
                                            Text("Please enter valid email.")
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
                                       height: getRelativeHeight(113.0), alignment: .leading)
                                .clipShape(Capsule())
                            }
                            .frame(width: getRelativeWidth(295.0), height: getRelativeHeight(116.0),
                                   alignment: .bottomLeading)
                            .clipShape(Capsule())
                            .padding(.top, getRelativeHeight(29.0))
                            ZStack(alignment: .topLeading) {
                                VStack {
                                    ZStack {}
                                        .hideNavigationBar()
                                        .frame(width: getRelativeWidth(49.0),
                                               height: getRelativeHeight(1.0), alignment: .leading)
                                        .background(ColorConstants.WhiteA700)
                                        .padding(.bottom, getRelativeHeight(57.0))
                                        .padding(.horizontal, getRelativeWidth(20.0))
                                }
                                .frame(width: getRelativeWidth(295.0),
                                       height: getRelativeHeight(58.0), alignment: .bottomLeading)
                                .overlay(RoundedCorners(topLeft: 29.0, topRight: 29.0,
                                                        bottomLeft: 29.0, bottomRight: 29.0)
                                        .stroke(ColorConstants.BlueA200,
                                                lineWidth: 1))
                                .background(RoundedCorners(topLeft: 29.0, topRight: 29.0,
                                                           bottomLeft: 29.0, bottomRight: 29.0)
                                        .fill(Color.clear.opacity(0.7)))
                                .padding(.top, getRelativeHeight(9.0))
                                Text(StringConstants.kLblName)
                                    .font(FontScheme.kInterRegular(size: getRelativeHeight(12.0)))
                                    .fontWeight(.regular)
                                    .foregroundColor(ColorConstants.Black900)
                                    .minimumScaleFactor(0.5)
                                    .multilineTextAlignment(.leading)
                                    .frame(width: getRelativeWidth(34.0),
                                           height: getRelativeHeight(18.0), alignment: .topLeading)
                                    .shadow(color: ColorConstants.Black9003f, radius: 4, x: 0, y: 4)
                                    .padding(.bottom, getRelativeHeight(49.0))
                                    .padding(.trailing, getRelativeWidth(233.0))
                            }
                            .hideNavigationBar()
                            .frame(width: getRelativeWidth(295.0), height: getRelativeHeight(67.0),
                                   alignment: .topLeading)
                            .padding(.bottom, getRelativeHeight(78.0))
                        }
                        .hideNavigationBar()
                        .frame(width: getRelativeWidth(295.0), height: getRelativeHeight(145.0),
                               alignment: .center)
                        .padding(.leading, getRelativeWidth(18.0))
                        VStack {
                            Group {
                                HStack {
                                    TextField(StringConstants.kLblPhoneNumber,
                                              text: $signUpViewModel.inputtextnoneText)
                                        .font(FontScheme
                                            .kInterRegular(size: getRelativeHeight(12.0)))
                                        .foregroundColor(ColorConstants.Black900Cc)
                                        .padding()
                                        .keyboardType(.phonePad)
                                }
                                .onChange(of: signUpViewModel.inputtextnoneText) { newValue in

                                    signUpViewModel.isValidInputtextnoneText = newValue
                                        .isValidPhone(isMandatory: false)
                                }
                                .frame(width: getRelativeWidth(295.0),
                                       height: getRelativeHeight(58.0), alignment: .leading)
                                .overlay(RoundedCorners(topLeft: 29.0, topRight: 29.0,
                                                        bottomLeft: 29.0, bottomRight: 29.0)
                                        .stroke(ColorConstants.Gray700,
                                                lineWidth: 1))
                                .background(RoundedCorners(topLeft: 29.0, topRight: 29.0,
                                                           bottomLeft: 29.0, bottomRight: 29.0)
                                        .fill(ColorConstants.WhiteA700))
                                if !signUpViewModel.isValidInputtextnoneText {
                                    Text("Please enter valid phone number.")
                                        .foregroundColor(Color.red)
                                        .font(FontScheme
                                            .kInterRegular(size: getRelativeHeight(12.0)))
                                        .frame(width: getRelativeWidth(295.0),
                                               height: getRelativeHeight(58.0), alignment: .leading)
                                }
                            }
                        }
                        .frame(width: getRelativeWidth(295.0), height: getRelativeHeight(58.0),
                               alignment: .center)
                        .clipShape(Capsule())
                        .padding(.top, getRelativeHeight(20.0))
                        .padding(.leading, getRelativeWidth(18.0))
                        VStack {
                            Group {
                                HStack {
                                    SecureField(StringConstants.kLblPassword,
                                                text: $signUpViewModel.inputtextnoneoneText)
                                        .font(FontScheme
                                            .kInterRegular(size: getRelativeHeight(12.0)))
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
                                        .padding(.trailing, getRelativeWidth(21.0))
                                    Spacer()
                                }
                                .onChange(of: signUpViewModel.inputtextnoneoneText) { newValue in

                                    signUpViewModel.isValidInputtextnoneoneText = newValue
                                        .isValidPassword(isMandatory: true)
                                }
                                .frame(width: getRelativeWidth(295.0),
                                       height: getRelativeHeight(58.0), alignment: .leading)
                                .overlay(RoundedCorners(topLeft: 29.0, topRight: 29.0,
                                                        bottomLeft: 29.0, bottomRight: 29.0)
                                        .stroke(ColorConstants.Gray700,
                                                lineWidth: 1))
                                .background(RoundedCorners(topLeft: 29.0, topRight: 29.0,
                                                           bottomLeft: 29.0, bottomRight: 29.0)
                                        .fill(ColorConstants.WhiteA700))
                                if !signUpViewModel.isValidInputtextnoneoneText {
                                    Text("Please enter valid password.")
                                        .foregroundColor(Color.red)
                                        .font(FontScheme
                                            .kInterRegular(size: getRelativeHeight(12.0)))
                                        .frame(width: getRelativeWidth(295.0),
                                               height: getRelativeHeight(58.0), alignment: .leading)
                                }
                            }
                        }
                        .frame(width: getRelativeWidth(295.0), height: getRelativeHeight(58.0),
                               alignment: .center)
                        .clipShape(Capsule())
                        .padding(.top, getRelativeHeight(20.0))
                        .padding(.leading, getRelativeWidth(18.0))
                        VStack {
                            Group {
                                HStack {
                                    SecureField(StringConstants.kMsgConfirmPasswor,
                                                text: $signUpViewModel.inputtextnonetwoText)
                                        .font(FontScheme
                                            .kInterRegular(size: getRelativeHeight(12.0)))
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
                                        .padding(.trailing, getRelativeWidth(21.0))
                                    Spacer()
                                }
                                .onChange(of: signUpViewModel.inputtextnonetwoText) { newValue in

                                    signUpViewModel.isValidInputtextnonetwoText = newValue
                                        .isValidPassword(isMandatory: true)
                                }
                                .frame(width: getRelativeWidth(295.0),
                                       height: getRelativeHeight(58.0), alignment: .leading)
                                .overlay(RoundedCorners(topLeft: 29.0, topRight: 29.0,
                                                        bottomLeft: 29.0, bottomRight: 29.0)
                                        .stroke(ColorConstants.Gray700,
                                                lineWidth: 1))
                                .background(RoundedCorners(topLeft: 29.0, topRight: 29.0,
                                                           bottomLeft: 29.0, bottomRight: 29.0)
                                        .fill(ColorConstants.WhiteA700))
                                if !signUpViewModel.isValidInputtextnonetwoText {
                                    Text("Please enter valid password.")
                                        .foregroundColor(Color.red)
                                        .font(FontScheme
                                            .kInterRegular(size: getRelativeHeight(12.0)))
                                        .frame(width: getRelativeWidth(295.0),
                                               height: getRelativeHeight(58.0), alignment: .leading)
                                }
                            }
                        }
                        .frame(width: getRelativeWidth(295.0), height: getRelativeHeight(58.0),
                               alignment: .center)
                        .clipShape(Capsule())
                        .padding(.top, getRelativeHeight(20.0))
                        .padding(.leading, getRelativeWidth(18.0))
                        VStack {
                            VStack {
                                Button(action: {
                                    createUser()
                                    signUpViewModel.nextScreen = "OnboardAvailabilityScreenView"

                                }, label: {
                                    HStack(spacing: 0) {
                                        Text(StringConstants.kLblSignUp2)
                                            .font(FontScheme
                                                .kInterBlack(size: getRelativeHeight(15.0)))
                                            .fontWeight(.black)
                                            .padding(.horizontal, getRelativeWidth(30.0))
                                            .padding(.vertical, getRelativeHeight(22.0))
                                            .foregroundColor(ColorConstants.WhiteA700)
                                            .minimumScaleFactor(0.5)
                                            .multilineTextAlignment(.center)
                                            .frame(width: getRelativeWidth(295.0),
                                                   height: getRelativeHeight(60.0),
                                                   alignment: .center)
                                            .background(RoundedCorners(topLeft: 28.5,
                                                                       topRight: 28.5,
                                                                       bottomLeft: 28.5,
                                                                       bottomRight: 28.5)
                                                    .fill(ColorConstants.Red400))
                                    }
                                })
                                .frame(width: getRelativeWidth(295.0),
                                       height: getRelativeHeight(60.0), alignment: .center)
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
                        .padding(.top, getRelativeHeight(29.0))
                        .padding(.leading, getRelativeWidth(18.0))
                        Text(StringConstants.kMsgHaveAnAccount)
                            .font(FontScheme.kNotoSans(size: getRelativeHeight(13.0)))
                            .fontWeight(.regular)
                            .foregroundColor(ColorConstants.Black900)
                            .minimumScaleFactor(0.5)
                            .multilineTextAlignment(.leading)
                            .frame(width: getRelativeWidth(157.0), height: getRelativeHeight(14.0),
                                   alignment: .topLeading)
                            .padding(.top, getRelativeHeight(14.0))
                            .padding(.horizontal, getRelativeWidth(18.0))
                            .onTapGesture {
                                signUpViewModel.nextScreen = "SignInView"
                            }
                    }
                    .frame(width: getRelativeWidth(313.0), height: getRelativeHeight(497.0),
                           alignment: .leading)
                    .padding(.vertical, getRelativeHeight(25.0))
                    .padding(.horizontal, getRelativeWidth(21.0))
                }
                .frame(width: UIScreen.main.bounds.width, alignment: .topLeading)
                .background(ColorConstants.WhiteA700)
                .padding(.top, getRelativeHeight(30.0))
                .padding(.bottom, getRelativeHeight(10.0))
                Group {
                    NavigationLink(destination: OnboardAvailabilityScreenView(),
                                   tag: "OnboardAvailabilityScreenView",
                                   selection: $signUpViewModel.nextScreen,
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



struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}

func createUser() {
    var testBackend = Backend()
    
    var listOfHours: [Int] = []
    
    UserDefaults.standard.set(listOfHours, forKey: "listOfHours")
    
    testBackend.createUser(newEmail: "xcodereeeeallysucks@gmail.com", newPassword: "fuckyouxcodeevenmore")
    
    var testUserDefaultEmail = String(describing: UserDefaults.standard.object(forKey: "email")!)
    var testUserDefaultPassword = String(describing: UserDefaults.standard.object(forKey: "password")!)
    var testLoggedIn = String(describing: UserDefaults.standard.object(forKey: "loggedIn")!)
    
    print("LOGGING IN email: \(testUserDefaultEmail), password: \(testUserDefaultPassword), LOGGED IN WOOO: \(testLoggedIn)")
    

}
