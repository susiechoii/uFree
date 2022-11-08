import SwiftUI

struct AppnavigationView: View {
    @StateObject var appnavigationViewModel = AppnavigationViewModel()
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    var body: some View {
        NavigationView {
            VStack {
                VStack {
                    VStack {
                        Text(StringConstants.kLblAppNavigation)
                            .font(Font.system(size: getRelativeHeight(20.0)))
                            .fontWeight(.regular)
                            .foregroundColor(ColorConstants.Black900)
                            .minimumScaleFactor(0.5)
                            .multilineTextAlignment(.leading)
                            .frame(width: getRelativeWidth(343.0), height: getRelativeHeight(23.0),
                                   alignment: .leading)
                            .padding(.vertical, getRelativeHeight(10.0))
                            .padding(.horizontal, getRelativeWidth(20.0))
                        Text(StringConstants.kMsgCheckYourApp)
                            .font(Font.system(size: getRelativeHeight(16.0)))
                            .fontWeight(.regular)
                            .foregroundColor(ColorConstants.Bluegray400)
                            .minimumScaleFactor(0.5)
                            .multilineTextAlignment(.leading)
                            .frame(width: getRelativeWidth(343.0), height: getRelativeHeight(19.0),
                                   alignment: .leading)
                            .padding(.leading, getRelativeWidth(20.0))
                        Divider()
                            .frame(width: UIScreen.main.bounds.width,
                                   height: getRelativeHeight(1.0), alignment: .center)
                            .background(ColorConstants.Black900)
                            .padding(.top, getRelativeHeight(5.0))
                    }
                    .frame(width: UIScreen.main.bounds.width, height: getRelativeHeight(67.0))
                    .background(ColorConstants.WhiteA700)
                    ScrollView(.vertical, showsIndicators: false) {
                        VStack {
                            Group {
                                VStack {
                                    Text(StringConstants.kLblIntroPage)
                                        .font(Font.system(size: getRelativeHeight(20.0)))
                                        .fontWeight(.regular)
                                        .foregroundColor(ColorConstants.Black900)
                                        .minimumScaleFactor(0.5)
                                        .multilineTextAlignment(.leading)
                                        .frame(width: getRelativeWidth(343.0),
                                               height: getRelativeHeight(23.0), alignment: .leading)
                                        .padding(.vertical, getRelativeHeight(10.0))
                                        .padding(.horizontal, getRelativeWidth(20.0))
                                    Divider()
                                        .frame(width: UIScreen.main.bounds.width,
                                               height: getRelativeHeight(1.0), alignment: .center)
                                        .background(ColorConstants.Bluegray400)
                                        .padding(.top, getRelativeHeight(5.0))
                                }
                                .onTapGesture {
                                    appnavigationViewModel.nextScreen = "IntroPageView"
                                }
                                .frame(width: UIScreen.main.bounds.width,
                                       height: getRelativeHeight(48.0))
                                .background(ColorConstants.WhiteA700)
                                VStack {
                                    Text(StringConstants.kLblSignUp)
                                        .font(Font.system(size: getRelativeHeight(20.0)))
                                        .fontWeight(.regular)
                                        .foregroundColor(ColorConstants.Black900)
                                        .minimumScaleFactor(0.5)
                                        .multilineTextAlignment(.leading)
                                        .frame(width: getRelativeWidth(343.0),
                                               height: getRelativeHeight(23.0), alignment: .leading)
                                        .padding(.vertical, getRelativeHeight(10.0))
                                        .padding(.horizontal, getRelativeWidth(20.0))
                                    Divider()
                                        .frame(width: UIScreen.main.bounds.width,
                                               height: getRelativeHeight(1.0), alignment: .center)
                                        .background(ColorConstants.Bluegray400)
                                        .padding(.top, getRelativeHeight(5.0))
                                }
                                .onTapGesture {
                                    appnavigationViewModel.nextScreen = "SignUpView"
                                }
                                .frame(width: UIScreen.main.bounds.width,
                                       height: getRelativeHeight(48.0))
                                .background(ColorConstants.WhiteA700)
                                VStack {
                                    Text(StringConstants.kLblSignIn2)
                                        .font(Font.system(size: getRelativeHeight(20.0)))
                                        .fontWeight(.regular)
                                        .foregroundColor(ColorConstants.Black900)
                                        .minimumScaleFactor(0.5)
                                        .multilineTextAlignment(.leading)
                                        .frame(width: getRelativeWidth(343.0),
                                               height: getRelativeHeight(23.0), alignment: .leading)
                                        .padding(.vertical, getRelativeHeight(10.0))
                                        .padding(.horizontal, getRelativeWidth(20.0))
                                    Divider()
                                        .frame(width: UIScreen.main.bounds.width,
                                               height: getRelativeHeight(1.0), alignment: .center)
                                        .background(ColorConstants.Bluegray400)
                                        .padding(.top, getRelativeHeight(5.0))
                                }
                                .onTapGesture {
                                    appnavigationViewModel.nextScreen = "SignInView"
                                }
                                .frame(width: UIScreen.main.bounds.width,
                                       height: getRelativeHeight(48.0))
                                .background(ColorConstants.WhiteA700)
                                VStack {
                                    Text(StringConstants.kLblHomePage)
                                        .font(Font.system(size: getRelativeHeight(20.0)))
                                        .fontWeight(.regular)
                                        .foregroundColor(ColorConstants.Black900)
                                        .minimumScaleFactor(0.5)
                                        .multilineTextAlignment(.leading)
                                        .frame(width: getRelativeWidth(343.0),
                                               height: getRelativeHeight(23.0), alignment: .leading)
                                        .padding(.vertical, getRelativeHeight(10.0))
                                        .padding(.horizontal, getRelativeWidth(20.0))
                                    Divider()
                                        .frame(width: UIScreen.main.bounds.width,
                                               height: getRelativeHeight(1.0), alignment: .center)
                                        .background(ColorConstants.Bluegray400)
                                        .padding(.top, getRelativeHeight(5.0))
                                }
                                .onTapGesture {
                                    appnavigationViewModel.nextScreen = "HomePageView"
                                }
                                .frame(width: UIScreen.main.bounds.width,
                                       height: getRelativeHeight(48.0))
                                .background(ColorConstants.WhiteA700)
                                VStack {
                                    Text(StringConstants.kLblWeeklyView)
                                        .font(Font.system(size: getRelativeHeight(20.0)))
                                        .fontWeight(.regular)
                                        .foregroundColor(ColorConstants.Black900)
                                        .minimumScaleFactor(0.5)
                                        .multilineTextAlignment(.leading)
                                        .frame(width: getRelativeWidth(343.0),
                                               height: getRelativeHeight(23.0), alignment: .leading)
                                        .padding(.vertical, getRelativeHeight(10.0))
                                        .padding(.horizontal, getRelativeWidth(20.0))
                                    Divider()
                                        .frame(width: UIScreen.main.bounds.width,
                                               height: getRelativeHeight(1.0), alignment: .center)
                                        .background(ColorConstants.Bluegray400)
                                        .padding(.top, getRelativeHeight(5.0))
                                }
                                .onTapGesture {
                                    appnavigationViewModel.nextScreen = "WeeklyView1View"
                                }
                                .frame(width: UIScreen.main.bounds.width,
                                       height: getRelativeHeight(48.0))
                                .background(ColorConstants.WhiteA700)
                                VStack {
                                    Text(StringConstants.kLblEventCreation)
                                        .font(Font.system(size: getRelativeHeight(20.0)))
                                        .fontWeight(.regular)
                                        .foregroundColor(ColorConstants.Black900)
                                        .minimumScaleFactor(0.5)
                                        .multilineTextAlignment(.leading)
                                        .frame(width: getRelativeWidth(343.0),
                                               height: getRelativeHeight(23.0), alignment: .leading)
                                        .padding(.vertical, getRelativeHeight(10.0))
                                        .padding(.horizontal, getRelativeWidth(20.0))
                                    Divider()
                                        .frame(width: UIScreen.main.bounds.width,
                                               height: getRelativeHeight(1.0), alignment: .center)
                                        .background(ColorConstants.Bluegray400)
                                        .padding(.top, getRelativeHeight(5.0))
                                }
                                .onTapGesture {
                                    appnavigationViewModel.nextScreen = "EventCreationView"
                                }
                                .frame(width: UIScreen.main.bounds.width,
                                       height: getRelativeHeight(48.0))
                                .background(ColorConstants.WhiteA700)
                                VStack {
                                    Text(StringConstants.kLblFriendsPage)
                                        .font(Font.system(size: getRelativeHeight(20.0)))
                                        .fontWeight(.regular)
                                        .foregroundColor(ColorConstants.Black900)
                                        .minimumScaleFactor(0.5)
                                        .multilineTextAlignment(.leading)
                                        .frame(width: getRelativeWidth(343.0),
                                               height: getRelativeHeight(23.0), alignment: .leading)
                                        .padding(.vertical, getRelativeHeight(10.0))
                                        .padding(.horizontal, getRelativeWidth(20.0))
                                    Divider()
                                        .frame(width: UIScreen.main.bounds.width,
                                               height: getRelativeHeight(1.0), alignment: .center)
                                        .background(ColorConstants.Bluegray400)
                                        .padding(.top, getRelativeHeight(5.0))
                                }
                                .onTapGesture {
                                    appnavigationViewModel.nextScreen = "FriendsPageView"
                                }
                                .frame(width: UIScreen.main.bounds.width,
                                       height: getRelativeHeight(48.0))
                                .background(ColorConstants.WhiteA700)
                                VStack {
                                    Text(StringConstants.kLblProfileView)
                                        .font(Font.system(size: getRelativeHeight(20.0)))
                                        .fontWeight(.regular)
                                        .foregroundColor(ColorConstants.Black900)
                                        .minimumScaleFactor(0.5)
                                        .multilineTextAlignment(.leading)
                                        .frame(width: getRelativeWidth(343.0),
                                               height: getRelativeHeight(23.0), alignment: .leading)
                                        .padding(.vertical, getRelativeHeight(10.0))
                                        .padding(.horizontal, getRelativeWidth(20.0))
                                    Divider()
                                        .frame(width: UIScreen.main.bounds.width,
                                               height: getRelativeHeight(1.0), alignment: .center)
                                        .background(ColorConstants.Bluegray400)
                                        .padding(.top, getRelativeHeight(5.0))
                                }
                                .onTapGesture {
                                    appnavigationViewModel.nextScreen = "ProfileView"
                                }
                                .frame(width: UIScreen.main.bounds.width,
                                       height: getRelativeHeight(48.0))
                                .background(ColorConstants.WhiteA700)
                            }
                            Group {
                                VStack {
                                    Text(StringConstants.kLblResetCode)
                                        .font(Font.system(size: getRelativeHeight(20.0)))
                                        .fontWeight(.regular)
                                        .foregroundColor(ColorConstants.Black900)
                                        .minimumScaleFactor(0.5)
                                        .multilineTextAlignment(.leading)
                                        .frame(width: getRelativeWidth(343.0),
                                               height: getRelativeHeight(23.0), alignment: .leading)
                                        .padding(.vertical, getRelativeHeight(10.0))
                                        .padding(.horizontal, getRelativeWidth(20.0))
                                    Divider()
                                        .frame(width: UIScreen.main.bounds.width,
                                               height: getRelativeHeight(1.0), alignment: .center)
                                        .background(ColorConstants.Bluegray400)
                                        .padding(.top, getRelativeHeight(5.0))
                                }
                                .onTapGesture {
                                    appnavigationViewModel.nextScreen = "ResetCodeView"
                                }
                                .frame(width: UIScreen.main.bounds.width,
                                       height: getRelativeHeight(48.0))
                                .background(ColorConstants.WhiteA700)
                                VStack {
                                    Text(StringConstants.kLblResetPassword)
                                        .font(Font.system(size: getRelativeHeight(20.0)))
                                        .fontWeight(.regular)
                                        .foregroundColor(ColorConstants.Black900)
                                        .minimumScaleFactor(0.5)
                                        .multilineTextAlignment(.leading)
                                        .frame(width: getRelativeWidth(343.0),
                                               height: getRelativeHeight(23.0), alignment: .leading)
                                        .padding(.vertical, getRelativeHeight(10.0))
                                        .padding(.horizontal, getRelativeWidth(20.0))
                                    Divider()
                                        .frame(width: UIScreen.main.bounds.width,
                                               height: getRelativeHeight(1.0), alignment: .center)
                                        .background(ColorConstants.Bluegray400)
                                        .padding(.top, getRelativeHeight(5.0))
                                }
                                .onTapGesture {
                                    appnavigationViewModel.nextScreen = "ResetPasswordView"
                                }
                                .frame(width: UIScreen.main.bounds.width,
                                       height: getRelativeHeight(48.0))
                                .background(ColorConstants.WhiteA700)
                                VStack {
                                    Text(StringConstants.kLblHomeViewTwo)
                                        .font(Font.system(size: getRelativeHeight(20.0)))
                                        .fontWeight(.regular)
                                        .foregroundColor(ColorConstants.Black900)
                                        .minimumScaleFactor(0.5)
                                        .multilineTextAlignment(.leading)
                                        .frame(width: getRelativeWidth(343.0),
                                               height: getRelativeHeight(23.0), alignment: .leading)
                                        .padding(.vertical, getRelativeHeight(10.0))
                                        .padding(.horizontal, getRelativeWidth(20.0))
                                    Divider()
                                        .frame(width: UIScreen.main.bounds.width,
                                               height: getRelativeHeight(1.0), alignment: .center)
                                        .background(ColorConstants.Bluegray400)
                                        .padding(.top, getRelativeHeight(5.0))
                                }
                                .onTapGesture {
                                    appnavigationViewModel.nextScreen = "HomeViewTwoView"
                                }
                                .frame(width: UIScreen.main.bounds.width,
                                       height: getRelativeHeight(48.0))
                                .background(ColorConstants.WhiteA700)
                                VStack {
                                    Text(StringConstants.kLblEventView)
                                        .font(Font.system(size: getRelativeHeight(20.0)))
                                        .fontWeight(.regular)
                                        .foregroundColor(ColorConstants.Black900)
                                        .minimumScaleFactor(0.5)
                                        .multilineTextAlignment(.leading)
                                        .frame(width: getRelativeWidth(343.0),
                                               height: getRelativeHeight(23.0), alignment: .leading)
                                        .padding(.vertical, getRelativeHeight(10.0))
                                        .padding(.horizontal, getRelativeWidth(20.0))
                                    Divider()
                                        .frame(width: UIScreen.main.bounds.width,
                                               height: getRelativeHeight(1.0), alignment: .center)
                                        .background(ColorConstants.Bluegray400)
                                        .padding(.top, getRelativeHeight(5.0))
                                }
                                .onTapGesture {
                                    appnavigationViewModel.nextScreen = "EventView"
                                }
                                .frame(width: UIScreen.main.bounds.width,
                                       height: getRelativeHeight(48.0))
                                .background(ColorConstants.WhiteA700)
                                VStack {
                                    Text(StringConstants.kMsgEditDefaultFo)
                                        .font(Font.system(size: getRelativeHeight(20.0)))
                                        .fontWeight(.regular)
                                        .foregroundColor(ColorConstants.Black900)
                                        .minimumScaleFactor(0.5)
                                        .multilineTextAlignment(.leading)
                                        .frame(width: getRelativeWidth(343.0),
                                               height: getRelativeHeight(23.0), alignment: .leading)
                                        .padding(.vertical, getRelativeHeight(10.0))
                                        .padding(.horizontal, getRelativeWidth(20.0))
                                    Divider()
                                        .frame(width: UIScreen.main.bounds.width,
                                               height: getRelativeHeight(1.0), alignment: .center)
                                        .background(ColorConstants.Bluegray400)
                                        .padding(.top, getRelativeHeight(5.0))
                                }
                                .onTapGesture {
                                    appnavigationViewModel
                                        .nextScreen = "EditDefaultforEventScreenView"
                                }
                                .frame(width: UIScreen.main.bounds.width,
                                       height: getRelativeHeight(48.0))
                                .background(ColorConstants.WhiteA700)
                                VStack {
                                    Text(StringConstants.kMsgOnboardAvailab)
                                        .font(Font.system(size: getRelativeHeight(20.0)))
                                        .fontWeight(.regular)
                                        .foregroundColor(ColorConstants.Black900)
                                        .minimumScaleFactor(0.5)
                                        .multilineTextAlignment(.leading)
                                        .frame(width: getRelativeWidth(343.0),
                                               height: getRelativeHeight(23.0), alignment: .leading)
                                        .padding(.vertical, getRelativeHeight(10.0))
                                        .padding(.horizontal, getRelativeWidth(20.0))
                                    Divider()
                                        .frame(width: UIScreen.main.bounds.width,
                                               height: getRelativeHeight(1.0), alignment: .center)
                                        .background(ColorConstants.Bluegray400)
                                        .padding(.top, getRelativeHeight(5.0))
                                }
                                .onTapGesture {
                                    appnavigationViewModel
                                        .nextScreen = "OnboardAvailabilityScreenView"
                                }
                                .frame(width: UIScreen.main.bounds.width,
                                       height: getRelativeHeight(48.0))
                                .background(ColorConstants.WhiteA700)
                                VStack {
                                    Text(StringConstants.kLblHomeViewThree)
                                        .font(Font.system(size: getRelativeHeight(20.0)))
                                        .fontWeight(.regular)
                                        .foregroundColor(ColorConstants.Black900)
                                        .minimumScaleFactor(0.5)
                                        .multilineTextAlignment(.leading)
                                        .frame(width: getRelativeWidth(343.0),
                                               height: getRelativeHeight(23.0), alignment: .leading)
                                        .padding(.vertical, getRelativeHeight(10.0))
                                        .padding(.horizontal, getRelativeWidth(20.0))
                                    Divider()
                                        .frame(width: UIScreen.main.bounds.width,
                                               height: getRelativeHeight(1.0), alignment: .center)
                                        .background(ColorConstants.Bluegray400)
                                        .padding(.top, getRelativeHeight(5.0))
                                }
                                .onTapGesture {
                                    appnavigationViewModel.nextScreen = "HomeViewThreeView"
                                }
                                .frame(width: UIScreen.main.bounds.width,
                                       height: getRelativeHeight(48.0))
                                .background(ColorConstants.WhiteA700)
                                VStack {
                                    Text(StringConstants.kLblEventEdit)
                                        .font(Font.system(size: getRelativeHeight(20.0)))
                                        .fontWeight(.regular)
                                        .foregroundColor(ColorConstants.Black900)
                                        .minimumScaleFactor(0.5)
                                        .multilineTextAlignment(.leading)
                                        .frame(width: getRelativeWidth(343.0),
                                               height: getRelativeHeight(23.0), alignment: .leading)
                                        .padding(.vertical, getRelativeHeight(10.0))
                                        .padding(.horizontal, getRelativeWidth(20.0))
                                    Divider()
                                        .frame(width: UIScreen.main.bounds.width,
                                               height: getRelativeHeight(1.0), alignment: .center)
                                        .background(ColorConstants.Bluegray400)
                                        .padding(.top, getRelativeHeight(5.0))
                                }
                                .onTapGesture {
                                    appnavigationViewModel.nextScreen = "EventEditView"
                                }
                                .frame(width: UIScreen.main.bounds.width,
                                       height: getRelativeHeight(48.0))
                                .background(ColorConstants.WhiteA700)
                            }
                            Group {
                                VStack {
                                    Text(StringConstants.kLblOptimalTime)
                                        .font(Font.system(size: getRelativeHeight(20.0)))
                                        .fontWeight(.regular)
                                        .foregroundColor(ColorConstants.Black900)
                                        .minimumScaleFactor(0.5)
                                        .multilineTextAlignment(.leading)
                                        .frame(width: getRelativeWidth(343.0),
                                               height: getRelativeHeight(23.0), alignment: .leading)
                                        .padding(.vertical, getRelativeHeight(10.0))
                                        .padding(.horizontal, getRelativeWidth(20.0))
                                    Divider()
                                        .frame(width: UIScreen.main.bounds.width,
                                               height: getRelativeHeight(1.0), alignment: .center)
                                        .background(ColorConstants.Bluegray400)
                                        .padding(.top, getRelativeHeight(5.0))
                                }
                                .onTapGesture {
                                    appnavigationViewModel.nextScreen = "OptimalTimeView"
                                }
                                .frame(width: UIScreen.main.bounds.width,
                                       height: getRelativeHeight(48.0))
                                .background(ColorConstants.WhiteA700)
                                VStack {
                                    Text(StringConstants.kLblHomeViewFour)
                                        .font(Font.system(size: getRelativeHeight(20.0)))
                                        .fontWeight(.regular)
                                        .foregroundColor(ColorConstants.Black900)
                                        .minimumScaleFactor(0.5)
                                        .multilineTextAlignment(.leading)
                                        .frame(width: getRelativeWidth(343.0),
                                               height: getRelativeHeight(23.0), alignment: .leading)
                                        .padding(.vertical, getRelativeHeight(10.0))
                                        .padding(.horizontal, getRelativeWidth(20.0))
                                    Divider()
                                        .frame(width: UIScreen.main.bounds.width,
                                               height: getRelativeHeight(1.0), alignment: .center)
                                        .background(ColorConstants.Bluegray400)
                                        .padding(.top, getRelativeHeight(5.0))
                                }
                                .onTapGesture {
                                    appnavigationViewModel.nextScreen = "HomeViewFourView"
                                }
                                .frame(width: UIScreen.main.bounds.width,
                                       height: getRelativeHeight(48.0))
                                .background(ColorConstants.WhiteA700)
                                VStack {
                                    Text(StringConstants.kLblHomeViewFive)
                                        .font(Font.system(size: getRelativeHeight(20.0)))
                                        .fontWeight(.regular)
                                        .foregroundColor(ColorConstants.Black900)
                                        .minimumScaleFactor(0.5)
                                        .multilineTextAlignment(.leading)
                                        .frame(width: getRelativeWidth(343.0),
                                               height: getRelativeHeight(23.0), alignment: .leading)
                                        .padding(.vertical, getRelativeHeight(10.0))
                                        .padding(.horizontal, getRelativeWidth(20.0))
                                    Divider()
                                        .frame(width: UIScreen.main.bounds.width,
                                               height: getRelativeHeight(1.0), alignment: .center)
                                        .background(ColorConstants.Bluegray400)
                                        .padding(.top, getRelativeHeight(5.0))
                                }
                                .onTapGesture {
                                    appnavigationViewModel.nextScreen = "HomeViewFiveView"
                                }
                                .frame(width: UIScreen.main.bounds.width,
                                       height: getRelativeHeight(48.0))
                                .background(ColorConstants.WhiteA700)
                            }
                        }
                        .frame(width: UIScreen.main.bounds.width, alignment: .topLeading)
                        .background(ColorConstants.WhiteA700)
                    }
                }
                .frame(width: UIScreen.main.bounds.width, alignment: .topLeading)
                .background(ColorConstants.WhiteA700)
                .padding(.top, getRelativeHeight(30.0))
                .padding(.bottom, getRelativeHeight(10.0))
                Group {
                    NavigationLink(destination: IntroPageView(),
                                   tag: "IntroPageView",
                                   selection: $appnavigationViewModel.nextScreen,
                                   label: {
                                       EmptyView()
                                   })
                    NavigationLink(destination: SignUpView(),
                                   tag: "SignUpView",
                                   selection: $appnavigationViewModel.nextScreen,
                                   label: {
                                       EmptyView()
                                   })
                    NavigationLink(destination: SignInView(),
                                   tag: "SignInView",
                                   selection: $appnavigationViewModel.nextScreen,
                                   label: {
                                       EmptyView()
                                   })
                    NavigationLink(destination: HomePageView(),
                                   tag: "HomePageView",
                                   selection: $appnavigationViewModel.nextScreen,
                                   label: {
                                       EmptyView()
                                   })
                    NavigationLink(destination: WeeklyView1View(),
                                   tag: "WeeklyView1View",
                                   selection: $appnavigationViewModel.nextScreen,
                                   label: {
                                       EmptyView()
                                   })
                    NavigationLink(destination: EventCreationView(),
                                   tag: "EventCreationView",
                                   selection: $appnavigationViewModel.nextScreen,
                                   label: {
                                       EmptyView()
                                   })
                    NavigationLink(destination: FriendsPageView(),
                                   tag: "FriendsPageView",
                                   selection: $appnavigationViewModel.nextScreen,
                                   label: {
                                       EmptyView()
                                   })
                    NavigationLink(destination: ProfileView(),
                                   tag: "ProfileView",
                                   selection: $appnavigationViewModel.nextScreen,
                                   label: {
                                       EmptyView()
                                   })
                    NavigationLink(destination: ResetCodeView(),
                                   tag: "ResetCodeView",
                                   selection: $appnavigationViewModel.nextScreen,
                                   label: {
                                       EmptyView()
                                   })
                    NavigationLink(destination: ResetPasswordView(),
                                   tag: "ResetPasswordView",
                                   selection: $appnavigationViewModel.nextScreen,
                                   label: {
                                       EmptyView()
                                   })
                }
                Group {
                    NavigationLink(destination: HomeViewTwoView(),
                                   tag: "HomeViewTwoView",
                                   selection: $appnavigationViewModel.nextScreen,
                                   label: {
                                       EmptyView()
                                   })
                    NavigationLink(destination: EventView(),
                                   tag: "EventView",
                                   selection: $appnavigationViewModel.nextScreen,
                                   label: {
                                       EmptyView()
                                   })
                    NavigationLink(destination: EditDefaultforEventScreenView(),
                                   tag: "EditDefaultforEventScreenView",
                                   selection: $appnavigationViewModel.nextScreen,
                                   label: {
                                       EmptyView()
                                   })
                    NavigationLink(destination: OnboardAvailabilityScreenView(),
                                   tag: "OnboardAvailabilityScreenView",
                                   selection: $appnavigationViewModel.nextScreen,
                                   label: {
                                       EmptyView()
                                   })
                    NavigationLink(destination: HomeViewThreeView(),
                                   tag: "HomeViewThreeView",
                                   selection: $appnavigationViewModel.nextScreen,
                                   label: {
                                       EmptyView()
                                   })
                    NavigationLink(destination: EventEditView(),
                                   tag: "EventEditView",
                                   selection: $appnavigationViewModel.nextScreen,
                                   label: {
                                       EmptyView()
                                   })
                    NavigationLink(destination: OptimalTimeView(),
                                   tag: "OptimalTimeView",
                                   selection: $appnavigationViewModel.nextScreen,
                                   label: {
                                       EmptyView()
                                   })
                    NavigationLink(destination: HomeViewFourView(),
                                   tag: "HomeViewFourView",
                                   selection: $appnavigationViewModel.nextScreen,
                                   label: {
                                       EmptyView()
                                   })
                    NavigationLink(destination: HomeViewFiveView(),
                                   tag: "HomeViewFiveView",
                                   selection: $appnavigationViewModel.nextScreen,
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

struct AppnavigationView_Previews: PreviewProvider {
    static var previews: some View {
        AppnavigationView()
    }
}
