import SwiftUI

// Working on highlighting buttons
//struct ButtonPressableStyle: ButtonStyle {
//
//    func makeBody(configuration: Configuration) -> some View {
//        configuration.label.background(configuration.isPressed ? "test" : "fuck you")
////        configuration.label(configuration.isPressed ? configuration.label = "test" : ColorConstants.Gray101)
//    }
//}
//
//extension View {
//    func withPressableStyle() -> some View {
//        buttonStyle(ButtonPressableStyle())
//    }
//}

struct DaysTimeSele1Cell: View {
    
    @State private var change8am = false
    
    var index: Int!

    init(index: Int) {
        self.index = index
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Image("img_rectangle9_1")
                .resizable()
                .frame(width: getRelativeWidth(47.0),
                       height: getRelativeHeight(50.0),
                       alignment: .center)
                .scaledToFit()
                .clipped()
            
            Button(action: {
                var myIndex = index*24+8
                print(index*24 + 8)
                var myCurrentHours = UserDefaults.standard.array(forKey: "listOfHours")
                myCurrentHours?.append(myIndex)
                
                UserDefaults.standard.set(myCurrentHours, forKey: "listOfHours")
                var testMyCurrentHours = String(describing: UserDefaults.standard.object(forKey: "listOfHours")!)
                print("testMyCurrentHours: \(testMyCurrentHours)")
            }, label: {
                Text(StringConstants.kLbl8am)
                    .font(FontScheme.kInterSemiBold(size: getRelativeHeight(12.0)))
                    .fontWeight(.semibold)
                    .foregroundColor(ColorConstants.Gray801)
                    .minimumScaleFactor(0.5)
                    .multilineTextAlignment(.leading)
                    .frame(width: getRelativeWidth(47.0), height: getRelativeHeight(50.0),
                           alignment: .center)
                    .background(ColorConstants.Gray101)
                    .padding(.leading, getRelativeWidth(0.0))
                    .padding(.top, getRelativeHeight(12.0))
            })
//            .withPressableStyle()
//            .buttonStyle(ButtonPressableStyle())
            Button(action: {
                var myIndex = index*24+9
                print(index*24 + 9)
                var myCurrentHours = UserDefaults.standard.array(forKey: "listOfHours")
                myCurrentHours?.append(myIndex)
                
                UserDefaults.standard.set(myCurrentHours, forKey: "listOfHours")
                var testMyCurrentHours = String(describing: UserDefaults.standard.object(forKey: "listOfHours")!)
                print("testMyCurrentHours: \(testMyCurrentHours)")
            }, label: {
                Text(StringConstants.kLbl9am)
                    .font(FontScheme.kInterSemiBold(size: getRelativeHeight(12.0)))
                    .fontWeight(.semibold)
                    .foregroundColor(ColorConstants.Gray801)
                    .minimumScaleFactor(0.5)
                    .multilineTextAlignment(.leading)
                    .frame(width: getRelativeWidth(47.0), height: getRelativeHeight(50.0),
                           alignment: .center)
                    .background(ColorConstants.Gray101)
                    .padding(.leading, getRelativeWidth(0.0))
                    .padding(.top, getRelativeHeight(12.0))
            })
            Button(action: {
                var myIndex = index*24+10
                print(index*24 + 10)
                var myCurrentHours = UserDefaults.standard.array(forKey: "listOfHours")
                myCurrentHours?.append(myIndex)
                
                UserDefaults.standard.set(myCurrentHours, forKey: "listOfHours")
                var testMyCurrentHours = String(describing: UserDefaults.standard.object(forKey: "listOfHours")!)
                print("testMyCurrentHours: \(testMyCurrentHours)")
            }, label: {
                Text(StringConstants.kLbl10am)
                    .font(FontScheme.kInterSemiBold(size: getRelativeHeight(12.0)))
                    .fontWeight(.semibold)
                    .foregroundColor(ColorConstants.Gray801)
                    .minimumScaleFactor(0.5)
                    .multilineTextAlignment(.leading)
                    .frame(width: getRelativeWidth(47.0), height: getRelativeHeight(50.0),
                           alignment: .center)
                    .background(ColorConstants.Gray101)
                    .padding(.leading, getRelativeWidth(0.0))
                    .padding(.top, getRelativeHeight(12.0))
            })
            Button(action: {
                var myIndex = index*24+11
                print(index*24 + 11)
                var myCurrentHours = UserDefaults.standard.array(forKey: "listOfHours")
                myCurrentHours?.append(myIndex)
                
                UserDefaults.standard.set(myCurrentHours, forKey: "listOfHours")
                var testMyCurrentHours = String(describing: UserDefaults.standard.object(forKey: "listOfHours")!)
                print("testMyCurrentHours: \(testMyCurrentHours)")
            }, label: {
                Text(StringConstants.kLbl11am)
                    .font(FontScheme.kInterSemiBold(size: getRelativeHeight(12.0)))
                    .fontWeight(.semibold)
                    .foregroundColor(ColorConstants.Gray801)
                    .minimumScaleFactor(0.5)
                    .multilineTextAlignment(.leading)
                    .frame(width: getRelativeWidth(47.0), height: getRelativeHeight(50.0),
                           alignment: .center)
                    .background(ColorConstants.Gray101)
                    .padding(.leading, getRelativeWidth(0.0))
                    .padding(.top, getRelativeHeight(12.0))
            })
            Button(action: {
                var myIndex = index*24+12
                print(index*24 + 12)
                var myCurrentHours = UserDefaults.standard.array(forKey: "listOfHours")
                myCurrentHours?.append(myIndex)
                
                UserDefaults.standard.set(myCurrentHours, forKey: "listOfHours")
                var testMyCurrentHours = String(describing: UserDefaults.standard.object(forKey: "listOfHours")!)
                print("testMyCurrentHours: \(testMyCurrentHours)")
            }, label: {
                Text(StringConstants.kLbl12pm)
                    .font(FontScheme.kInterSemiBold(size: getRelativeHeight(12.0)))
                    .fontWeight(.semibold)
                    .foregroundColor(ColorConstants.Gray801)
                    .minimumScaleFactor(0.5)
                    .multilineTextAlignment(.leading)
                    .frame(width: getRelativeWidth(47.0), height: getRelativeHeight(50.0),
                           alignment: .center)
                    .background(ColorConstants.Gray101)
                    .padding(.leading, getRelativeWidth(0.0))
                    .padding(.top, getRelativeHeight(12.0))
            })
            Button(action: {
                var myIndex = index*24+13
                print(index*24 + 13)
                var myCurrentHours = UserDefaults.standard.array(forKey: "listOfHours")
                myCurrentHours?.append(myIndex)
                
                UserDefaults.standard.set(myCurrentHours, forKey: "listOfHours")
                var testMyCurrentHours = String(describing: UserDefaults.standard.object(forKey: "listOfHours")!)
                print("testMyCurrentHours: \(testMyCurrentHours)")
            }, label: {
                Text(StringConstants.kLbl1pm)
                    .font(FontScheme.kInterSemiBold(size: getRelativeHeight(12.0)))
                    .fontWeight(.semibold)
                    .foregroundColor(ColorConstants.Gray801)
                    .minimumScaleFactor(0.5)
                    .multilineTextAlignment(.leading)
                    .frame(width: getRelativeWidth(47.0), height: getRelativeHeight(50.0),
                           alignment: .center)
                    .background(ColorConstants.Gray101)
                    .padding(.leading, getRelativeWidth(0.0))
                    .padding(.top, getRelativeHeight(12.0))
            })
            Button(action: {
                var myIndex = index*24+14
                print(index*24 + 14)
                var myCurrentHours = UserDefaults.standard.array(forKey: "listOfHours")
                myCurrentHours?.append(myIndex)
                
                UserDefaults.standard.set(myCurrentHours, forKey: "listOfHours")
                var testMyCurrentHours = String(describing: UserDefaults.standard.object(forKey: "listOfHours")!)
                print("testMyCurrentHours: \(testMyCurrentHours)")
            }, label: {
                Text(StringConstants.kLbl2pm)
                    .font(FontScheme.kInterSemiBold(size: getRelativeHeight(12.0)))
                    .fontWeight(.semibold)
                    .foregroundColor(ColorConstants.Gray801)
                    .minimumScaleFactor(0.5)
                    .multilineTextAlignment(.leading)
                    .frame(width: getRelativeWidth(47.0), height: getRelativeHeight(50.0),
                           alignment: .center)
                    .background(ColorConstants.Gray101)
                    .padding(.leading, getRelativeWidth(0.0))
                    .padding(.top, getRelativeHeight(12.0))
            })
            Button(action: {
                var myIndex = index*24+15
                print(index*24 + 15)
                var myCurrentHours = UserDefaults.standard.array(forKey: "listOfHours")
                myCurrentHours?.append(myIndex)
                
                UserDefaults.standard.set(myCurrentHours, forKey: "listOfHours")
                var testMyCurrentHours = String(describing: UserDefaults.standard.object(forKey: "listOfHours")!)
                print("testMyCurrentHours: \(testMyCurrentHours)")
            }, label: {
                Text(StringConstants.kLbl3pm)
                    .font(FontScheme.kInterSemiBold(size: getRelativeHeight(12.0)))
                    .fontWeight(.semibold)
                    .foregroundColor(ColorConstants.Gray801)
                    .minimumScaleFactor(0.5)
                    .multilineTextAlignment(.leading)
                    .frame(width: getRelativeWidth(47.0), height: getRelativeHeight(50.0),
                           alignment: .center)
                    .background(ColorConstants.Gray101)
                    .padding(.leading, getRelativeWidth(0.0))
                    .padding(.top, getRelativeHeight(12.0))
            })
        }
        .frame(width: getRelativeWidth(47.0), alignment: .leading)
        .hideNavigationBar()
    }
}

//@objc func changeButtonColor(sender: UIButton) {
//    sender.backgroundColor = UIColor.blue
//}

/* struct DaysTimeSele1Cell_Previews: PreviewProvider {

 static var previews: some View {
 			DaysTimeSele1Cell()
 }
 } */
