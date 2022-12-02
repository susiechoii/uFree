import SwiftUI

struct ProfileView: View {
    @StateObject var profileViewModel = ProfileViewModel()
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @EnvironmentObject var viewModel: AuthenticationViewModel
    @State var userCurrentName = StringConstants.kLblToddSproull
    @State var editingProfile = false
    
    @State var changePic = false
    
    var body: some View {
        NavigationView {
            VStack {
                VStack {
                    VStack {
                        VStack(alignment: .leading, spacing: 0) {
                            Group {
                                ZStack(alignment: .bottomTrailing) {
                                    ZStack(alignment: .center) {
                                        Image("img_nomadsavatar")
                                            .resizable()
                                            .frame(width: getRelativeWidth(162.0),
                                                   height: getRelativeHeight(151.0),
                                                   alignment: .center)
                                            .scaledToFit()
                                            .clipped()
                                            .padding(.vertical, getRelativeHeight(8.0))
                                            .padding(.horizontal, getRelativeWidth(7.0))
                                        
                                        
                                        if (changePic == true) {
                                        Image("img_toddtest31")
                                            .resizable()
                                            .frame(width: getRelativeWidth(144.0),
                                                   height: getRelativeHeight(148.0),
                                                   alignment: .center)
                                            .scaledToFit()
                                            .clipped()
                                            .background(RoundedCorners(topLeft: 72.0,
                                                                       topRight: 72.0,
                                                                       bottomLeft: 72.0,
                                                                       bottomRight: 72.0))
                                            .padding(.top, getRelativeHeight(11.0))
                                            .padding(.bottom, getRelativeHeight(8.0))
                                            .padding(.horizontal, getRelativeWidth(16.0))
                                        
                                        }
                                        
                                        
                                    }
                                    .hideNavigationBar()
                                    .frame(width: getRelativeWidth(176.0),
                                           height: getRelativeHeight(167.0), alignment: .leading)
                                    .overlay(RoundedCorners(topLeft: 75.0, topRight: 75.0,
                                                            bottomLeft: 75.0, bottomRight: 75.0)
                                            .stroke(LinearGradient(gradient: Gradient(colors: [ColorConstants
                                                            .PurpleA201,
                                                        ColorConstants
                                                            .IndigoA201]),
                                                    startPoint: .topLeading,
                                                    endPoint: .bottomTrailing),
                                                    lineWidth: 5))
                                    .background(RoundedCorners(topLeft: 75.0, topRight: 75.0,
                                                               bottomLeft: 75.0, bottomRight: 75.0)
                                            .fill(Color.clear.opacity(0.7)))
                                    .padding(.trailing, getRelativeWidth(8.0))
                                    ZStack {
                                        Button {
                                            print("button was tapped")
                                     changePic
                                                .toggle()
                                    
                                        } label: {
                                            Image("img_vector_23X24")
                                                .resizable()
                                                .frame(width: getRelativeWidth(24.0),
                                                       height: getRelativeHeight(23.0),
                                                       alignment: .center)
                                                .scaledToFit()
                                                .clipped()
                                                .padding(.top, getRelativeHeight(11.87))
                                                .padding(.bottom, getRelativeHeight(11.13))
                                                .padding(.horizontal, getRelativeWidth(12.12))
                                        }
                                    }
                                    .hideNavigationBar()
                                    .frame(width: getRelativeWidth(49.0),
                                           height: getRelativeHeight(46.0),
                                           alignment: .bottomTrailing)
                                    .background(RoundedCorners(topLeft: 23.0, topRight: 23.0,
                                                               bottomLeft: 23.0, bottomRight: 23.0)
                                            .fill(ColorConstants.WhiteA700))
                                    .shadow(color: ColorConstants.Black90028, radius: 8, x: 0, y: 4)
                                    .padding(.top, getRelativeHeight(113.0))
                                    .padding(.leading, getRelativeWidth(135.0))
                                }
                                .hideNavigationBar()
                                .frame(width: getRelativeWidth(184.0),
                                       height: getRelativeHeight(167.0), alignment: .center)
                                .padding(.horizontal, getRelativeWidth(67.0))
                               
                                if (!editingProfile) {
                                
                                Text(userCurrentName)
                                    .font(FontScheme.kInterMedium(size: getRelativeHeight(32.0)))
                                    .fontWeight(.medium)
                                    .foregroundColor(ColorConstants.Bluegray901)
                                    .minimumScaleFactor(0.5)
                                    .multilineTextAlignment(.leading)
                                    .frame(width: getRelativeWidth(193.0),
                                           height: getRelativeHeight(32.0), alignment: .center)
                                    .padding(.top, getRelativeHeight(28.0))
                                    .padding(.horizontal, getRelativeWidth(67.0))
                                
                            }
                                if (editingProfile == true) {
                                    
                                    VStack {
                                    
                                        Spacer()
                                            .frame(height: 20)
                                        
                                    HStack {
                                    
                                    Spacer()
                                        .frame(width: 100)
                                        
                                TextField("Change name, click  edit profile when done", text: $userCurrentName)
                                        .foregroundColor(ColorConstants.Gray500)
                                        .frame(alignment: .center)
                                    
                                    }
                                    
                                }
                                    
                                        
                                    
                                }
                                
                                Button {
                                    print("User is trying to edit profile")
                                    editingProfile
                                        .toggle()
                                } label: {
                                    Spacer()
                                    Image("img_icon_14X14")
                                    Text("Edit Profile")
                                        .font(FontScheme
                                            .kInterMedium(size: getRelativeHeight(16.0)))
                                        .fontWeight(.medium)
                                        .foregroundColor(ColorConstants.Purple400)
                                        .minimumScaleFactor(0.5)
                                        .multilineTextAlignment(.leading)
                                        .frame(width: getRelativeWidth(83.0),
                                               height: getRelativeHeight(16.0),
                                               alignment: .topLeading)
                                        .padding(.vertical, getRelativeHeight(11.0))
                                        .padding(.leading, getRelativeWidth(10.0))
                                        .padding(.trailing, getRelativeWidth(108.0))
                                }
                                .frame(width: getRelativeWidth(328.0),
                                       height: getRelativeHeight(38.0), alignment: .leading)
                                .overlay(RoundedCorners(topLeft: 19.0, topRight: 19.0,
                                                        bottomLeft: 19.0, bottomRight: 19.0)
                                        .stroke(ColorConstants.Purple400,
                                                lineWidth: 1))
                                .background(RoundedCorners(topLeft: 19.0, topRight: 19.0,
                                                           bottomLeft: 19.0, bottomRight: 19.0)
                                        .fill(ColorConstants.WhiteA700))
                                .padding(.top, getRelativeHeight(21.0))
                                
                                
                                VStack {
                                
                                HStack {
                                    HStack {
                                        Button {
                                            print("User changed password")
                                
                                            viewModel.signOut()
                                            profileViewModel.nextScreen = "ResetPasswordView"
                                        } label: {
                                            Image("img_icon_18X16")
                                            Text("\tChange Password")
                                                .font(FontScheme
                                                    .kInterMedium(size: getRelativeHeight(16.0)))
                                                .fontWeight(.medium)
                                                .foregroundColor(ColorConstants.Gray903)
                                        }
                                        
                                    }
                                    Spacer()
                                    Image("img_arrowright")
                                        .resizable()
                                        .frame(width: getRelativeWidth(4.0),
                                               height: getRelativeHeight(9.0), alignment: .center)
                                        .scaledToFit()
                                        .clipped()
                                        .padding(.vertical, getRelativeHeight(25.0))
                                        .padding(.trailing, getRelativeWidth(13.0))
                                }
                                
                                    
                                HStack {
                                    HStack {
                                        Button {
                                            print("User signed out")
                                            viewModel.signOut()
                                        } label: {
                                            Image("img_icon_1")
                                            Text("\tNotifications")
                                                .font(FontScheme
                                                    .kInterMedium(size: getRelativeHeight(16.0)))
                                                .fontWeight(.medium)
                                                .foregroundColor(ColorConstants.Gray903)
                                        }
                                        
                                        
                                    }
                                    Spacer()
                                                                        Text(StringConstants.kLblAllActive)
                                                                            .font(FontScheme
                                                                                .kInterRegular(size: getRelativeHeight(12.0)))
                                                                            .fontWeight(.regular)
                                                                            .foregroundColor(ColorConstants.Gray600)
                                                                            .minimumScaleFactor(0.5)
                                                                            .multilineTextAlignment(.leading)
                                                                            .frame(width: getRelativeWidth(52.0),
                                                                                   height: getRelativeHeight(15.0),
                                                                                   alignment: .topLeading)
                                                                            .padding(.top, getRelativeHeight(22.0))
                                                                            .padding(.bottom, getRelativeHeight(19.0))
                                                                            .padding(.trailing, getRelativeWidth(8.0))
                                }
                               
                               
                               
                            }
                            
                                
                            
                            Group {
                                HStack {
                                    VStack {
                                        Spacer()
                                            .frame(height: 30)
                                    Button {
                                        print("User signed out")
                                        viewModel.signOut()
                                    } label: {
                                        Image("img_icon_16X18")
                                        Text("\tLog Out")
                                            .font(FontScheme
                                                .kInterMedium(size: getRelativeHeight(16.0)))
                                            .fontWeight(.medium)
                                            .foregroundColor(ColorConstants.Purple400)
                                    }
                                }
                                }
                                }
                                
                                
                                
                                
                            }
                        }
                        .frame(width: getRelativeWidth(328.0), height: getRelativeHeight(666.0),
                               alignment: .center)
                        .background(ColorConstants.WhiteA700)
                        .padding(.horizontal, getRelativeWidth(24.0))
                    }
                    .frame(width: UIScreen.main.bounds.width, height: getRelativeHeight(666.0),
                           alignment: .leading)
                        
            
                    VStack(alignment: .leading, spacing: 0) {
                        Text("TabBars")
                            .minimumScaleFactor(0.5)
                            .multilineTextAlignment(.leading)
                            .frame(width: UIScreen.main.bounds.width,
                                   height: getRelativeHeight(96.0), alignment: .leading)
                    }
                    .frame(width: UIScreen.main.bounds.width, height: getRelativeHeight(96.0),
                           alignment: .leading)
                }
                .frame(width: UIScreen.main.bounds.width, alignment: .topLeading)
                .background(ColorConstants.WhiteA700)
                .padding(.top, getRelativeHeight(56.0))
                .padding(.top, getRelativeHeight(30.0))
                .padding(.bottom, getRelativeHeight(10.0))
                Group {
                    NavigationLink(destination: EventCreationView(),
                                   tag: "EventCreationView",
                                   selection: $profileViewModel.nextScreen,
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

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView().environmentObject(AuthenticationViewModel())
    }
}
