import Foundation
import SwiftUI

/**
 PagerView

 # Input Variable: #

 - `content`: Content of Views.

 - `tabIndex`: variable is wrapped with @Binding. provide selected tab index to open view.

 - `selectedTab`: variable is wrapped with @Binding.

 # Example #
 ```
 @State private var tabIndex: Int = 0
 @State private var Pagers: [String] = 0

 PagerView(content: {
     CallsView()
     ChatsView()
     StatusView()
 }, tabIndex: $tabIndex, pagers: $Pagers)
 ```
 */

struct PagerView: View {
    @Binding var Pagers: [String]
    @Binding var selectedTabIndex: Int
    let content: [AnyView]

    init<Views>(@ViewBuilder content: @escaping () -> TupleView<Views>, tabIndex: Binding<Int>,
                pagers: Binding<[String]>)
    {
        self.content = content().getViews
        _selectedTabIndex = tabIndex
        _Pagers = pagers
    }

    var body: some View {
        HStack(alignment: .center, spacing: 0) {
            ForEach(content.indices) { _ in
                content[selectedTabIndex]
                    .frame(width: UIScreen.main.bounds.width, alignment: .center)
                    .gesture(DragGesture(minimumDistance: 150, coordinateSpace: .global)
                        .onEnded { value in
                            if value.translation.width < 0 {
                                // Left Swipe
                                if selectedTabIndex == Pagers.count - 1 {
                                    selectedTabIndex = 0
                                } else {
                                    selectedTabIndex += 1
                                }
                            } else if value.translation.width > 0 {
                                // Right Swipe
                                if selectedTabIndex == 0 {
                                    selectedTabIndex = Pagers.count - 1
                                } else {
                                    selectedTabIndex -= 1
                                }
                            }
                        })
            }
        }
        .frame(width: UIScreen.main.bounds.width, alignment: .leading)
    }
}

extension TupleView {
    var getViews: [AnyView] {
        makeArray(from: value)
    }

    private struct GenericView {
        let body: Any

        var anyView: AnyView? {
            AnyView(_fromValue: body)
        }
    }

    private func makeArray<Tuple>(from tuple: Tuple) -> [AnyView] {
        func convert(child: Mirror.Child) -> AnyView? {
            withUnsafeBytes(of: child.value) { ptr -> AnyView? in
                let binded = ptr.bindMemory(to: GenericView.self)
                return binded.first?.anyView
            }
        }

        let tupleMirror = Mirror(reflecting: tuple)
        return tupleMirror.children.compactMap(convert)
    }
}

// struct PagerView_Previews: PreviewProvider {
//    static var previews: some View {
//        PagerView(content: {
//            MyWorkoutsView()
//            TrainersView()
//            MyWorkoutsView()
//        }, tabIndex: .constant(0)
//        , pagers: .constant(["Discover", "Trainers", "My Workouts"]))
//    }
// }
