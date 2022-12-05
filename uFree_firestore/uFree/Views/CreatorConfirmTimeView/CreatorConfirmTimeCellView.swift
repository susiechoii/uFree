//
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
    
    @State private var didTapRow8:Bool = false
    @State private var didTapRow9:Bool = false
    @State private var didTapRow10:Bool = false
    @State private var didTapRow11:Bool = false
    @State private var didTapRow12:Bool = false
    @State private var didTapRow1:Bool = false
    @State private var didTapRow2:Bool = false
    @State private var didTapRow3:Bool = false
    
    @State private var didTapRow8PrevColor: Color = ColorConstants.Gray101
    @State private var didTapRow9PrevColor: Color = ColorConstants.Gray101
    @State private var didTapRow10PrevColor: Color = ColorConstants.Gray101
    @State private var didTapRow11PrevColor: Color = ColorConstants.Gray101
    @State private var didTapRow12PrevColor: Color = ColorConstants.Gray101
    @State private var didTapRow1PrevColor: Color = ColorConstants.Gray101
    @State private var didTapRow2PrevColor: Color = ColorConstants.Gray101
    @State private var didTapRow3PrevColor: Color = ColorConstants.Gray101
    
   
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
                
                viewModel.finalizedHour = myIndex

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
                        .fill(didTapRow1 ? ColorConstants.BlueA200 : didTapRow1PrevColor))
                    .padding(.leading, getRelativeWidth(0.0))
                    .padding(.top, getRelativeHeight(12.0))
            })
            
            // 2PM button
            Button(action: {
                let myIndex = index*24+14
                print(index*24 + 14)
                
                viewModel.finalizedHour = myIndex

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
                        .fill(didTapRow2 ? ColorConstants.BlueA200 : didTapRow2PrevColor))
                    .padding(.leading, getRelativeWidth(0.0))
                    .padding(.top, getRelativeHeight(12.0))
            })
            
            // 3PM button
            Button(action: {
                let myIndex = index*24+15
                print(index*24 + 15)
                
                viewModel.finalizedHour = myIndex

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
                        .fill(didTapRow3 ? ColorConstants.BlueA200 : didTapRow3PrevColor))
                    .padding(.leading, getRelativeWidth(0.0))
                    .padding(.top, getRelativeHeight(12.0))
            })
            
        }
        .frame(width: getRelativeWidth(75), alignment: .center)
        .onAppear{
            
            didTapRow8PrevColor = viewModel.inputCommonHours.contains(index*24+8) ? ColorConstants.Lime100 : ColorConstants.Gray101
            didTapRow9PrevColor = viewModel.inputCommonHours.contains(index*24+9) ? ColorConstants.Lime100 : ColorConstants.Gray101
            didTapRow10PrevColor = viewModel.inputCommonHours.contains(index*24+10) ? ColorConstants.Lime100 : ColorConstants.Gray101
            didTapRow11PrevColor = viewModel.inputCommonHours.contains(index*24+11) ? ColorConstants.Lime100 : ColorConstants.Gray101
            didTapRow12PrevColor = viewModel.inputCommonHours.contains(index*24+12) ? ColorConstants.Lime100 : ColorConstants.Gray101
            didTapRow1PrevColor = viewModel.inputCommonHours.contains(index*24+13) ? ColorConstants.Lime100 : ColorConstants.Gray101
            didTapRow2PrevColor = viewModel.inputCommonHours.contains(index*24+14) ? ColorConstants.Lime100 : ColorConstants.Gray101
            didTapRow3PrevColor = viewModel.inputCommonHours.contains(index*24+15) ? ColorConstants.Lime100 : ColorConstants.Gray101
       
        }
        .onChange(of: viewModel.finalizedHour, perform: { _ in
            didTapRow8 = viewModel.finalizedHour == index*24 + 8
            didTapRow9 = viewModel.finalizedHour == index*24 + 9
            didTapRow10 = viewModel.finalizedHour == index*24 + 10
            didTapRow11 = viewModel.finalizedHour == index*24 + 11
            didTapRow12 = viewModel.finalizedHour == index*24 + 12
            didTapRow1 = viewModel.finalizedHour == index*24 + 13
            didTapRow2 = viewModel.finalizedHour == index*24 + 14
            didTapRow3 = viewModel.finalizedHour == index*24 + 15
        })
        
    }
}


struct CreatorConfirmTimeCellView_Previews: PreviewProvider {
    static var previews: some View {
        CreatorConfirmTimeCellView(index: 0).environmentObject(AuthenticationViewModel())
    }
}
