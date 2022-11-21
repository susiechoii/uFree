import SwiftUI

struct WeeklyView1View: View {
    @StateObject var weeklyView1ViewModel = WeeklyView1ViewModel()
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    var body: some View {
        VStack {
            VStack {
                VStack {
                    HStack {
                        HStack {
                            Text(StringConstants.kMsgGoodAfternoon)
                                .font(FontScheme.kInterSemiBold(size: getRelativeHeight(24.0)))
                                .fontWeight(.semibold)
                                .foregroundColor(ColorConstants.Bluegray900)
                                .minimumScaleFactor(0.5)
                                .multilineTextAlignment(.leading)
                                .frame(width: getRelativeWidth(195.0),
                                       height: getRelativeHeight(48.0), alignment: .topLeading)
                            Spacer()
                            ZStack {
                                Image("img_nomadsavatar")
                                    .resizable()
                                    .frame(width: getRelativeWidth(48.0),
                                           height: getRelativeHeight(46.0), alignment: .center)
                                    .scaledToFit()
                                    .clipped()
                                    .padding(.horizontal, getRelativeWidth(1.0))
                            }
                            .hideNavigationBar()
                            .frame(width: getRelativeWidth(50.0), height: getRelativeWidth(50.0),
                                   alignment: .center)
                            .overlay(RoundedCorners(topLeft: 20.0, topRight: 20.0, bottomLeft: 20.0,
                                                    bottomRight: 20.0)
                                    .stroke(LinearGradient(gradient: Gradient(colors: [ColorConstants
                                                    .PurpleA200,
                                                ColorConstants
                                                    .BlueA400]),
                                            startPoint: .topLeading,
                                            endPoint: .bottomTrailing),
                                            lineWidth: 1))
                            .background(RoundedCorners(topLeft: 20.0, topRight: 20.0,
                                                       bottomLeft: 20.0, bottomRight: 20.0)
                                    .fill(Color.clear.opacity(0.7)))
                        }
                        .frame(width: getRelativeWidth(327.0), height: getRelativeHeight(50.0),
                               alignment: .leading)
                    }
                    .frame(width: getRelativeWidth(327.0), height: getRelativeHeight(50.0),
                           alignment: .leading)
                    .padding(.horizontal, getRelativeWidth(23.0))
                    VStack(alignment: .leading, spacing: 0) {
                        TabsView(tabs: $weeklyView1ViewModel.tabViewselectionList,
                                 selectedTabIndex: $weeklyView1ViewModel.selectedViewselectionIndex,
                                 selectedTab: weeklyView1ViewModel.tabViewselectionList[0],
                                 fontSize: 14.0,
                                 fontName: FontScheme
                                     .kRobotoRomanSemiBold(size: getRelativeHeight(14.0)),
                                 selectedFontColor: ColorConstants.Gray700,
                                 unSelectedFontColor: ColorConstants.Gray700,
                                 selectedBackColor: ColorConstants.Gray201, cornerRadius: 10.0,
                                 type: .customBackground)
                            .frame(height: getRelativeHeight(26.0))
                            .background(RoundedCorners(topLeft: 10.0, topRight: 10.0,
                                                       bottomLeft: 10.0, bottomRight: 10.0))
                        PagerView(content: {
                            MonthlyCalendarView()
                            WeeklyView()
                        }, tabIndex: $weeklyView1ViewModel.selectedViewselectionIndex,
                        pagers: $weeklyView1ViewModel.tabViewselectionList)
                            .frame(height: getRelativeHeight(569.0), alignment: .leading)
                    }
                    .frame(width: getRelativeWidth(332.0), height: getRelativeHeight(603.0),
                           alignment: .center)
                    .background(ColorConstants.WhiteA700)
                    .padding(.top, getRelativeHeight(14.0))
                    .padding(.leading, getRelativeWidth(23.0))
                    .padding(.trailing, getRelativeWidth(20.0))
                }
                .frame(width: UIScreen.main.bounds.width, height: getRelativeHeight(667.0),
                       alignment: .leading)
                VStack(alignment: .leading, spacing: 0) {
                    Text("TabBars")
                        .minimumScaleFactor(0.5)
                        .multilineTextAlignment(.leading)
                        .frame(width: UIScreen.main.bounds.width, height: getRelativeHeight(96.0),
                               alignment: .leading)
                }
                .frame(width: UIScreen.main.bounds.width, height: getRelativeHeight(96.0),
                       alignment: .leading)
            }
            .frame(width: UIScreen.main.bounds.width, alignment: .topLeading)
            .background(ColorConstants.WhiteA700)
            .padding(.top, getRelativeHeight(30.0))
            .padding(.bottom, getRelativeHeight(10.0))
        }
        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        .background(ColorConstants.WhiteA700)
        .ignoresSafeArea()
        .hideNavigationBar()
    }
}

struct WeeklyView1View_Previews: PreviewProvider {
    static var previews: some View {
        WeeklyView1View()
    }
}
