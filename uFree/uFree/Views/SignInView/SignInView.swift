// SignUpView.swift
// uFree

import SwiftUI
import Combine
import FirebaseAnalyticsSwift

// to prepare the email and password field to hash
private enum FocusableField: Hashable {
    case email
    case password
}

struct SignInView: View {
    // State object for sign in view model
    @StateObject var signInViewModel = SignInViewModel()
    
    // Environment objects for the Authentication View Model
    @EnvironmentObject var viewModel:AuthenticationViewModel
    @Environment(\.dismiss) var dismiss
    
    // State variables for email and user input
    @State var userEmailInput = ""
    @State var userPasswordInput = ""
    
    // Variable for the back button
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    // Focus state for the text fields
    @FocusState private var focus: FocusableField?
    
    // Function to sign in with email and password
    private func signInWithEmailPassword() {
        Task {
            if await viewModel.signInWithEmailPassword() == true {
                dismiss()
            }
        }
    }
    
    
    var body: some View {
        NavigationView {
            VStack {
                VStack {
                    ZStack(alignment: .topLeading) {
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
                                .padding(.top, getRelativeHeight(63.0))
                        }
                        .frame(width: getRelativeWidth(15.0), height: getRelativeHeight(90.0),
                               alignment: .bottomTrailing)
                        .padding(.top, getRelativeHeight(420.54))
                        .padding(.leading, getRelativeWidth(275.29))
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
                        .padding(.bottom, getRelativeHeight(570.0))
                        .padding(.trailing, getRelativeWidth(283.0))
                        Image("img_tuttoriccopin_375X322")
                            .resizable()
                            .frame(width: getRelativeWidth(322.0), height: getRelativeHeight(375.0),
                                   alignment: .center)
                            .scaledToFit()
                            .clipped( )
                            .padding(.bottom, getRelativeHeight(237.0))
                            .padding(.leading, getRelativeWidth(6.0))
                        
                        
                        VStack(alignment: .leading, spacing: 0) {
                            VStack(alignment: .leading, spacing: 0) {
                                Text(StringConstants.kMsgAlreadyHaveAn)
                                    .font(FontScheme.kInterMedium(size: getRelativeHeight(16.0)))
                                    .fontWeight(.medium)
                                    .foregroundColor(ColorConstants.Black90099)
                                    .minimumScaleFactor(0.5)
                                    .multilineTextAlignment(.leading)
                                    .frame(width: getRelativeWidth(197.0),
                                           height: getRelativeHeight(16.0), alignment: .topLeading)
                                    .padding(.leading, getRelativeWidth(5.0))
                                    .padding(.trailing, getRelativeWidth(5.0))
                                Text(StringConstants.kLblLogIn)
                                    .font(FontScheme
                                        .kInterExtraBold(size: getRelativeHeight(36.4127)))
                                    .fontWeight(.heavy)
                                    .foregroundColor(ColorConstants.Black900)
                                    .minimumScaleFactor(0.5)
                                    .multilineTextAlignment(.leading)
                                    .frame(width: getRelativeWidth(106.0),
                                           height: getRelativeHeight(36.0), alignment: .topLeading)
                                    .padding(.top, getRelativeHeight(11.0))
                                    .padding(.leading, getRelativeWidth(5.0))
                                    .padding(.trailing, getRelativeWidth(10.0))
                                
                                
                                // LOGIN EMAIL VSTACK
                                VStack {
                                    HStack {
                                        TextField("Email",
                                                  text: $viewModel.email)
                                        .font(FontScheme
                                            .kInterRegular(size: getRelativeHeight(12.0)))
                                        .foregroundColor(ColorConstants.Black900Cc)
                                        .padding()
                                        .keyboardType(.emailAddress)
                                        .submitLabel(.next)
                                        .disableAutocorrection(true)
                                        .textInputAutocapitalization(.never)
                                        .focused($focus, equals: .email)
                                        
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
                                }
                                
                                .frame(width: getRelativeWidth(295.0),
                                       height: getRelativeHeight(58.0), alignment: .leading)
                                .clipShape(Capsule())
                                .padding(.top, getRelativeHeight(14.0))
                                
                                
                                // LOGIN PASSWORD VSTACK
                                VStack {
                                    HStack {
                                        SecureField("Password",
                                                    text: $viewModel.password)
                                        .font(FontScheme
                                            .kInterRegular(size: getRelativeHeight(12.0)))
                                        .foregroundColor(ColorConstants.Black900Cc)
                                        .padding()
                                        .focused($focus, equals: .password)
                                        .submitLabel(.go)
                                        .onSubmit {
                                            signInWithEmailPassword()
                                        }
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
                                }
                                .frame(width: getRelativeWidth(295.0),
                                       height: getRelativeHeight(58.0), alignment: .leading)
                                .clipShape(Capsule())
                                .padding(.top, getRelativeHeight(20.0))
                            }
                            .frame(width: getRelativeWidth(295.0), height: getRelativeHeight(217.0),
                                   alignment: .leading)
                            
                            // Print error message if unable to log in
                            if !viewModel.errorMessage.isEmpty {
                                VStack {
                                    Text(viewModel.errorMessage)
                                        .foregroundColor(Color(UIColor.systemRed))
                                }
                            }
                            
                            // Log In button
                            VStack {
                                VStack {
                                    Button(action: signInWithEmailPassword) {
                                        if viewModel.authenticationState != .authenticating {
                                            Text("Login")
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
                                        else {
                                            ProgressView()
                                                .progressViewStyle(CircularProgressViewStyle(tint: .white))
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
                                                                           bottomRight: 28.5))
                                            
                                        }
                                    }
                                    .disabled(!viewModel.isValid)
                                    
                                }
                                .frame(width: getRelativeWidth(295.0),
                                       height: getRelativeHeight(60.0), alignment: .leading)
                                .background(RoundedCorners(topLeft: 28.5, topRight: 28.5,
                                                           bottomLeft: 28.5, bottomRight: 28.5))
                            }
                            .frame(width: getRelativeWidth(295.0), height: getRelativeHeight(60.0),
                                   alignment: .leading)
                            .shadow(color: ColorConstants.Indigo30028, radius: 40, x: 0, y: 10)
                            .padding(.top, getRelativeHeight(21.0))
                        }
                        .frame(width: getRelativeWidth(295.0), height: getRelativeHeight(298.0),
                               alignment: .center)
                        .padding(.top, getRelativeHeight(317.0))
                        .padding(.leading, getRelativeWidth(18.0))
                        .padding(.trailing, getRelativeWidth(15.0))
                    }
                    .hideNavigationBar()
                    .frame(width: getRelativeWidth(328.0), height: getRelativeHeight(615.0),
                           alignment: .center)
                    .padding(.top, getRelativeHeight(9.0))
                    .padding(.horizontal, getRelativeWidth(21.0))
                    Text(StringConstants.kMsgDonTHaveAnA)
                        .font(FontScheme.kNotoSans(size: getRelativeHeight(13.0)))
                        .fontWeight(.regular)
                        .foregroundColor(ColorConstants.Black900)
                        .minimumScaleFactor(0.5)
                        .multilineTextAlignment(.leading)
                        .frame(width: getRelativeWidth(195.0), height: getRelativeHeight(14.0),
                               alignment: .topLeading)
                        .padding(.top, getRelativeHeight(34.0))
                        .padding(.horizontal, getRelativeWidth(21.0))
                        .onTapGesture {
                            signInViewModel.nextScreen = "SignUpView"
                        }
                    Text(StringConstants.kMsgForgotYourPas)
                        .font(FontScheme.kNotoSans(size: getRelativeHeight(13.0)))
                        .fontWeight(.regular)
                        .foregroundColor(ColorConstants.Black900)
                        .minimumScaleFactor(0.5)
                        .multilineTextAlignment(.leading)
                        .frame(width: getRelativeWidth(193.0), height: getRelativeHeight(14.0),
                               alignment: .topLeading)
                        .padding(.vertical, getRelativeHeight(5.0))
                        .padding(.horizontal, getRelativeWidth(21.0))
                        .onTapGesture {
                            signInViewModel.nextScreen = "ResetCodeView"
                        }
                }
                .frame(width: UIScreen.main.bounds.width, alignment: .topLeading)
                .background(ColorConstants.WhiteA700)
                .padding(.top, getRelativeHeight(30.0))
                .padding(.bottom, getRelativeHeight(10.0))
                Group {
                    NavigationLink(destination: SignUpView(),
                                   tag: "SignUpView",
                                   selection: $signInViewModel.nextScreen,
                                   label: {
                        EmptyView()
                    })
                    NavigationLink(destination: ResetCodeView(),
                                   tag: "ResetCodeView",
                                   selection: $signInViewModel.nextScreen,
                                   label: {
                        EmptyView()
                    })
                    NavigationLink(destination: HomePageView(),
                                   tag: "HomePageView",
                                   selection: $signInViewModel.nextScreen,
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

struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView().environmentObject(AuthenticationViewModel())
    }
}
