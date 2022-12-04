// SignUpView.swift
// uFree

import SwiftUI
import Combine
import Firebase
import FirebaseCore
import FirebaseFirestore
import FirebaseAuth

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
    
    @State var inputName = ""
    @State var inputEmail = ""
    @State var inputPassword = ""
    @State var inputConfirmPassword = ""
    
    // Function for to sign in
    private func addUserToFireStore() {
        Task {
            if await viewModel.addUserToFirestore(inputName: inputName, inputEmail: inputEmail, inputPassword: inputPassword, inputConfirmPassword: inputConfirmPassword) == true {
                signUpViewModel.nextScreen = "OnboardAvailabilityScreenView"
            }
        }
    }
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading, spacing: 0) {
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
                .padding(.top, getRelativeHeight(70))
                .padding(.leading, getRelativeWidth(20))
                .navigationBarHidden(true)
                
                // VSTACK FOR THE SIGN UP HEADING
                VStack(alignment: .leading, spacing: 0) {
                    // SIGN UP HEADINGp
                    Text("Sign Up")
                        .font(FontScheme.kInterExtraBold(size: getRelativeHeight(45)))
                        .fontWeight(.heavy)
                        .foregroundColor(ColorConstants.Black900)
                        .minimumScaleFactor(0.5)
                        .multilineTextAlignment(.leading)
                        .frame(width: getRelativeWidth(137.0), height: getRelativeHeight(45.0),
                               alignment: .topLeading)
                        .padding(.top, getRelativeHeight(30))
                        .padding(.horizontal, getRelativeWidth(20.0))
                    
                    // SIGN UP CAPTION
                    Text("Create a new account!")
                        .font(FontScheme.kInterMedium(size: getRelativeHeight(20.0)))
                        .fontWeight(.medium)
                        .foregroundColor(ColorConstants.Black90099)
                        .minimumScaleFactor(0.5)
                        .multilineTextAlignment(.leading)
                        .frame(width: getRelativeWidth(172.0), height: getRelativeHeight(20.0),
                               alignment: .topLeading)
                        .padding(.top, getRelativeHeight(5))
                        .padding(.horizontal, getRelativeWidth(20.0))
                }
                .frame(width: getRelativeWidth(313.0), height: getRelativeHeight(158.0),
                       alignment: .leading)
                .padding(.leading, getRelativeWidth(20.0))
                
                
                //VStack to center everything else
                VStack (alignment: .center, spacing: 0){
                    
                    // ENTER NAME VSTACK
                    HStack {
                        TextField("Enter Name",
                                  text: $inputName)
                        .font(FontScheme
                            .kInterRegular(size: getRelativeHeight(14.0)))
                        .foregroundColor(ColorConstants.Black900Cc)
                        .padding(.leading, 25)
                        .keyboardType(.default)
                        .focused($focus, equals: .name)
                        .submitLabel(.next)
                        .onSubmit {
                            self.focus = .email
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
                    .padding(.leading, getRelativeWidth(36))
                    
                    
                    // ENTER EMAIL VSTACK
                    HStack {
                        TextField("Enter Email",
                                  text: $inputEmail)
                        .font(FontScheme
                            .kInterRegular(size: getRelativeHeight(14.0)))
                        .foregroundColor(ColorConstants.Black900Cc)
                        .padding(.leading, 25)
                        .keyboardType(.emailAddress)
                        .disableAutocorrection(true)
                        .textInputAutocapitalization(.never)
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
                    .padding(.top, getRelativeWidth(15))
                    .padding(.leading, getRelativeWidth(36))
                    
                    // ENTER PASSWORD VSTACK
                    HStack {
                        SecureField("Enter Password",
                                    text: $inputPassword)
                        .font(FontScheme
                            .kInterRegular(size: getRelativeHeight(14.0)))
                        .foregroundColor(ColorConstants.Black900Cc)
                        .padding(.leading, 25)
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
                    .padding(.top, getRelativeWidth(15))
                    .padding(.leading, getRelativeWidth(36))
                    
                    
                    // CONFIRM PASSWORD VSTACK
                    HStack {
                        SecureField("Confirm Password",
                                    text: $inputConfirmPassword)
                        .font(FontScheme
                            .kInterRegular(size: getRelativeHeight(14.0)))
                        .foregroundColor(ColorConstants.Black900Cc)
                        .padding(.leading, 25)
                        .keyboardType(.default)
                        .focused($focus, equals: .confirmPassword)
                        .submitLabel(.go)
                        .onSubmit {
                            addUserToFireStore()
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
                    .padding(.top, getRelativeWidth(15))
                    .padding(.leading, getRelativeWidth(36))
                    
                    
                    // print warning message if can't sign up
                    if !viewModel.errorMessage.isEmpty {
                        HStack {
                            Text(viewModel.errorMessage)
                                .foregroundColor(Color(UIColor.systemRed))
                                .font(FontScheme.kInterExtraLight(size: getRelativeHeight(12)))
                            
                        }
                        .frame(width: getRelativeWidth(295.0),
                               height: getRelativeHeight(20.0), alignment: .center)
                        .padding(.top, getRelativeWidth(5))
                        .padding(.leading, getRelativeWidth(36))
                        
                    }
                    
                    
                    // SIGN UP BUTTON
                    VStack {
                        Button(action: addUserToFireStore) {
                            Text("SIGN UP")
                                .font(FontScheme
                                    .kInterExtraBold(size: getRelativeHeight(35.0)))
                                .fontWeight(.heavy)
                                .padding(.horizontal, getRelativeWidth(30.0))
                                .padding(.vertical, getRelativeHeight(22.0))
                                .foregroundColor(ColorConstants.WhiteA700)
                                .minimumScaleFactor(0.5)
                                .frame(width: getRelativeWidth(295.0),
                                       height: getRelativeHeight(60.0),
                                       alignment: .center)
                                .background(RoundedCorners(topLeft: 28.5,
                                                           topRight: 28.5,
                                                           bottomLeft: 28.5,
                                                           bottomRight: 28.5)
                                    .fill(ColorConstants.Red400))
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
                    .padding(.top, getRelativeWidth(25))
                    .padding(.leading, getRelativeWidth(36))
                    
                    
                    // SIGN IN MESSAGE
                    HStack{
                        Text("Have an account?")
                            .font(FontScheme.kInterExtraLight(size: getRelativeHeight(25.0)))
                            .fontWeight(.regular)
                            .foregroundColor(ColorConstants.Black900)
                            .minimumScaleFactor(0.5)
                            .multilineTextAlignment(.trailing)
                            .frame(width: getRelativeWidth(130.0), height: getRelativeHeight(18.0),
                                   alignment: .topLeading)
                            .padding(.trailing, getRelativeWidth(-10))
                        
                        // HYPERLINK THAT LEADS TO PAGE
                        Text("Sign in")
                            .font(FontScheme.kInterBold(size: getRelativeHeight(25.0)))
                            .fontWeight(.bold)
                            .foregroundColor(ColorConstants.BlueA400)
                            .minimumScaleFactor(0.5)
                            .multilineTextAlignment(.trailing)
                            .frame(width: getRelativeWidth(50), height: getRelativeHeight(18.0),
                                   alignment: .topLeading)
                            .onTapGesture {
                                signUpViewModel.nextScreen = "SignInView"
                            }
                    }
                    .padding(.top, getRelativeHeight(10))
                    .padding(.leading, getRelativeWidth(36))
                    
                    
                    // GROUP OF NAVIGATION LINK
                    Group {
                        NavigationLink(destination: SignInView().environmentObject(viewModel),
                                       tag: "SignInView",
                                       selection: $signUpViewModel.nextScreen,
                                       label: {
                            EmptyView()
                        })
                        NavigationLink(destination: OnboardAvailabilityScreenView().environmentObject(viewModel),
                                       tag: "OnboardAvailabilityScreenView",
                                       selection: $signUpViewModel.nextScreen,
                                       label: {
                            EmptyView()
                        })
                    }
                }
                
            }
            .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height, alignment: .topLeading)
            .background(ColorConstants.WhiteA700)
            .padding(.top, 0)
        }
        .navigationBarHidden(true)
    }
}


struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView().environmentObject(AuthenticationViewModel())
    }
}

