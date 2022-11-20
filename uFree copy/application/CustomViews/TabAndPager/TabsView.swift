import SwiftUI

enum TabStyleType {
    case customBackground, line
}

/**
 TabsView provide functionality to change PagerView's Page.

 # Input Variable: #

 - `tabs`: Array of string.

 - `selectedTabIndex`: String value for inidcate selected tabs.

 - `selectedTab`:

 - `fontSize` ; CGFloat value for change tab text size.

 - `fontName` : Tab's text font name

 - `selectedFontColor` : Color for selected tab.

 - `unSelectedFontColor` : Color for unselected tab color.

 - `selectedBackColor` : Selected tab background color.

 - `unSelectedBackColor` : UnSelectedBackColor tab background color.

 - `cornerRadius` : Tab's Corner Radius.

 - 'type' : TabStyleType type Ex. customBackground or line

 # Example #
 ```
 var tabs: [String] = ["Calls", "Chats", "Status"]
 @State private var selectedUisegmentIndex: Int = 0

 TabsView(tabs: tabs,
          selectedTabIndex: selectedUisegmentIndex,
          selectedTab: homeViewModel.tabUisegmentList[0],
          fontSize: 12.0,
          fontName: Font.system(size: 20),
          selectedFontColor: Color.white,
          unSelectedFontColor: Color.black,
          selectedBackColor: Color.black,
          unSelectedBackColor: Color.white,
          cornerRadius: 5.0,
          type: TabStyleType.customBackground)
 ```
 */

struct TabsView: View {
    @Binding var tabs: [String]
    @Binding var selectedTabIndex: Int
    @State var selectedTab: String
    @State var tabsCount: Int = 0
    @State var tabWidth: CGFloat = 0.0
    var fontSize: Float = 15.0
    var fontName: Font? = nil
    var selectedFontColor: Color = .black
    var unSelectedFontColor: Color = .gray
    var selectedBackColor: Color = .clear
    var unSelectedBackColor: Color = .white
    var selectedLineColor: Color = .black
    var lineWidth: Float = 80.0
    var lineHeight: Float = 2.0
    var cornerRadius: Float = 10.0
    var type: TabStyleType = .line

    var body: some View {
        HStack {
            if type == .customBackground {
                LazyHStack {
                    ForEach(0 ... tabs.count - 1, id: \.self) { index in
                        Text("\(tabs[index])")
                            .font(fontName == nil ? .system(size: CGFloat(fontSize)) : fontName)
                            .foregroundColor(tabs[index] == selectedTab ? selectedFontColor :
                                unSelectedFontColor)
                            .padding(12)
                            .background(tabs[index] == selectedTab ? selectedBackColor :
                                unSelectedBackColor)
                            .cornerRadius(CGFloat(cornerRadius))
                            .frame(width: tabWidth, alignment: .center)
                            .onTapGesture {
                                selectedTabIndex = index
                                print(selectedTabIndex)
                            }
                    }
                }
            } else {
                LazyHStack(spacing: 0) {
                    ForEach(0 ... tabs.count - 1, id: \.self) { index in
                        VStack(spacing: 0) {
                            Text("\(tabs[index])")
                                .font(fontName == nil ? .system(size: CGFloat(fontSize)) : fontName)
                                .foregroundColor(tabs[index] == selectedTab ? selectedFontColor :
                                    unSelectedFontColor)
                                .padding(10)
                                .background(tabs[index] == selectedTab ? selectedBackColor :
                                    unSelectedBackColor)

                            Divider()
                                .frame(width: CGFloat(lineWidth), height: CGFloat(lineHeight),
                                       alignment: .center)
                                .background(tabs[index] == selectedTab ? selectedLineColor : Color
                                    .clear)
                                .opacity(tabs[index] == selectedTab ? 1.0 : 0.0)
                        }
                        .frame(width: tabWidth, alignment: .center)
                        .onTapGesture {
                            selectedTabIndex = index
                            print(selectedTabIndex)
                        }
                    }
                }
            }
        }.onChange(of: selectedTabIndex, perform: { _ in
            selectedTab = tabs[selectedTabIndex]
        })
        .onAppear(perform: {
            tabsCount = tabs.count
            tabWidth = CGFloat(UIScreen.main.bounds.width / CGFloat(tabsCount))
        })
    }
}

// struct TabsView_Previews: PreviewProvider {
//    static var previews: some View {
//        TabsView(Tabs: .constant(["Discover", "MyWorkouts", "Profile"]), selectedTabIndex: .constant(0), selectedTab: "Discover")
//
//    }
// }
