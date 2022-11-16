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
    @State private var didTapRow8:Bool = false
    @State private var didTapRow9:Bool = false
    @State private var didTapRow10:Bool = false
    @State private var didTapRow11:Bool = false
    @State private var didTapRow12:Bool = false
    @State private var didTapRow1:Bool = false
    @State private var didTapRow2:Bool = false
    @State private var didTapRow3:Bool = false
    //COLORs
    
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
                if (!didTapRow8) {
                var myIndex = index*24+8
                print(index*24 + 8)
                var myCurrentHours = UserDefaults.standard.array(forKey: "listOfHours")
                myCurrentHours?.append(myIndex)
                
                self.didTapRow8 = true
                UserDefaults.standard.set(myCurrentHours, forKey: "listOfHours")
                var testMyCurrentHours = String(describing: UserDefaults.standard.object(forKey: "listOfHours")!)
                print("testMyCurrentHours: \(testMyCurrentHours)")
                }
                else {
                    self.didTapRow8 = false
                }
            }, label: {
                Text(StringConstants.kLbl8am)
                    .font(FontScheme.kInterSemiBold(size: getRelativeHeight(12.0)))
                    .fontWeight(.semibold)
                    .foregroundColor(ColorConstants.Gray801)
                    .minimumScaleFactor(0.5)
                    .multilineTextAlignment(.leading)
                    .frame(width: getRelativeWidth(47.0), height: getRelativeHeight(50.0),
                           alignment: .center)
                    //.background(ColorConstants.Gray101) //switch to Lime100 when clicked
                    .background(didTapRow8 ? ColorConstants.Lime100 : ColorConstants.Gray101)
                    .padding(.leading, getRelativeWidth(0.0))
                    .padding(.top, getRelativeHeight(12.0))
            })
//            .withPressableStyle()
//            .buttonStyle(ButtonPressableStyle())
            Button(action: {
                if(!didTapRow9) {
                var myIndex = index*24+9
                print(index*24 + 9)
                var myCurrentHours = UserDefaults.standard.array(forKey: "listOfHours")
                myCurrentHours?.append(myIndex)
                
                self.didTapRow9 = true
                UserDefaults.standard.set(myCurrentHours, forKey: "listOfHours")
                var testMyCurrentHours = String(describing: UserDefaults.standard.object(forKey: "listOfHours")!)
                print("testMyCurrentHours: \(testMyCurrentHours)")
                }
                else {
                    self.didTapRow9 = false
                }
            }, label: {
                Text(StringConstants.kLbl9am)
                    .font(FontScheme.kInterSemiBold(size: getRelativeHeight(12.0)))
                    .fontWeight(.semibold)
                    .foregroundColor(ColorConstants.Gray801)
                    .minimumScaleFactor(0.5)
                    .multilineTextAlignment(.leading)
                    .frame(width: getRelativeWidth(47.0), height: getRelativeHeight(50.0),
                           alignment: .center)
                    .background(didTapRow9 ? ColorConstants.Lime100 : ColorConstants.Gray101)
                    .padding(.leading, getRelativeWidth(0.0))
                    .padding(.top, getRelativeHeight(12.0))
            })
            Button(action: {
                if (!didTapRow10) {
                var myIndex = index*24+10
                print(index*24 + 10)
                var myCurrentHours = UserDefaults.standard.array(forKey: "listOfHours")
                myCurrentHours?.append(myIndex)
                
                self.didTapRow10 = true
                UserDefaults.standard.set(myCurrentHours, forKey: "listOfHours")
                var testMyCurrentHours = String(describing: UserDefaults.standard.object(forKey: "listOfHours")!)
                print("testMyCurrentHours: \(testMyCurrentHours)")
                }
                else {
                    self.didTapRow10 = false
                }
            }, label: {
                Text(StringConstants.kLbl10am)
                    .font(FontScheme.kInterSemiBold(size: getRelativeHeight(12.0)))
                    .fontWeight(.semibold)
                    .foregroundColor(ColorConstants.Gray801)
                    .minimumScaleFactor(0.5)
                    .multilineTextAlignment(.leading)
                    .frame(width: getRelativeWidth(47.0), height: getRelativeHeight(50.0),
                           alignment: .center)
                    .background(didTapRow10 ? ColorConstants.Lime100 : ColorConstants.Gray101)
                    .padding(.leading, getRelativeWidth(0.0))
                    .padding(.top, getRelativeHeight(12.0))
            })
            Button(action: {
                if (!didTapRow11) {
                var myIndex = index*24+11
                print(index*24 + 11)
                var myCurrentHours = UserDefaults.standard.array(forKey: "listOfHours")
                myCurrentHours?.append(myIndex)
                
                self.didTapRow11 = true
                UserDefaults.standard.set(myCurrentHours, forKey: "listOfHours")
                var testMyCurrentHours = String(describing: UserDefaults.standard.object(forKey: "listOfHours")!)
                print("testMyCurrentHours: \(testMyCurrentHours)")
                }
                else {
                    self.didTapRow11 = false
                }
            }, label: {
                Text(StringConstants.kLbl11am)
                    .font(FontScheme.kInterSemiBold(size: getRelativeHeight(12.0)))
                    .fontWeight(.semibold)
                    .foregroundColor(ColorConstants.Gray801)
                    .minimumScaleFactor(0.5)
                    .multilineTextAlignment(.leading)
                    .frame(width: getRelativeWidth(47.0), height: getRelativeHeight(50.0),
                           alignment: .center)
                    .background(didTapRow11 ? ColorConstants.Lime100 : ColorConstants.Gray101)
                    .padding(.leading, getRelativeWidth(0.0))
                    .padding(.top, getRelativeHeight(12.0))
            })
            Button(action: {
                if (!didTapRow12) {
                var myIndex = index*24+12
                print(index*24 + 12)
                var myCurrentHours = UserDefaults.standard.array(forKey: "listOfHours")
                myCurrentHours?.append(myIndex)
                
                self.didTapRow12 = true
                UserDefaults.standard.set(myCurrentHours, forKey: "listOfHours")
                var testMyCurrentHours = String(describing: UserDefaults.standard.object(forKey: "listOfHours")!)
                print("testMyCurrentHours: \(testMyCurrentHours)")
                }
                else {
                    self.didTapRow12 = false
                }
            }, label: {
                Text(StringConstants.kLbl12pm)
                    .font(FontScheme.kInterSemiBold(size: getRelativeHeight(12.0)))
                    .fontWeight(.semibold)
                    .foregroundColor(ColorConstants.Gray801)
                    .minimumScaleFactor(0.5)
                    .multilineTextAlignment(.leading)
                    .frame(width: getRelativeWidth(47.0), height: getRelativeHeight(50.0),
                           alignment: .center)
                    .background(didTapRow12 ? ColorConstants.Lime100 : ColorConstants.Gray101)
                    .padding(.leading, getRelativeWidth(0.0))
                    .padding(.top, getRelativeHeight(12.0))
            })
            Button(action: {
                if (!didTapRow1) {
                var myIndex = index*24+13
                print(index*24 + 13)
                var myCurrentHours = UserDefaults.standard.array(forKey: "listOfHours")
                myCurrentHours?.append(myIndex)
                
                self.didTapRow1 = true
                UserDefaults.standard.set(myCurrentHours, forKey: "listOfHours")
                var testMyCurrentHours = String(describing: UserDefaults.standard.object(forKey: "listOfHours")!)
                print("testMyCurrentHours: \(testMyCurrentHours)")
                }
                else {
                    self.didTapRow1 = false
                }
            }, label: {
                Text(StringConstants.kLbl1pm)
                    .font(FontScheme.kInterSemiBold(size: getRelativeHeight(12.0)))
                    .fontWeight(.semibold)
                    .foregroundColor(ColorConstants.Gray801)
                    .minimumScaleFactor(0.5)
                    .multilineTextAlignment(.leading)
                    .frame(width: getRelativeWidth(47.0), height: getRelativeHeight(50.0),
                           alignment: .center)
                    .background(didTapRow1 ? ColorConstants.Lime100 : ColorConstants.Gray101)
                    .padding(.leading, getRelativeWidth(0.0))
                    .padding(.top, getRelativeHeight(12.0))
            })
            Button(action: {
                if (!didTapRow2){
                var myIndex = index*24+14
                print(index*24 + 14)
                var myCurrentHours = UserDefaults.standard.array(forKey: "listOfHours")
                myCurrentHours?.append(myIndex)
                
                self.didTapRow2 = true
                UserDefaults.standard.set(myCurrentHours, forKey: "listOfHours")
                var testMyCurrentHours = String(describing: UserDefaults.standard.object(forKey: "listOfHours")!)
                print("testMyCurrentHours: \(testMyCurrentHours)")
                }
                else {
                    self.didTapRow2 = false
                }
            }, label: {
                Text(StringConstants.kLbl2pm)
                    .font(FontScheme.kInterSemiBold(size: getRelativeHeight(12.0)))
                    .fontWeight(.semibold)
                    .foregroundColor(ColorConstants.Gray801)
                    .minimumScaleFactor(0.5)
                    .multilineTextAlignment(.leading)
                    .frame(width: getRelativeWidth(47.0), height: getRelativeHeight(50.0),
                           alignment: .center)
                    .background(didTapRow2 ? ColorConstants.Lime100 : ColorConstants.Gray101)
                    .padding(.leading, getRelativeWidth(0.0))
                    .padding(.top, getRelativeHeight(12.0))
            })
            Button(action: {
                if (!didTapRow3) {
                var myIndex = index*24+15
                print(index*24 + 15)
                var myCurrentHours = UserDefaults.standard.array(forKey: "listOfHours")
                myCurrentHours?.append(myIndex)
                
                self.didTapRow3 = true
                UserDefaults.standard.set(myCurrentHours, forKey: "listOfHours")
                var testMyCurrentHours = String(describing: UserDefaults.standard.object(forKey: "listOfHours")!)
                print("testMyCurrentHours: \(testMyCurrentHours)")
                }
                else {
                    self.didTapRow3 = false
                }
            }, label: {
                Text(StringConstants.kLbl3pm)
                    .font(FontScheme.kInterSemiBold(size: getRelativeHeight(12.0)))
                    .fontWeight(.semibold)
                    .foregroundColor(ColorConstants.Gray801)
                    .minimumScaleFactor(0.5)
                    .multilineTextAlignment(.leading)
                    .frame(width: getRelativeWidth(47.0), height: getRelativeHeight(50.0),
                           alignment: .center)
                    .background(didTapRow3 ? ColorConstants.Lime100 : ColorConstants.Gray101)
                    .padding(.leading, getRelativeWidth(0.0))
                    .padding(.top, getRelativeHeight(12.0))
            })
        }
        .frame(width: getRelativeWidth(47.0), alignment: .leading)
        .hideNavigationBar()
    }
}

//func changeButtonColor(sender: UIButton) {
//    sender.backgroundColor = UIColor.systemGreen
//}

/* struct DaysTimeSele1Cell_Previews: PreviewProvider {

 static var previews: some View {
 			DaysTimeSele1Cell()
 }
 } */
