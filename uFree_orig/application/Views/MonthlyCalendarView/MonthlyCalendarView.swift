import SwiftUI

struct MonthlyCalendarView: View {
    @StateObject var monthlyCalendarViewModel = MonthlyCalendarViewModel()
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    var body: some View {
        NavigationView {
            ScrollView(.vertical, showsIndicators: false) {
                ZStack(alignment: .leading) {
                    Image("img_group17617")
                        .resizable()
                        .frame(width: getRelativeWidth(210.0), height: getRelativeHeight(334.0),
                               alignment: .center)
                        .scaledToFit()
                        .clipped()
                        .padding(.top, getRelativeHeight(136.82))
                        .padding(.horizontal, getRelativeWidth(73.0))
                    VStack {
                        Text(StringConstants.kLblMonth2022)
                            .font(FontScheme.kInterBold(size: getRelativeHeight(16.0)))
                            .fontWeight(.bold)
                            .foregroundColor(ColorConstants.Gray901)
                            .minimumScaleFactor(0.5)
                            .multilineTextAlignment(.leading)
                            .frame(width: getRelativeWidth(91.0), height: getRelativeHeight(16.0),
                                   alignment: .topLeading)
                            .padding(.horizontal, getRelativeWidth(20.0))
                        HStack {
                            Group {
                                Text(StringConstants.kLblS)
                                    .font(FontScheme
                                        .kRobotoRomanRegular(size: getRelativeHeight(14.0)))
                                    .fontWeight(.regular)
                                    .foregroundColor(ColorConstants.Gray701)
                                    .minimumScaleFactor(0.5)
                                    .multilineTextAlignment(.leading)
                                    .frame(width: getRelativeWidth(9.0),
                                           height: getRelativeHeight(14.0), alignment: .topLeading)
                                Spacer()
                                Text(StringConstants.kLblM)
                                    .font(FontScheme
                                        .kRobotoRomanRegular(size: getRelativeHeight(14.0)))
                                    .fontWeight(.regular)
                                    .foregroundColor(ColorConstants.Gray701)
                                    .minimumScaleFactor(0.5)
                                    .multilineTextAlignment(.leading)
                                    .frame(width: getRelativeWidth(13.0),
                                           height: getRelativeHeight(14.0), alignment: .topLeading)
                                Spacer()
                                Text(StringConstants.kLblT)
                                    .font(FontScheme
                                        .kRobotoRomanRegular(size: getRelativeHeight(14.0)))
                                    .fontWeight(.regular)
                                    .foregroundColor(ColorConstants.Gray701)
                                    .minimumScaleFactor(0.5)
                                    .multilineTextAlignment(.leading)
                                    .frame(width: getRelativeWidth(9.0),
                                           height: getRelativeHeight(14.0), alignment: .topLeading)
                                Spacer()
                                Text(StringConstants.kLblW)
                                    .font(FontScheme
                                        .kRobotoRomanRegular(size: getRelativeHeight(14.0)))
                                    .fontWeight(.regular)
                                    .foregroundColor(ColorConstants.Gray701)
                                    .minimumScaleFactor(0.5)
                                    .multilineTextAlignment(.leading)
                                    .frame(width: getRelativeWidth(13.0),
                                           height: getRelativeHeight(14.0), alignment: .topLeading)
                                Spacer()
                            }
                            Group {
                                Text(StringConstants.kLblT)
                                    .font(FontScheme
                                        .kRobotoRomanRegular(size: getRelativeHeight(14.0)))
                                    .fontWeight(.regular)
                                    .foregroundColor(ColorConstants.Gray701)
                                    .minimumScaleFactor(0.5)
                                    .multilineTextAlignment(.leading)
                                    .frame(width: getRelativeWidth(9.0),
                                           height: getRelativeHeight(14.0), alignment: .topLeading)
                                Spacer()
                                Text(StringConstants.kLblF)
                                    .font(FontScheme
                                        .kRobotoRomanRegular(size: getRelativeHeight(14.0)))
                                    .fontWeight(.regular)
                                    .foregroundColor(ColorConstants.Gray701)
                                    .minimumScaleFactor(0.5)
                                    .multilineTextAlignment(.leading)
                                    .frame(width: getRelativeWidth(8.0),
                                           height: getRelativeHeight(14.0), alignment: .topLeading)
                                Spacer()
                                Text(StringConstants.kLblS)
                                    .font(FontScheme
                                        .kRobotoRomanRegular(size: getRelativeHeight(14.0)))
                                    .fontWeight(.regular)
                                    .foregroundColor(ColorConstants.Gray701)
                                    .minimumScaleFactor(0.5)
                                    .multilineTextAlignment(.leading)
                                    .frame(width: getRelativeWidth(9.0),
                                           height: getRelativeHeight(14.0), alignment: .topLeading)
                            }
                        }
                        .frame(width: getRelativeWidth(314.0), height: getRelativeHeight(14.0),
                               alignment: .center)
                        .padding(.top, getRelativeHeight(35.0))
                        .padding(.horizontal, getRelativeWidth(20.0))
                        ScrollView(.vertical, showsIndicators: false) {
                            VStack {
                                LazyVGrid(columns: [
                                    SwiftUI.GridItem(),
                                    SwiftUI.GridItem(),
                                    SwiftUI.GridItem(),
                                    SwiftUI.GridItem(),
                                    SwiftUI.GridItem(),
                                    SwiftUI.GridItem(),
                                    SwiftUI.GridItem()
                                ]) {
                                    ForEach(0 ... 34, id: \.self) { index in
                                        DaycellCell()
                                    }
                                }
                            }
                        }
                        .padding(.top, getRelativeHeight(19.0))
                        .fixedSize(horizontal: false, vertical: false)
                    }
                    .frame(width: getRelativeWidth(356.0), height: getRelativeHeight(493.0),
                           alignment: .leading)
                }
                .hideNavigationBar()
                .frame(width: getRelativeWidth(356.0), height: getRelativeHeight(493.0),
                       alignment: .leading)
                Group {
                    NavigationLink(destination: ProfileView(),
                                   tag: "ProfileView",
                                   selection: $monthlyCalendarViewModel.nextScreen,
                                   label: {
                                       EmptyView()
                                   })
                    NavigationLink(destination: EventCreationView(),
                                   tag: "EventCreationView",
                                   selection: $monthlyCalendarViewModel.nextScreen,
                                   label: {
                                       EmptyView()
                                   })
                }
            }
            .hideNavigationBar()
        }
        .hideNavigationBar()
    }
}

struct MonthlyCalendarView_Previews: PreviewProvider {
    static var previews: some View {
        MonthlyCalendarView()
    }
}
