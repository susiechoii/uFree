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
    @State var inputEmail = ""
    @State var inputPassword = ""
    
    // Variable for the back button
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    // Focus state for the text fields
    @FocusState private var focus: FocusableField?
    
    // Function to sign in with email and password
    private func signInWithEmailPassword() {
        Task {
            if await viewModel.signInWithEmailPassword(inputEmail: inputEmail, inputPassword: inputPassword) == true {
                print("DEBUG: Back at sign in view, sign in true with email:")
            }
        }
    }
    
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading, spacing: 0){
                // BACK BUTTON
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
                .padding(.leading, getRelativeWidth(20))
                .navigationBarHidden(true)
                
                ZStack(alignment: .topLeading) {
                    
                    // PICTURE OF RABBIT DUDE
                    Image("img_tuttoriccopin_375X322")
                        .resizable()
                        .frame(width: getRelativeWidth(322.0), height: getRelativeHeight(375.0),
                               alignment: .center)
                        .scaledToFit()
                        .clipped()
                    
                    
                    VStack(alignment: .leading, spacing: 0) {
                        
                        // ALREADY HAVE AN ACCOUNT TEXT
                        Text("Already have an account?")
                            .font(FontScheme.kInterMedium(size: getRelativeHeight(20)))
                            .fontWeight(.medium)
                            .foregroundColor(ColorConstants.Black90099)
                            .minimumScaleFactor(0.5)
                            .multilineTextAlignment(.leading)
                            .frame(width: getRelativeWidth(197.0),
                                   height: getRelativeHeight(20), alignment: .topLeading)
                            .padding(.leading, getRelativeWidth(5.0))
                            .padding(.trailing, getRelativeWidth(5.0))
                        
                        // SIGN IN TEXT
                        Text("Log In")
                            .font(FontScheme
                                .kInterExtraBold(size: getRelativeHeight(45)))
                            .fontWeight(.heavy)
                            .foregroundColor(ColorConstants.Black900)
                            .minimumScaleFactor(0.5)
                            .multilineTextAlignment(.leading)
                            .frame(width: getRelativeWidth(106.0),
                                   height: getRelativeHeight(45), alignment: .topLeading)
                            .padding(.top, getRelativeHeight(5))
                            .padding(.leading, getRelativeWidth(5.0))
                            .padding(.trailing, getRelativeWidth(10.0))
                        
                        
                        // LOGIN EMAIL VSTACK
                        HStack {
                            TextField("Email",
                                      text: $inputEmail)
                            .font(FontScheme
                                .kInterRegular(size: getRelativeHeight(14.0)))
                            .foregroundColor(ColorConstants.Black900Cc)
                            .padding(.leading, 25)
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
                        .padding(.top, getRelativeWidth(20))
                        
                        
                        // LOGIN PASSWORD VSTACK
                        HStack {
                            SecureField("Password",
                                        text: $inputPassword)
                            .font(FontScheme
                                .kInterRegular(size: getRelativeHeight(14)))
                            .foregroundColor(ColorConstants.Black900Cc)
                            .padding(.leading, 25)
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
                        .padding(.top, getRelativeWidth(15))
                        
                        
                        // print warning message if can't log in
                        if !viewModel.errorMessage.isEmpty {
                            HStack {
                                Text(viewModel.errorMessage)
                                    .foregroundColor(Color(UIColor.systemRed))
                                    .font(FontScheme.kInterExtraLight(size: getRelativeHeight(12)))
                                    
                            }
                            .frame(width: getRelativeWidth(295.0),
                                   height: getRelativeHeight(12.0), alignment: .center)
                            .padding(.top, getRelativeWidth(5))
                            
                        }
                        
                        
                        // LOG IN BUTTON
                        VStack {
                            Button(action: signInWithEmailPassword) {
                                Text("LOG IN")
                                    .font(FontScheme
                                        .kInterExtraBold(size: getRelativeHeight(35.0)))
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
                            
                        }
                        .frame(width: getRelativeWidth(295.0),
                               height: getRelativeHeight(60.0), alignment: .leading)
                        .background(RoundedCorners(topLeft: 28.5, topRight: 28.5,
                                                   bottomLeft: 28.5, bottomRight: 28.5))
                        .padding(.top, getRelativeWidth(25))
                        
                        
                        
                    }
                    .frame(width: getRelativeWidth(295.0), height: getRelativeHeight(298.0),
                           alignment: .center)
                    .padding(.top, getRelativeHeight(317.0))
                    .padding(.leading, getRelativeWidth(18.0))
                    .padding(.trailing, getRelativeWidth(15.0))
                    
 
                }
                .frame(width: UIScreen.main.bounds.width, height: getRelativeHeight(615.0), alignment: .center)
                .padding(.top, 0)
                
                // SIGN UP PAGE REDIRECT
                HStack{
                    Text("Don't have an account?")
                        .font(FontScheme.kInterExtraLight(size: getRelativeHeight(25.0)))
                        .fontWeight(.regular)
                        .foregroundColor(ColorConstants.Black900)
                        .minimumScaleFactor(0.5)
                        .multilineTextAlignment(.trailing)
                        .frame(width: getRelativeWidth(165), height: getRelativeHeight(18.0),
                               alignment: .topLeading)
                        .padding(.trailing, getRelativeWidth(-10))
                    
                    // HYPERLINK THAT LEADS TO PAGE
                    Text("Sign up")
                        .font(FontScheme.kInterBold(size: getRelativeHeight(25.0)))
                        .fontWeight(.bold)
                        .foregroundColor(ColorConstants.BlueA400)
                        .minimumScaleFactor(0.5)
                        .multilineTextAlignment(.trailing)
                        .frame(width: getRelativeWidth(50), height: getRelativeHeight(18.0),
                               alignment: .topLeading)
                        .onTapGesture {
                            presentationMode.wrappedValue.dismiss()
                        }
                }
                .frame(width: UIScreen.main.bounds.width, height: getRelativeHeight(25), alignment: .center)
                .padding(.top, getRelativeHeight(10))
                
                Group {
                    NavigationLink(destination: PrimaryView().environmentObject(viewModel),
                                   tag: "PrimaryView",
                                   selection: $signInViewModel.nextScreen,
                                   label: {
                        EmptyView()
                    })
                }
            }
            .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
            .background(ColorConstants.WhiteA700)
            .padding(.top, 0)
        }
        .navigationBarHidden(true)
    }
}

struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView().environmentObject(AuthenticationViewModel())
    }
}
