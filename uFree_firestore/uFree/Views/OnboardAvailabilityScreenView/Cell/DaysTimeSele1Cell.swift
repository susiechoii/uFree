import SwiftUI

struct DaysTimeSele1Cell: View {
    
    //COLORs
    //NSCHANGES
    @State private var change8am = false
    @State private var didTapRow8:Bool = false
    @State private var didTapRow9:Bool = false
    @State private var didTapRow10:Bool = false
    @State private var didTapRow11:Bool = false
    @State private var didTapRow12:Bool = false
    @State private var didTapRow1:Bool = false
    @State private var didTapRow2:Bool = false
    @State private var didTapRow3:Bool = false
    
    @EnvironmentObject var viewModel: AuthenticationViewModel
    
    var index: Int!
    var daysOfWeek: [String] = ["Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"]
    var dayInString: String!
    
    init(index: Int) {
        self.index = index
        self.dayInString = daysOfWeek[self.index]
    }
    
    var body: some View {
        VStack(alignment: .center, spacing: 0) {
            
            // Label for the day of the week
            Text(dayInString)
                .font(FontScheme.kInterSemiBold(size: getRelativeHeight(18)))
                .foregroundColor(ColorConstants.Gray801)
                .minimumScaleFactor(0.5)
                .multilineTextAlignment(.center)
                .frame(width: getRelativeWidth(70), height: getRelativeHeight(75),
                       alignment: .center)
                .background(RoundedCorners(topLeft: 10,
                                           topRight: 10,
                                           bottomLeft: 10,
                                           bottomRight: 10)
                    .fill(ColorConstants.Gray101))
                .padding(.top, getRelativeHeight(12.0))
                .padding(.bottom, getRelativeHeight(5))
            
            // 8AM button
            Button(action: {
                let myIndex = index*24+8
                print(index*24 + 8)
                
                if (!didTapRow8) {
                    
                    // sanity check to make sure no duplicates exist
                    if !viewModel.savedUserDefaultHours.contains(myIndex) {
                        viewModel.savedUserDefaultHours.append(myIndex)
                    }
                    
                    self.didTapRow8 = true
                    print("viewModel.savedUserDefaultHours: \(viewModel.savedUserDefaultHours)")
                }
                else {
                    if let index = viewModel.savedUserDefaultHours.firstIndex(of: myIndex) {
                        viewModel.savedUserDefaultHours.remove(at: index)
                    }
                    print("viewModel.savedUserDefaultHours REMOVED VALUE: \(viewModel.savedUserDefaultHours)")
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
                    .background(RoundedCorners(topLeft: 10,
                                               topRight: 10,
                                               bottomLeft: 10,
                                               bottomRight: 10)
                        .fill(didTapRow8 ? ColorConstants.Lime100 : ColorConstants.Gray101))
                    .padding(.leading, getRelativeWidth(0.0))
                    .padding(.top, getRelativeHeight(12.0))
            })
 
            // 9AM button
            Button(action: {
                let myIndex = index*24+9
                print(index*24 + 9)
                
                if (!didTapRow9) {
                    
                    // sanity check to make sure no duplicates exist
                    if !viewModel.savedUserDefaultHours.contains(myIndex) {
                        viewModel.savedUserDefaultHours.append(myIndex)
                    }
                    
                    self.didTapRow9 = true
                    print("viewModel.savedUserDefaultHours: \(viewModel.savedUserDefaultHours)")
                }
                else {
                    if let index = viewModel.savedUserDefaultHours.firstIndex(of: myIndex) {
                        viewModel.savedUserDefaultHours.remove(at: index)
                    }
                    print("viewModel.savedUserDefaultHours REMOVED VALUE: \(viewModel.savedUserDefaultHours)")
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
                //.background(ColorConstants.Gray101) //switch to Lime100 when clicked
                    .background(RoundedCorners(topLeft: 10,
                                               topRight: 10,
                                               bottomLeft: 10,
                                               bottomRight: 10)
                        .fill(didTapRow9 ? ColorConstants.Lime100 : ColorConstants.Gray101))
                    .padding(.leading, getRelativeWidth(0.0))
                    .padding(.top, getRelativeHeight(12.0))
            })
            
            // 10AM button
            Button(action: {
                let myIndex = index*24+10
                print(index*24 + 10)
                
                if (!didTapRow10) {
                    
                    // sanity check to make sure no duplicates exist
                    if !viewModel.savedUserDefaultHours.contains(myIndex) {
                        viewModel.savedUserDefaultHours.append(myIndex)
                    }
                    
                    self.didTapRow10 = true
                    print("viewModel.savedUserDefaultHours: \(viewModel.savedUserDefaultHours)")
                }
                else {
                    if let index = viewModel.savedUserDefaultHours.firstIndex(of: myIndex) {
                        viewModel.savedUserDefaultHours.remove(at: index)
                    }
                    print("viewModel.savedUserDefaultHours REMOVED VALUE: \(viewModel.savedUserDefaultHours)")
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
                //.background(ColorConstants.Gray101) //switch to Lime100 when clicked
                    .background(RoundedCorners(topLeft: 10,
                                               topRight: 10,
                                               bottomLeft: 10,
                                               bottomRight: 10)
                        .fill(didTapRow10 ? ColorConstants.Lime100 : ColorConstants.Gray101))
                    .padding(.leading, getRelativeWidth(0.0))
                    .padding(.top, getRelativeHeight(12.0))
            })
            
            // 11AM button
            Button(action: {
                let myIndex = index*24+11
                print(index*24 + 11)
                
                if (!didTapRow11) {
                    
                    // sanity check to make sure no duplicates exist
                    if !viewModel.savedUserDefaultHours.contains(myIndex) {
                        viewModel.savedUserDefaultHours.append(myIndex)
                    }
                    
                    self.didTapRow11 = true
                    print("viewModel.savedUserDefaultHours: \(viewModel.savedUserDefaultHours)")
                }
                else {
                    if let index = viewModel.savedUserDefaultHours.firstIndex(of: myIndex) {
                        viewModel.savedUserDefaultHours.remove(at: index)
                    }
                    print("viewModel.savedUserDefaultHours REMOVED VALUE: \(viewModel.savedUserDefaultHours)")
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
                //.background(ColorConstants.Gray101) //switch to Lime100 when clicked
                    .background(RoundedCorners(topLeft: 10,
                                               topRight: 10,
                                               bottomLeft: 10,
                                               bottomRight: 10)
                        .fill(didTapRow11 ? ColorConstants.Lime100 : ColorConstants.Gray101))
                    .padding(.leading, getRelativeWidth(0.0))
                    .padding(.top, getRelativeHeight(12.0))
            })
            
            // 12PM button
            Button(action: {
                let myIndex = index*24+12
                print(index*24 + 12)
                
                if (!didTapRow12) {
                    
                    // sanity check to make sure no duplicates exist
                    if !viewModel.savedUserDefaultHours.contains(myIndex) {
                        viewModel.savedUserDefaultHours.append(myIndex)
                    }
                    
                    self.didTapRow12 = true
                    print("viewModel.savedUserDefaultHours: \(viewModel.savedUserDefaultHours)")
                }
                else {
                    if let index = viewModel.savedUserDefaultHours.firstIndex(of: myIndex) {
                        viewModel.savedUserDefaultHours.remove(at: index)
                    }
                    print("viewModel.savedUserDefaultHours REMOVED VALUE: \(viewModel.savedUserDefaultHours)")
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
                //.background(ColorConstants.Gray101) //switch to Lime100 when clicked
                    .background(RoundedCorners(topLeft: 10,
                                               topRight: 10,
                                               bottomLeft: 10,
                                               bottomRight: 10)
                        .fill(didTapRow12 ? ColorConstants.Lime100 : ColorConstants.Gray101))
                    .padding(.leading, getRelativeWidth(0.0))
                    .padding(.top, getRelativeHeight(12.0))
            })
            
            // 1PM button
            Button(action: {
                let myIndex = index*24+13
                print(index*24 + 13)
                
                if (!didTapRow1) {
                    
                    // sanity check to make sure no duplicates exist
                    if !viewModel.savedUserDefaultHours.contains(myIndex) {
                        viewModel.savedUserDefaultHours.append(myIndex)
                    }
                    
                    self.didTapRow1 = true
                    print("viewModel.savedUserDefaultHours: \(viewModel.savedUserDefaultHours)")
                }
                else {
                    if let index = viewModel.savedUserDefaultHours.firstIndex(of: myIndex) {
                        viewModel.savedUserDefaultHours.remove(at: index)
                    }
                    print("viewModel.savedUserDefaultHours REMOVED VALUE: \(viewModel.savedUserDefaultHours)")
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
                //.background(ColorConstants.Gray101) //switch to Lime100 when clicked
                    .background(RoundedCorners(topLeft: 10,
                                               topRight: 10,
                                               bottomLeft: 10,
                                               bottomRight: 10)
                        .fill(didTapRow1 ? ColorConstants.Lime100 : ColorConstants.Gray101))
                    .padding(.leading, getRelativeWidth(0.0))
                    .padding(.top, getRelativeHeight(12.0))
            })
            
            // 2PM button
            Button(action: {
                let myIndex = index*24+14
                print(index*24 + 14)
                
                if (!didTapRow2) {
                    
                    // sanity check to make sure no duplicates exist
                    if !viewModel.savedUserDefaultHours.contains(myIndex) {
                        viewModel.savedUserDefaultHours.append(myIndex)
                    }
                    
                    self.didTapRow2 = true
                    print("viewModel.savedUserDefaultHours: \(viewModel.savedUserDefaultHours)")
                }
                else {
                    if let index = viewModel.savedUserDefaultHours.firstIndex(of: myIndex) {
                        viewModel.savedUserDefaultHours.remove(at: index)
                    }
                    print("viewModel.savedUserDefaultHours REMOVED VALUE: \(viewModel.savedUserDefaultHours)")
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
                //.background(ColorConstants.Gray101) //switch to Lime100 when clicked
                    .background(RoundedCorners(topLeft: 10,
                                               topRight: 10,
                                               bottomLeft: 10,
                                               bottomRight: 10)
                        .fill(didTapRow2 ? ColorConstants.Lime100 : ColorConstants.Gray101))
                    .padding(.leading, getRelativeWidth(0.0))
                    .padding(.top, getRelativeHeight(12.0))
            })
            
            // 3PM button
            Button(action: {
                let myIndex = index*24+15
                print(index*24 + 15)
                
                if (!didTapRow3) {
                    
                    // sanity check to make sure no duplicates exist
                    if !viewModel.savedUserDefaultHours.contains(myIndex) {
                        viewModel.savedUserDefaultHours.append(myIndex)
                    }
                    
                    self.didTapRow3 = true
                    print("viewModel.savedUserDefaultHours: \(viewModel.savedUserDefaultHours)")
                }
                else {
                    if let index = viewModel.savedUserDefaultHours.firstIndex(of: myIndex) {
                        viewModel.savedUserDefaultHours.remove(at: index)
                    }
                    print("viewModel.savedUserDefaultHours REMOVED VALUE: \(viewModel.savedUserDefaultHours)")
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
                //.background(ColorConstants.Gray101) //switch to Lime100 when clicked
                    .background(RoundedCorners(topLeft: 10,
                                               topRight: 10,
                                               bottomLeft: 10,
                                               bottomRight: 10)
                        .fill(didTapRow3 ? ColorConstants.Lime100 : ColorConstants.Gray101))
                    .padding(.leading, getRelativeWidth(0.0))
                    .padding(.top, getRelativeHeight(12.0))
            })
            
        }
        .frame(width: getRelativeWidth(75), alignment: .center)
        
    }
}
