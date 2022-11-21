// SignUpView.swift
// uFree

import SwiftUI
import Combine
import FirebaseAnalyticsSwift

private enum FocusableField: Hashable {
    case name
    case email
    case password
    case confirmPassword
}

struct SignUpView: View {
    // State object for the sign up view model
    @StateObject var signUpViewModel = SignUpViewModel()
    
    // Environment objects for the back buttons
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    // Environment object for the view model
    @EnvironmentObject var viewModel: AuthenticationViewModel
    @Environment(\.dismiss) var dismiss
    
    @FocusState private var focus: FocusableField?
    
    // Function for to sign in
    private func signUpWithEmailPassword() {
        Task {
            if await viewModel.signUpWithEmailPassword() == true {
                dismiss()
            }
        }
    }
    
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
                    
                    
                    // ENTER NAME VSTACK
                    VStack {
                        HStack {
                            TextField("Enter Name",
                                      text: $viewModel.name)
                            .font(FontScheme
                                .kInterRegular(size: getRelativeHeight(12.0)))
                            .foregroundColor(ColorConstants.Black900Cc)
                            .padding()
                            .keyboardType(.default)
                            .focused($focus, equals: .name)
                            .submitLabel(.next)
                            .onSubmit {
                                self.focus = .password
                            }
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
                    .frame(width: getRelativeWidth(295.0), height: getRelativeHeight(58.0),
                           alignment: .center)
                    .clipShape(Capsule())
                    .padding(.top, getRelativeHeight(20.0))
                    .padding(.leading, getRelativeWidth(18.0))
                    
                    
                    // ENTER EMAIL VSTACK
                    VStack {
                        HStack {
                            TextField("Enter Email",
                                      text: $viewModel.email)
                            .font(FontScheme
                                .kInterRegular(size: getRelativeHeight(12.0)))
                            .foregroundColor(ColorConstants.Black900Cc)
                            .padding()
                            .keyboardType(.emailAddress)
                            .focused($focus, equals: .email)
                            .submitLabel(.next)
                            .onSubmit {
                                self.focus = .password
                            }
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
                    .frame(width: getRelativeWidth(295.0), height: getRelativeHeight(58.0),
                           alignment: .center)
                    .clipShape(Capsule())
                    .padding(.top, getRelativeHeight(20.0))
                    .padding(.leading, getRelativeWidth(18.0))
                    
                    
                    // ENTER PASSWORD VSTACK
                    VStack {
                        HStack {
                            SecureField("Enter Password",
                                        text: $viewModel.password)
                            .font(FontScheme
                                .kInterRegular(size: getRelativeHeight(12.0)))
                            .foregroundColor(ColorConstants.Black900Cc)
                            .padding()
                            .keyboardType(.default)
                            .focused($focus, equals: .password)
                            .submitLabel(.next)
                            .onSubmit {
                                self.focus = .confirmPassword
                            }
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
                    .frame(width: getRelativeWidth(295.0), height: getRelativeHeight(58.0),
                           alignment: .center)
                    .clipShape(Capsule())
                    .padding(.top, getRelativeHeight(20.0))
                    .padding(.leading, getRelativeWidth(18.0))
                    
                    
                    // CONFIRM PASSWORD VSTACK
                    VStack {
                        Group {
                            HStack {
                                SecureField("Confirm Password",
                                            text: $viewModel.confirmPassword)
                                .font(FontScheme
                                    .kInterRegular(size: getRelativeHeight(12.0)))
                                .foregroundColor(ColorConstants.Black900Cc)
                                .padding()
                                .keyboardType(.default)
                                .focused($focus, equals: .confirmPassword)
                                .submitLabel(.go)
                                .onSubmit {
                                    signUpWithEmailPassword()
                                }
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
                    
                    // print warning message if can't sign up
                    if !viewModel.errorMessage.isEmpty {
                        VStack {
                            Text(viewModel.errorMessage)
                                .foregroundColor(Color(UIColor.systemRed))
                        }
                    }
                    
                    
                    VStack {
                        VStack {
                            Button(action: signUpWithEmailPassword) {
                                if viewModel.authenticationState != .authenticating {
                                    Text("Sign Up")
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
                                                                   bottomRight: 28.5)
                                            .fill(ColorConstants.Red400))
                                }
                            }
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
                    NavigationLink(destination: SignInView().environmentObject(AuthenticationViewModel()),
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
        SignUpView().environmentObject(AuthenticationViewModel())
    }
}

