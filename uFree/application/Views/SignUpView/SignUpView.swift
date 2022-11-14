import SwiftUI

struct SignUpView: View {
    @StateObject var signUpViewModel = SignUpViewModel()
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    //User input variables
    @State var userNameInput = ""
    @State var userEmailInput = ""
    @State var userPhoneInput = ""
    @State var userPasswordInput = ""
    @State var userConfirmedPasswordInput = ""
    
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
                    
                    //the Name Vstack
                    
                    VStack {
                        Group {
                            HStack {
                                TextField(StringConstants.kLblFullName,
                                          text: $signUpViewModel.groupNameText)
                                    .font(FontScheme
                                        .kInterRegular(size: getRelativeHeight(12.0)))
                                    .foregroundColor(ColorConstants.Black900Cc)
                                    .padding()
                                    .keyboardType(.default)
                            }
                            .onChange(of: signUpViewModel.groupNameText) { newValue in

                                signUpViewModel.groupNameText = newValue
                                print($signUpViewModel.groupNameText.wrappedValue)
                                userNameInput = $signUpViewModel.groupNameText.wrappedValue
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
                        }
                    }
                    .frame(width: getRelativeWidth(295.0), height: getRelativeHeight(58.0),
                           alignment: .center)
                    .clipShape(Capsule())
                    .padding(.top, getRelativeHeight(20.0))
                    .padding(.leading, getRelativeWidth(18.0))
                    
                    //the email Vstack
                    
                    VStack {
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
                                
                                print($signUpViewModel.groupsevenText.wrappedValue)
                                userEmailInput = $signUpViewModel.groupsevenText.wrappedValue
                                
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
                            if !signUpViewModel.isValidGroupsevenText {
                                
                                //FIX ME
                                //THIS SHOULD BE IF: THE USER CLICKS SIGN UP AND THE INPUT IS NOT VALID!
                                /*
                                Text("Please enter valid email.")
                                    .foregroundColor(Color.red)
                                    .font(FontScheme
                                        .kInterRegular(size: getRelativeHeight(12.0)))
                                    .frame(width: getRelativeWidth(295.0),
                                           height: getRelativeHeight(58.0), alignment: .leading)
                                */
                            }
                        }
                    }
                    .frame(width: getRelativeWidth(295.0), height: getRelativeHeight(58.0),
                           alignment: .center)
                    .clipShape(Capsule())
                    .padding(.top, getRelativeHeight(20.0))
                    .padding(.leading, getRelativeWidth(18.0))
                    
                    
                    
                    
                        
                        //the phone number Vstack
                        
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
                                    
                                    print($signUpViewModel.inputtextnoneText.wrappedValue)
                                    
                                    userPhoneInput = $signUpViewModel.inputtextnoneText.wrappedValue
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
                                    //FIX ME
                                    //THIS SHOULD BE IF: THE USER CLICKS SIGN UP AND THE INPUT IS NOT VALID!
                                    /*
                                    Text("Please enter valid phone number.")
                                        .foregroundColor(Color.red)
                                        .font(FontScheme
                                            .kInterRegular(size: getRelativeHeight(12.0)))
                                        .frame(width: getRelativeWidth(295.0),
                                               height: getRelativeHeight(58.0), alignment: .leading)
                                     */
                                }
                            }
                        }
                        .frame(width: getRelativeWidth(295.0), height: getRelativeHeight(58.0),
                               alignment: .center)
                        .clipShape(Capsule())
                        .padding(.top, getRelativeHeight(20.0))
                        .padding(.leading, getRelativeWidth(18.0))
                        
                        //the password Vstack
                        
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
                                    
                                    print($signUpViewModel.inputtextnoneoneText.wrappedValue)
                                    
                                    userPasswordInput = $signUpViewModel.inputtextnoneoneText.wrappedValue
                                    
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
                                    //FIX ME
                                    //THIS SHOULD BE IF: THE USER CLICKS SIGN UP AND THE INPUT IS NOT VALID!
                                    /*
                                    Text("Please enter valid password.")
                                        .foregroundColor(Color.red)
                                        .font(FontScheme
                                            .kInterRegular(size: getRelativeHeight(12.0)))
                                        .frame(width: getRelativeWidth(295.0),
                                               height: getRelativeHeight(58.0), alignment: .leading)
                                    */
                                }
                            }
                        }
                        .frame(width: getRelativeWidth(295.0), height: getRelativeHeight(58.0),
                               alignment: .center)
                        .clipShape(Capsule())
                        .padding(.top, getRelativeHeight(20.0))
                        .padding(.leading, getRelativeWidth(18.0))
                        
                        //the confirm password Vstack
                        
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
                                    print($signUpViewModel.inputtextnonetwoText.wrappedValue)
                                    userConfirmedPasswordInput = $signUpViewModel.inputtextnonetwoText.wrappedValue
                                    
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
                                    
                                    //FIX ME
                                    //THIS SHOULD BE IF: THE USER CLICKS SIGN UP AND THE INPUT IS NOT VALID!
                                    /*
                                    Text("Please enter valid password.")
                                        .foregroundColor(Color.red)
                                        .font(FontScheme
                                            .kInterRegular(size: getRelativeHeight(12.0)))
                                        .frame(width: getRelativeWidth(295.0),
                                               height: getRelativeHeight(58.0), alignment: .leading)
                                    */
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
                                    createUser(emailInput: userEmailInput, pwInput: userPasswordInput)
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
                    NavigationLink(destination: SignInView(),
                                   tag: "SignInView",
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

func createUser(emailInput: String, pwInput: String) {
    var testBackend = Backend()
    
    var listOfHours: [Int] = []
    
    UserDefaults.standard.set(listOfHours, forKey: "listOfHours")
    
    print("YOUR EMAIL WAS \(emailInput)")
    print("YOUR PW WAS \(pwInput)")
    testBackend.createUser(newEmail: emailInput, newPassword: pwInput)
    
    var testUserDefaultEmail = String(describing: UserDefaults.standard.object(forKey: "email")!)
    var testUserDefaultPassword = String(describing: UserDefaults.standard.object(forKey: "password")!)
    var testLoggedIn = String(describing: UserDefaults.standard.object(forKey: "loggedIn")!)
    
    print("SIGN UP LOGGING IN email: \(testUserDefaultEmail), password: \(testUserDefaultPassword), LOGGED IN WOOO: \(testLoggedIn)")
    

}
