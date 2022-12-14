//  CreatorConfirmTimeCellViewl.swift
//  uFree
//
//  Created by Leung Wai Liu on 12/3/22.
//
import SwiftUI

struct CreatorConfirmTimeCellView: View {
    //COLORs
    //NSCHANGES
    @EnvironmentObject var viewModel: AuthenticationViewModel
    
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
        
    @State private var didTapRow0PrevColor: Color = ColorConstants.Gray101
    @State private var didTapRow1PrevColor: Color = ColorConstants.Gray101
    @State private var didTapRow2PrevColor: Color = ColorConstants.Gray101
    @State private var didTapRow3PrevColor: Color = ColorConstants.Gray101
    @State private var didTapRow4PrevColor: Color = ColorConstants.Gray101
    @State private var didTapRow5PrevColor: Color = ColorConstants.Gray101
    @State private var didTapRow6PrevColor: Color = ColorConstants.Gray101
    @State private var didTapRow7PrevColor: Color = ColorConstants.Gray101
    @State private var didTapRow8PrevColor: Color = ColorConstants.Gray101
    @State private var didTapRow9PrevColor: Color = ColorConstants.Gray101
    @State private var didTapRow10PrevColor: Color = ColorConstants.Gray101
    @State private var didTapRow11PrevColor: Color = ColorConstants.Gray101
    @State private var didTapRow12PrevColor: Color = ColorConstants.Gray101
    @State private var didTapRow13PrevColor: Color = ColorConstants.Gray101
    @State private var didTapRow14PrevColor: Color = ColorConstants.Gray101
    @State private var didTapRow15PrevColor: Color = ColorConstants.Gray101
    @State private var didTapRow16PrevColor: Color = ColorConstants.Gray101
    @State private var didTapRow17PrevColor: Color = ColorConstants.Gray101
    @State private var didTapRow18PrevColor: Color = ColorConstants.Gray101
    @State private var didTapRow19PrevColor: Color = ColorConstants.Gray101
    @State private var didTapRow20PrevColor: Color = ColorConstants.Gray101
    @State private var didTapRow21PrevColor: Color = ColorConstants.Gray101
    @State private var didTapRow22PrevColor: Color = ColorConstants.Gray101
    @State private var didTapRow23PrevColor: Color = ColorConstants.Gray101
    
   
    var index: Int!
    var daysOfWeek: [String] = ["Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"]
    var dayInString: String!
    var currentCellIndex: Int!
    var previousCellColor: ColorConstants!
    
    
    init(index: Int) {
        self.index = index
        self.dayInString = daysOfWeek[self.index]
        
    }
    
    
    
    var body: some View {
        
        ScrollView(.vertical, showsIndicators: true) {

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
                
                Group {
                    // 0AM button
                    Button(action: {
                        let myIndex = index*24+0
                        print(index*24 + 0)
                        
                        viewModel.finalizedHour = myIndex

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
                                .fill(didTapRow0 ? ColorConstants.BlueA200 : didTapRow0PrevColor))
                            .padding(.leading, getRelativeWidth(0.0))
                            .padding(.top, getRelativeHeight(12.0))
                    })


                    // 1AM button
                    Button(action: {
                        let myIndex = index*24+1
                        print(index*24 + 1)
                        
                        viewModel.finalizedHour = myIndex

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
                                .fill(didTapRow1 ? ColorConstants.BlueA200 : didTapRow1PrevColor))
                            .padding(.leading, getRelativeWidth(0.0))
                            .padding(.top, getRelativeHeight(12.0))
                    })

                    // 2AM button
                    Button(action: {
                        let myIndex = index*24+2
                        print(index*24 + 2)
                        
                        viewModel.finalizedHour = myIndex

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
                                .fill(didTapRow2 ? ColorConstants.BlueA200 : didTapRow2PrevColor))
                            .padding(.leading, getRelativeWidth(0.0))
                            .padding(.top, getRelativeHeight(12.0))
                    })

                    // 3AM button
                    Button(action: {
                        let myIndex = index*24+3
                        print(index*24 + 3)
                        
                        viewModel.finalizedHour = myIndex

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
                                .fill(didTapRow3 ? ColorConstants.BlueA200 : didTapRow3PrevColor))
                            .padding(.leading, getRelativeWidth(0.0))
                            .padding(.top, getRelativeHeight(12.0))
                    })

                    // 4AM button
                    Button(action: {
                        let myIndex = index*24+4
                        print(index*24 + 4)
                        
                        viewModel.finalizedHour = myIndex

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
                                .fill(didTapRow4 ? ColorConstants.BlueA200 : didTapRow4PrevColor))
                            .padding(.leading, getRelativeWidth(0.0))
                            .padding(.top, getRelativeHeight(12.0))
                    })

                    // 5AM button
                    Button(action: {
                        let myIndex = index*24+5
                        print(index*24 + 5)
                        
                        viewModel.finalizedHour = myIndex

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
                                .fill(didTapRow5 ? ColorConstants.BlueA200 : didTapRow5PrevColor))
                            .padding(.leading, getRelativeWidth(0.0))
                            .padding(.top, getRelativeHeight(12.0))
                    })


                    // 6AM button
                    Button(action: {
                        let myIndex = index*24+6
                        print(index*24 + 6)
                        
                        viewModel.finalizedHour = myIndex

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
                                .fill(didTapRow6 ? ColorConstants.BlueA200 : didTapRow6PrevColor))
                            .padding(.leading, getRelativeWidth(0.0))
                            .padding(.top, getRelativeHeight(12.0))
                    })

                    // 7AM button
                    Button(action: {
                        let myIndex = index*24+7
                        print(index*24 + 7)
                        
                        viewModel.finalizedHour = myIndex

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
                                .fill(didTapRow7 ? ColorConstants.BlueA200 : didTapRow7PrevColor))
                            .padding(.leading, getRelativeWidth(0.0))
                            .padding(.top, getRelativeHeight(12.0))
                    })
                }

                Group {
                    // 8AM button
                    Button(action: {
                        let myIndex = index*24+8
                        print(index*24 + 8)
                        
                        viewModel.finalizedHour = myIndex

                    }, label: {
                        Text("8am")
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
                                .fill(didTapRow8 ? ColorConstants.BlueA200 : didTapRow8PrevColor))
                            .padding(.leading, getRelativeWidth(0.0))
                            .padding(.top, getRelativeHeight(12.0))
                    })

                    // 9AM button
                    Button(action: {
                        let myIndex = index*24+9
                        print(index*24 + 9)
                        
                        viewModel.finalizedHour = myIndex

                    }, label: {
                        Text("9am")
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
                                .fill(didTapRow9 ? ColorConstants.BlueA200 : didTapRow9PrevColor))
                            .padding(.leading, getRelativeWidth(0.0))
                            .padding(.top, getRelativeHeight(12.0))
                    })

                    // 10AM button
                    Button(action: {
                        let myIndex = index*24+10
                        print(index*24 + 10)
                        
                        viewModel.finalizedHour = myIndex

                    }, label: {
                        Text("10am")
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
                                .fill(didTapRow10 ? ColorConstants.BlueA200 : didTapRow10PrevColor))
                            .padding(.leading, getRelativeWidth(0.0))
                            .padding(.top, getRelativeHeight(12.0))
                    })

                    // 11AM button
                    Button(action: {
                        let myIndex = index*24+11
                        print(index*24 + 11)
                        
                        viewModel.finalizedHour = myIndex

                    }, label: {
                        Text("11am")
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
                                .fill(didTapRow11 ? ColorConstants.BlueA200 : didTapRow11PrevColor))
                            .padding(.leading, getRelativeWidth(0.0))
                            .padding(.top, getRelativeHeight(12.0))
                    })

        // 12PM button
                    Button(action: {
                        let myIndex = index*24+12
                        print(index*24 + 12)
                        
                        viewModel.finalizedHour = myIndex

                    }, label: {
                        Text("12pm")
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
                                .fill(didTapRow12 ? ColorConstants.BlueA200 : didTapRow12PrevColor))
                            .padding(.leading, getRelativeWidth(0.0))
                            .padding(.top, getRelativeHeight(12.0))
                    })

        // 1PM button
                    Button(action: {
                        let myIndex = index*24+13
                        print(index*24 + 13)
                        
                        viewModel.finalizedHour = myIndex

                    }, label: {
                        Text("1pm")
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
                                .fill(didTapRow13 ? ColorConstants.BlueA200 : didTapRow13PrevColor))
                            .padding(.leading, getRelativeWidth(0.0))
                            .padding(.top, getRelativeHeight(12.0))
                    })

        // 2PM button
                    Button(action: {
                        let myIndex = index*24+14
                        print(index*24 + 14)
                        
                        viewModel.finalizedHour = myIndex

                    }, label: {
                        Text("2pm")
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
                                .fill(didTapRow14 ? ColorConstants.BlueA200 : didTapRow14PrevColor))
                            .padding(.leading, getRelativeWidth(0.0))
                            .padding(.top, getRelativeHeight(12.0))
                    })

        // 3PM button
                    Button(action: {
                        let myIndex = index*24+15
                        print(index*24 + 15)
                        
                        viewModel.finalizedHour = myIndex

                    }, label: {
                        Text("3pm")
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
                                .fill(didTapRow15 ? ColorConstants.BlueA200 : didTapRow15PrevColor))
                            .padding(.leading, getRelativeWidth(0.0))
                            .padding(.top, getRelativeHeight(12.0))
                    })
                }

                Group {
                    
        // 4PM button
                    Button(action: {
                        let myIndex = index*24+16
                        print(index*24 + 16)
                        
                        viewModel.finalizedHour = myIndex

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
                                .fill(didTapRow16 ? ColorConstants.BlueA200 : didTapRow16PrevColor))
                            .padding(.leading, getRelativeWidth(0.0))
                            .padding(.top, getRelativeHeight(12.0))
                    })


        // 5PM button
                    Button(action: {
                        let myIndex = index*24+17
                        print(index*24 + 17)
                        
                        viewModel.finalizedHour = myIndex

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
                                .fill(didTapRow17 ? ColorConstants.BlueA200 : didTapRow17PrevColor))
                            .padding(.leading, getRelativeWidth(0.0))
                            .padding(.top, getRelativeHeight(12.0))
                    })


        // 6PM button
                    Button(action: {
                        let myIndex = index*24+18
                        print(index*24 + 18)
                        
                        viewModel.finalizedHour = myIndex

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
                                .fill(didTapRow18 ? ColorConstants.BlueA200 : didTapRow18PrevColor))
                            .padding(.leading, getRelativeWidth(0.0))
                            .padding(.top, getRelativeHeight(12.0))
                    })


        // 7PM button
                    Button(action: {
                        let myIndex = index*24+19
                        print(index*24 + 19)
                        
                        viewModel.finalizedHour = myIndex

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
                                .fill(didTapRow19 ? ColorConstants.BlueA200 : didTapRow19PrevColor))
                            .padding(.leading, getRelativeWidth(0.0))
                            .padding(.top, getRelativeHeight(12.0))
                    })


        // 8PM button
                    Button(action: {
                        let myIndex = index*24+20
                        print(index*24 + 20)
                        
                        viewModel.finalizedHour = myIndex

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
                                .fill(didTapRow20 ? ColorConstants.BlueA200 : didTapRow20PrevColor))
                            .padding(.leading, getRelativeWidth(0.0))
                            .padding(.top, getRelativeHeight(12.0))
                    })


        // 9PM button
                    Button(action: {
                        let myIndex = index*24+21
                        print(index*24 + 21)
                        
                        viewModel.finalizedHour = myIndex

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
                                .fill(didTapRow21 ? ColorConstants.BlueA200 : didTapRow21PrevColor))
                            .padding(.leading, getRelativeWidth(0.0))
                            .padding(.top, getRelativeHeight(12.0))
                    })

        // 10PM button
                    Button(action: {
                        let myIndex = index*24+22
                        print(index*24 + 22)
                        
                        viewModel.finalizedHour = myIndex

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
                                .fill(didTapRow22 ? ColorConstants.BlueA200 : didTapRow22PrevColor))
                            .padding(.leading, getRelativeWidth(0.0))
                            .padding(.top, getRelativeHeight(12.0))
                    })

        // 11PM button
                    Button(action: {
                        let myIndex = index*24+23
                        print(index*24 + 23)
                        
                        viewModel.finalizedHour = myIndex

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
                                .fill(didTapRow23 ? ColorConstants.BlueA200 : didTapRow23PrevColor))
                            .padding(.leading, getRelativeWidth(0.0))
                            .padding(.top, getRelativeHeight(12.0))
                    })
                }

                
            }
            .frame(width: getRelativeWidth(75), alignment: .center)
            .onAppear{
                
                didTapRow0PrevColor = viewModel.inputCommonHours.contains(index*24+0) ? ColorConstants.Lime100 : ColorConstants.Gray101
                didTapRow1PrevColor = viewModel.inputCommonHours.contains(index*24+1) ? ColorConstants.Lime100 : ColorConstants.Gray101
                didTapRow2PrevColor = viewModel.inputCommonHours.contains(index*24+2) ? ColorConstants.Lime100 : ColorConstants.Gray101
                didTapRow3PrevColor = viewModel.inputCommonHours.contains(index*24+3) ? ColorConstants.Lime100 : ColorConstants.Gray101
                didTapRow4PrevColor = viewModel.inputCommonHours.contains(index*24+4) ? ColorConstants.Lime100 : ColorConstants.Gray101
                didTapRow5PrevColor = viewModel.inputCommonHours.contains(index*24+5) ? ColorConstants.Lime100 : ColorConstants.Gray101
                didTapRow6PrevColor = viewModel.inputCommonHours.contains(index*24+6) ? ColorConstants.Lime100 : ColorConstants.Gray101
                didTapRow7PrevColor = viewModel.inputCommonHours.contains(index*24+7) ? ColorConstants.Lime100 : ColorConstants.Gray101
                didTapRow8PrevColor = viewModel.inputCommonHours.contains(index*24+8) ? ColorConstants.Lime100 : ColorConstants.Gray101
                didTapRow9PrevColor = viewModel.inputCommonHours.contains(index*24+9) ? ColorConstants.Lime100 : ColorConstants.Gray101
                didTapRow10PrevColor = viewModel.inputCommonHours.contains(index*24+10) ? ColorConstants.Lime100 : ColorConstants.Gray101
                didTapRow11PrevColor = viewModel.inputCommonHours.contains(index*24+11) ? ColorConstants.Lime100 : ColorConstants.Gray101
                didTapRow12PrevColor = viewModel.inputCommonHours.contains(index*24+12) ? ColorConstants.Lime100 : ColorConstants.Gray101
                didTapRow13PrevColor = viewModel.inputCommonHours.contains(index*24+13) ? ColorConstants.Lime100 : ColorConstants.Gray101
                didTapRow14PrevColor = viewModel.inputCommonHours.contains(index*24+14) ? ColorConstants.Lime100 : ColorConstants.Gray101
                didTapRow15PrevColor = viewModel.inputCommonHours.contains(index*24+15) ? ColorConstants.Lime100 : ColorConstants.Gray101
                didTapRow16PrevColor = viewModel.inputCommonHours.contains(index*24+16) ? ColorConstants.Lime100 : ColorConstants.Gray101
                didTapRow17PrevColor = viewModel.inputCommonHours.contains(index*24+17) ? ColorConstants.Lime100 : ColorConstants.Gray101
                didTapRow18PrevColor = viewModel.inputCommonHours.contains(index*24+18) ? ColorConstants.Lime100 : ColorConstants.Gray101
                didTapRow19PrevColor = viewModel.inputCommonHours.contains(index*24+19) ? ColorConstants.Lime100 : ColorConstants.Gray101
                didTapRow20PrevColor = viewModel.inputCommonHours.contains(index*24+20) ? ColorConstants.Lime100 : ColorConstants.Gray101
                didTapRow21PrevColor = viewModel.inputCommonHours.contains(index*24+21) ? ColorConstants.Lime100 : ColorConstants.Gray101
                didTapRow22PrevColor = viewModel.inputCommonHours.contains(index*24+22) ? ColorConstants.Lime100 : ColorConstants.Gray101
                didTapRow23PrevColor = viewModel.inputCommonHours.contains(index*24+23) ? ColorConstants.Lime100 : ColorConstants.Gray101
        
            }
            .onChange(of: viewModel.finalizedHour, perform: { _ in
                didTapRow0 = viewModel.finalizedHour == index*24 + 0
                didTapRow1 = viewModel.finalizedHour == index*24 + 1
                didTapRow2 = viewModel.finalizedHour == index*24 + 2
                didTapRow3 = viewModel.finalizedHour == index*24 + 3
                didTapRow4 = viewModel.finalizedHour == index*24 + 4
                didTapRow5 = viewModel.finalizedHour == index*24 + 5
                didTapRow6 = viewModel.finalizedHour == index*24 + 6
                didTapRow7 = viewModel.finalizedHour == index*24 + 7
                didTapRow8 = viewModel.finalizedHour == index*24 + 8
                didTapRow9 = viewModel.finalizedHour == index*24 + 9
                didTapRow10 = viewModel.finalizedHour == index*24 + 10
                didTapRow11 = viewModel.finalizedHour == index*24 + 11
                didTapRow12 = viewModel.finalizedHour == index*24 + 12
                didTapRow13 = viewModel.finalizedHour == index*24 + 13
                didTapRow14 = viewModel.finalizedHour == index*24 + 14
                didTapRow15 = viewModel.finalizedHour == index*24 + 15
                didTapRow16 = viewModel.finalizedHour == index*24 + 16
                didTapRow17 = viewModel.finalizedHour == index*24 + 17
                didTapRow18 = viewModel.finalizedHour == index*24 + 18
                didTapRow19 = viewModel.finalizedHour == index*24 + 19
                didTapRow20 = viewModel.finalizedHour == index*24 + 20
                didTapRow21 = viewModel.finalizedHour == index*24 + 21
                didTapRow22 = viewModel.finalizedHour == index*24 + 22
                didTapRow23 = viewModel.finalizedHour == index*24 + 23
            })
        }
    }
}


struct CreatorConfirmTimeCellView_Previews: PreviewProvider {
    static var previews: some View {
        CreatorConfirmTimeCellView(index: 0).environmentObject(AuthenticationViewModel())
    }
}
