import SwiftUI

struct DaysTimeSele1Cell: View {
    
    //COLORs
    //NSCHANGES
    @State private var didTapRow0:Bool = false
    @State private var didTapRow1:Bool = false
    @State private var didTapRow2:Bool = false
    @State private var didTapRow3:Bool = false
    @State private var didTapRow4:Bool = false
    @State private var didTapRow5:Bool = false
    @State private var didTapRow6:Bool = false
    @State private var didTapRow7:Bool = false
    @State private var didTapRow8:Bool = false
    @State private var didTapRow9:Bool = false
    @State private var didTapRow10:Bool = false
    @State private var didTapRow11:Bool = false
    @State private var didTapRow12:Bool = false
    @State private var didTapRow13:Bool = false
    @State private var didTapRow14:Bool = false
    @State private var didTapRow15:Bool = false
    @State private var didTapRow16:Bool = false
    @State private var didTapRow17:Bool = false
    @State private var didTapRow18:Bool = false
    @State private var didTapRow19:Bool = false
    @State private var didTapRow20:Bool = false
    @State private var didTapRow21:Bool = false
    @State private var didTapRow22:Bool = false
    @State private var didTapRow23:Bool = false
    
    @EnvironmentObject var viewModel: AuthenticationViewModel
    
    var index: Int!
    var daysOfWeek: [String] = ["Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"]
    var dayInString: String!
    
    init(index: Int) {
        self.index = index
        self.dayInString = daysOfWeek[self.index]
    }
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: true){
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
                
                Group{
                    // 12AM button
                    Button(action: {
                        let myIndex = index*24+0
                        print(index*24 + 0)
                        
                        if (!didTapRow0) {
                            
                            // sanity check to make sure no duplicates exist
                            if !viewModel.savedUserDefaultHours.contains(myIndex) {
                                viewModel.savedUserDefaultHours.append(myIndex)
                            }
                            
                            self.didTapRow0 = true
                            print("viewModel.savedUserDefaultHours: \(viewModel.savedUserDefaultHours)")
                        }
                        else {
                            if let index = viewModel.savedUserDefaultHours.firstIndex(of: myIndex) {
                                viewModel.savedUserDefaultHours.remove(at: index)
                            }
                            print("viewModel.savedUserDefaultHours REMOVED VALUE: \(viewModel.savedUserDefaultHours)")
                            self.didTapRow0 = false
                        }
                    }, label: {
                        Text("12am")
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
                                .fill(didTapRow0 ? ColorConstants.Lime100 : ColorConstants.Gray101))
                            .padding(.leading, getRelativeWidth(0.0))
                            .padding(.top, getRelativeHeight(12.0))
                    })
                    // 1AM button
                    Button(action: {
                        let myIndex = index*24+1
                        print(index*24 + 1)
                        
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
                        Text("1am")
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
                    // 2AM button
                    Button(action: {
                        let myIndex = index*24+2
                        print(index*24 + 2)
                        
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
                        Text("2am")
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
                    // 3AM button
                    Button(action: {
                        let myIndex = index*24+3
                        print(index*24 + 3)
                        
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
                        Text("3am")
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
                    // 4AM button
                    Button(action: {
                        let myIndex = index*24+4
                        print(index*24 + 4)
                        
                        if (!didTapRow4) {
                            
                            // sanity check to make sure no duplicates exist
                            if !viewModel.savedUserDefaultHours.contains(myIndex) {
                                viewModel.savedUserDefaultHours.append(myIndex)
                            }
                            
                            self.didTapRow4 = true
                            print("viewModel.savedUserDefaultHours: \(viewModel.savedUserDefaultHours)")
                        }
                        else {
                            if let index = viewModel.savedUserDefaultHours.firstIndex(of: myIndex) {
                                viewModel.savedUserDefaultHours.remove(at: index)
                            }
                            print("viewModel.savedUserDefaultHours REMOVED VALUE: \(viewModel.savedUserDefaultHours)")
                            self.didTapRow4 = false
                        }
                    }, label: {
                        Text("4am")
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
                                .fill(didTapRow4 ? ColorConstants.Lime100 : ColorConstants.Gray101))
                            .padding(.leading, getRelativeWidth(0.0))
                            .padding(.top, getRelativeHeight(12.0))
                    })
                    // 5AM button
                    Button(action: {
                        let myIndex = index*24+5
                        print(index*24 + 5)
                        
                        if (!didTapRow5) {
                            
                            // sanity check to make sure no duplicates exist
                            if !viewModel.savedUserDefaultHours.contains(myIndex) {
                                viewModel.savedUserDefaultHours.append(myIndex)
                            }
                            
                            self.didTapRow5 = true
                            print("viewModel.savedUserDefaultHours: \(viewModel.savedUserDefaultHours)")
                        }
                        else {
                            if let index = viewModel.savedUserDefaultHours.firstIndex(of: myIndex) {
                                viewModel.savedUserDefaultHours.remove(at: index)
                            }
                            print("viewModel.savedUserDefaultHours REMOVED VALUE: \(viewModel.savedUserDefaultHours)")
                            self.didTapRow5 = false
                        }
                    }, label: {
                        Text("5am")
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
                                .fill(didTapRow5 ? ColorConstants.Lime100 : ColorConstants.Gray101))
                            .padding(.leading, getRelativeWidth(0.0))
                            .padding(.top, getRelativeHeight(12.0))
                    })
                    // 6AM button
                    Button(action: {
                        let myIndex = index*24+6
                        print(index*24 + 6)
                        
                        if (!didTapRow6) {
                            
                            // sanity check to make sure no duplicates exist
                            if !viewModel.savedUserDefaultHours.contains(myIndex) {
                                viewModel.savedUserDefaultHours.append(myIndex)
                            }
                            
                            self.didTapRow6 = true
                            print("viewModel.savedUserDefaultHours: \(viewModel.savedUserDefaultHours)")
                        }
                        else {
                            if let index = viewModel.savedUserDefaultHours.firstIndex(of: myIndex) {
                                viewModel.savedUserDefaultHours.remove(at: index)
                            }
                            print("viewModel.savedUserDefaultHours REMOVED VALUE: \(viewModel.savedUserDefaultHours)")
                            self.didTapRow6 = false
                        }
                    }, label: {
                        Text("6am")
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
                                .fill(didTapRow6 ? ColorConstants.Lime100 : ColorConstants.Gray101))
                            .padding(.leading, getRelativeWidth(0.0))
                            .padding(.top, getRelativeHeight(12.0))
                    })
                    // 7AM button
                    Button(action: {
                        let myIndex = index*24+7
                        print(index*24 + 7)
                        
                        if (!didTapRow7) {
                            
                            // sanity check to make sure no duplicates exist
                            if !viewModel.savedUserDefaultHours.contains(myIndex) {
                                viewModel.savedUserDefaultHours.append(myIndex)
                            }
                            
                            self.didTapRow7 = true
                            print("viewModel.savedUserDefaultHours: \(viewModel.savedUserDefaultHours)")
                        }
                        else {
                            if let index = viewModel.savedUserDefaultHours.firstIndex(of: myIndex) {
                                viewModel.savedUserDefaultHours.remove(at: index)
                            }
                            print("viewModel.savedUserDefaultHours REMOVED VALUE: \(viewModel.savedUserDefaultHours)")
                            self.didTapRow7 = false
                        }
                    }, label: {
                        Text("7am")
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
                                .fill(didTapRow7 ? ColorConstants.Lime100 : ColorConstants.Gray101))
                            .padding(.leading, getRelativeWidth(0.0))
                            .padding(.top, getRelativeHeight(12.0))
                    })
                }
                
                Group{
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
                }
                
                Group{
                
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
                        let myIndex = index*24 + 13
                        print(index*24 + 13)
                        
                        if (!didTapRow13) {
                            
                            // sanity check to make sure no duplicates exist
                            if !viewModel.savedUserDefaultHours.contains(myIndex) {
                                viewModel.savedUserDefaultHours.append(myIndex)
                            }
                            
                            self.didTapRow13 = true
                            print("viewModel.savedUserDefaultHours: \(viewModel.savedUserDefaultHours)")
                        }
                        else {
                            if let index = viewModel.savedUserDefaultHours.firstIndex(of: myIndex) {
                                viewModel.savedUserDefaultHours.remove(at: index)
                            }
                            print("viewModel.savedUserDefaultHours REMOVED VALUE: \(viewModel.savedUserDefaultHours)")
                            self.didTapRow13 = false
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
                                .fill(didTapRow13 ? ColorConstants.Lime100 : ColorConstants.Gray101))
                            .padding(.leading, getRelativeWidth(0.0))
                            .padding(.top, getRelativeHeight(12.0))
                    })
                    
                    // 2PM button
                    Button(action: {
                        let myIndex = index*24 + 14
                        print(index*24 + 14)
                        
                        if (!didTapRow14) {
                            
                            // sanity check to make sure no duplicates exist
                            if !viewModel.savedUserDefaultHours.contains(myIndex) {
                                viewModel.savedUserDefaultHours.append(myIndex)
                            }
                            
                            self.didTapRow14 = true
                            print("viewModel.savedUserDefaultHours: \(viewModel.savedUserDefaultHours)")
                        }
                        else {
                            if let index = viewModel.savedUserDefaultHours.firstIndex(of: myIndex) {
                                viewModel.savedUserDefaultHours.remove(at: index)
                            }
                            print("viewModel.savedUserDefaultHours REMOVED VALUE: \(viewModel.savedUserDefaultHours)")
                            self.didTapRow14 = false
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
                                .fill(didTapRow14 ? ColorConstants.Lime100 : ColorConstants.Gray101))
                            .padding(.leading, getRelativeWidth(0.0))
                            .padding(.top, getRelativeHeight(12.0))
                    })
                }
                
                Group{
                    
                    // 3PM button
                    Button(action: {
                        let myIndex = index*24 + 15
                        print(index*24 + 15)
                        
                        if (!didTapRow15) {
                            
                            // sanity check to make sure no duplicates exist
                            if !viewModel.savedUserDefaultHours.contains(myIndex) {
                                viewModel.savedUserDefaultHours.append(myIndex)
                            }
                            
                            self.didTapRow15 = true
                            print("viewModel.savedUserDefaultHours: \(viewModel.savedUserDefaultHours)")
                        }
                        else {
                            if let index = viewModel.savedUserDefaultHours.firstIndex(of: myIndex) {
                                viewModel.savedUserDefaultHours.remove(at: index)
                            }
                            print("viewModel.savedUserDefaultHours REMOVED VALUE: \(viewModel.savedUserDefaultHours)")
                            self.didTapRow15 = false
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
                                .fill(didTapRow15 ? ColorConstants.Lime100 : ColorConstants.Gray101))
                            .padding(.leading, getRelativeWidth(0.0))
                            .padding(.top, getRelativeHeight(12.0))
                    })
                    
                    // 4PM button
                    Button(action: {
                        let myIndex = index*24 + 16
                        print(index*24 + 16)
                        
                        if (!didTapRow16) {
                            
                            // sanity check to make sure no duplicates exist
                            if !viewModel.savedUserDefaultHours.contains(myIndex) {
                                viewModel.savedUserDefaultHours.append(myIndex)
                            }
                            
                            self.didTapRow16 = true
                            print("viewModel.savedUserDefaultHours: \(viewModel.savedUserDefaultHours)")
                        }
                        else {
                            if let index = viewModel.savedUserDefaultHours.firstIndex(of: myIndex) {
                                viewModel.savedUserDefaultHours.remove(at: index)
                            }
                            print("viewModel.savedUserDefaultHours REMOVED VALUE: \(viewModel.savedUserDefaultHours)")
                            self.didTapRow16 = false
                        }
                    }, label: {
                        Text("4pm")
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
                                .fill(didTapRow16 ? ColorConstants.Lime100 : ColorConstants.Gray101))
                            .padding(.leading, getRelativeWidth(0.0))
                            .padding(.top, getRelativeHeight(12.0))
                    })
                    // 5PM button
                    Button(action: {
                        let myIndex = index*24 + 17
                        print(index*24 + 17)
                        
                        if (!didTapRow17) {
                            
                            // sanity check to make sure no duplicates exist
                            if !viewModel.savedUserDefaultHours.contains(myIndex) {
                                viewModel.savedUserDefaultHours.append(myIndex)
                            }
                            
                            self.didTapRow17 = true
                            print("viewModel.savedUserDefaultHours: \(viewModel.savedUserDefaultHours)")
                        }
                        else {
                            if let index = viewModel.savedUserDefaultHours.firstIndex(of: myIndex) {
                                viewModel.savedUserDefaultHours.remove(at: index)
                            }
                            print("viewModel.savedUserDefaultHours REMOVED VALUE: \(viewModel.savedUserDefaultHours)")
                            self.didTapRow17 = false
                        }
                    }, label: {
                        Text("5pm")
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
                                .fill(didTapRow17 ? ColorConstants.Lime100 : ColorConstants.Gray101))
                            .padding(.leading, getRelativeWidth(0.0))
                            .padding(.top, getRelativeHeight(12.0))
                    })
                    // 6PM button
                    Button(action: {
                        let myIndex = index*24 + 18
                        print(index*24 + 18)
                        
                        if (!didTapRow18) {
                            
                            // sanity check to make sure no duplicates exist
                            if !viewModel.savedUserDefaultHours.contains(myIndex) {
                                viewModel.savedUserDefaultHours.append(myIndex)
                            }
                            
                            self.didTapRow18 = true
                            print("viewModel.savedUserDefaultHours: \(viewModel.savedUserDefaultHours)")
                        }
                        else {
                            if let index = viewModel.savedUserDefaultHours.firstIndex(of: myIndex) {
                                viewModel.savedUserDefaultHours.remove(at: index)
                            }
                            print("viewModel.savedUserDefaultHours REMOVED VALUE: \(viewModel.savedUserDefaultHours)")
                            self.didTapRow18 = false
                        }
                    }, label: {
                        Text("6pm")
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
                                .fill(didTapRow18 ? ColorConstants.Lime100 : ColorConstants.Gray101))
                            .padding(.leading, getRelativeWidth(0.0))
                            .padding(.top, getRelativeHeight(12.0))
                    })
                    // 7PM button
                    Button(action: {
                        let myIndex = index*24 + 19
                        print(index*24 + 19)
                        
                        if (!didTapRow19) {
                            
                            // sanity check to make sure no duplicates exist
                            if !viewModel.savedUserDefaultHours.contains(myIndex) {
                                viewModel.savedUserDefaultHours.append(myIndex)
                            }
                            
                            self.didTapRow19 = true
                            print("viewModel.savedUserDefaultHours: \(viewModel.savedUserDefaultHours)")
                        }
                        else {
                            if let index = viewModel.savedUserDefaultHours.firstIndex(of: myIndex) {
                                viewModel.savedUserDefaultHours.remove(at: index)
                            }
                            print("viewModel.savedUserDefaultHours REMOVED VALUE: \(viewModel.savedUserDefaultHours)")
                            self.didTapRow19 = false
                        }
                    }, label: {
                        Text("7pm")
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
                                .fill(didTapRow19 ? ColorConstants.Lime100 : ColorConstants.Gray101))
                            .padding(.leading, getRelativeWidth(0.0))
                            .padding(.top, getRelativeHeight(12.0))
                    })
                    // 8PM button
                    Button(action: {
                        let myIndex = index*24 + 20
                        print(index*24 + 20)
                        
                        if (!didTapRow20) {
                            
                            // sanity check to make sure no duplicates exist
                            if !viewModel.savedUserDefaultHours.contains(myIndex) {
                                viewModel.savedUserDefaultHours.append(myIndex)
                            }
                            
                            self.didTapRow20 = true
                            print("viewModel.savedUserDefaultHours: \(viewModel.savedUserDefaultHours)")
                        }
                        else {
                            if let index = viewModel.savedUserDefaultHours.firstIndex(of: myIndex) {
                                viewModel.savedUserDefaultHours.remove(at: index)
                            }
                            print("viewModel.savedUserDefaultHours REMOVED VALUE: \(viewModel.savedUserDefaultHours)")
                            self.didTapRow20 = false
                        }
                    }, label: {
                        Text("8pm")
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
                                .fill(didTapRow20 ? ColorConstants.Lime100 : ColorConstants.Gray101))
                            .padding(.leading, getRelativeWidth(0.0))
                            .padding(.top, getRelativeHeight(12.0))
                    })
                    // 9PM button
                    Button(action: {
                        let myIndex = index*24 + 21
                        print(index*24 + 21)
                        
                        if (!didTapRow21) {
                            
                            // sanity check to make sure no duplicates exist
                            if !viewModel.savedUserDefaultHours.contains(myIndex) {
                                viewModel.savedUserDefaultHours.append(myIndex)
                            }
                            
                            self.didTapRow21 = true
                            print("viewModel.savedUserDefaultHours: \(viewModel.savedUserDefaultHours)")
                        }
                        else {
                            if let index = viewModel.savedUserDefaultHours.firstIndex(of: myIndex) {
                                viewModel.savedUserDefaultHours.remove(at: index)
                            }
                            print("viewModel.savedUserDefaultHours REMOVED VALUE: \(viewModel.savedUserDefaultHours)")
                            self.didTapRow21 = false
                        }
                    }, label: {
                        Text("9pm")
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
                                .fill(didTapRow21 ? ColorConstants.Lime100 : ColorConstants.Gray101))
                            .padding(.leading, getRelativeWidth(0.0))
                            .padding(.top, getRelativeHeight(12.0))
                    })
                    // 10PM button
                    Button(action: {
                        let myIndex = index*24 + 22
                        print(index*24 + 22)
                        
                        if (!didTapRow22) {
                            
                            // sanity check to make sure no duplicates exist
                            if !viewModel.savedUserDefaultHours.contains(myIndex) {
                                viewModel.savedUserDefaultHours.append(myIndex)
                            }
                            
                            self.didTapRow22 = true
                            print("viewModel.savedUserDefaultHours: \(viewModel.savedUserDefaultHours)")
                        }
                        else {
                            if let index = viewModel.savedUserDefaultHours.firstIndex(of: myIndex) {
                                viewModel.savedUserDefaultHours.remove(at: index)
                            }
                            print("viewModel.savedUserDefaultHours REMOVED VALUE: \(viewModel.savedUserDefaultHours)")
                            self.didTapRow22 = false
                        }
                    }, label: {
                        Text("10pm")
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
                                .fill(didTapRow22 ? ColorConstants.Lime100 : ColorConstants.Gray101))
                            .padding(.leading, getRelativeWidth(0.0))
                            .padding(.top, getRelativeHeight(12.0))
                    })
                    // 11PM button
                    Button(action: {
                        let myIndex = index*24 + 23
                        print(index*24 + 23)
                        
                        if (!didTapRow23) {
                            
                            // sanity check to make sure no duplicates exist
                            if !viewModel.savedUserDefaultHours.contains(myIndex) {
                                viewModel.savedUserDefaultHours.append(myIndex)
                            }
                            
                            self.didTapRow23 = true
                            print("viewModel.savedUserDefaultHours: \(viewModel.savedUserDefaultHours)")
                        }
                        else {
                            if let index = viewModel.savedUserDefaultHours.firstIndex(of: myIndex) {
                                viewModel.savedUserDefaultHours.remove(at: index)
                            }
                            print("viewModel.savedUserDefaultHours REMOVED VALUE: \(viewModel.savedUserDefaultHours)")
                            self.didTapRow23 = false
                        }
                    }, label: {
                        Text("11pm")
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
                                .fill(didTapRow23 ? ColorConstants.Lime100 : ColorConstants.Gray101))
                            .padding(.leading, getRelativeWidth(0.0))
                            .padding(.top, getRelativeHeight(12.0))
                    })
                }
            }
            
        }
        .frame(width: getRelativeWidth(75), alignment: .center)
        
    }
}
