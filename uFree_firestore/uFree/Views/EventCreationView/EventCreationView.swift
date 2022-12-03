import SwiftUI
import Firebase

struct EventCreationView: View {
    @StateObject var eventCreationViewModel = EventCreationViewModel()
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @EnvironmentObject var viewModel: AuthenticationViewModel
    
    @State var userEmailInput = ""
    
    //User input variables
    @State var eventTitle = ""
    @State var specificDates = ""
    @State var selectedDuration: Int = 1
    @State var invitees = ""
    @State var description = ""
    @State var date = Date.now
    
    private func addNewEventToFirebase() {
        Task {
            if await viewModel.addNewEventToFirestore() == true {
                self.presentationMode.wrappedValue.dismiss()
            }
        }
    }
    
    var body: some View {
        NavigationView{
            
            VStack (alignment: .center, spacing: 0){
                
                // TOP HEADER BAR
                ZStack(alignment: .topLeading) {
                    
                    // WHEN ARE YOU FREE TEXT
                    VStack (alignment: .leading, spacing: 0){
                        Text("Confirm an")
                            .font(FontScheme.kInterRegular(size: getRelativeHeight(25)))
                            .foregroundColor(ColorConstants.Bluegray900)
                            .minimumScaleFactor(0.5)
                            .multilineTextAlignment(.leading)
                            .frame(width: getRelativeWidth(108.0),
                                   height: getRelativeHeight(25), alignment: .leading)
                        Text("Optimal Time")
                            .font(FontScheme.kInterRegular(size: getRelativeHeight(30)))
                            .fontWeight(.bold)
                            .foregroundColor(ColorConstants.Bluegray900)
                            .minimumScaleFactor(0.5)
                            .multilineTextAlignment(.leading)
                            .frame(width: getRelativeWidth(250.0),
                                   height: getRelativeHeight(40), alignment: .leading)
                            .padding(.top, getRelativeHeight(-5))
                        Text("Choose an alternative date.")
                            .font(FontScheme.kInterRegular(size: getRelativeHeight(15)))
                        
                            .foregroundColor(ColorConstants.Bluegray900)
                            .minimumScaleFactor(0.5)
                            .multilineTextAlignment(.leading)
                            .frame(width: getRelativeWidth(200),
                                   height: getRelativeHeight(20), alignment: .leading)
                            .padding(.top, getRelativeHeight(7))
                    }
                    .frame(width: getRelativeWidth(250),
                           height: getRelativeHeight(100), alignment: .leading)
                    .padding(.leading, getRelativeWidth(20))
                    .padding(.top, getRelativeHeight(60))
                    
                    Image("img_group6")
                        .resizable()
                        .frame(width: getRelativeWidth(271.0),
                               height: getRelativeHeight(204.0), alignment: .center)
                        .scaledToFit()
                        .clipped()
                        .padding(.bottom, getRelativeHeight(10))
                        .padding(.leading, getRelativeWidth(140))
                }
                .frame(width: UIScreen.main.bounds.width,
                       height: getRelativeHeight(150.0), alignment: .leading)
                
                
                ScrollView(.vertical, showsIndicators: true){
                    VStack(alignment: .leading){
                        Text("Select Date")
                            .fontWeight(.medium)
                            .font(FontScheme.kInterRegular(size: getRelativeHeight(20)))
                            .frame(width: 250, height: 12, alignment: .leading)
                            .lineSpacing(26)
                        
                        //original select date bubbles
                        
                        //                    ScrollView(.horizontal, showsIndicators: false){
                        //                        HStack{
                        //                            ZStack {
                        //                                RoundedRectangle(cornerRadius: 10)
                        //                                    .fill(Color(#colorLiteral(red: 0.9450980424880981, green: 0.9607843160629272, blue: 0.9764705896377563, alpha: 1)))
                        //                                //Fri
                        //                                Text(StringConstants.kLblFri).font(FontScheme
                        //                                    .kInterRegular(size: getRelativeHeight(12.0))).foregroundColor(Color(#colorLiteral(red: 0.29, green: 0.29, blue: 0.29, alpha: 1))).tracking(0.3).multilineTextAlignment(.center).frame(width: 24, height: 14)
                        //                                    .lineSpacing(26)
                        //                                //22
                        //                                Text(StringConstants.kLbl22).font(FontScheme.kInterSemiBold(size: getRelativeHeight(18.0))).foregroundColor(Color(#colorLiteral(red: 0.29, green: 0.29, blue: 0.29, alpha: 1))).tracking(0.3).multilineTextAlignment(.center).frame(width: 24, height: 24)
                        //                                    .lineSpacing(26)
                        //                            }
                        //                            .frame(width: 73, height: 120)
                        //                            ZStack {
                        //                                RoundedRectangle(cornerRadius: 10)
                        //                                    .fill(Color(#colorLiteral(red: 0.9450980424880981, green: 0.9607843160629272, blue: 0.9764705896377563, alpha: 1)))
                        //                                //Sat
                        //                                Text(StringConstants.kLblSat).font(FontScheme
                        //                                    .kInterRegular(size: getRelativeHeight(12.0))).foregroundColor(Color(#colorLiteral(red: 0.29, green: 0.29, blue: 0.29, alpha: 1))).tracking(0.3).multilineTextAlignment(.center).frame(width: 24, height: 14)
                        //                                    .lineSpacing(26)
                        //                                //23
                        //                                Text(StringConstants.kLbl23).font(FontScheme.kInterSemiBold(size: getRelativeHeight(18.0))).foregroundColor(Color(#colorLiteral(red: 0.29, green: 0.29, blue: 0.29, alpha: 1))).tracking(0.3).multilineTextAlignment(.center).frame(width: 24, height: 24)
                        //                                    .lineSpacing(26)
                        //                            }
                        //                            .frame(width: 73, height: 120)
                        //                            ZStack {
                        //                                RoundedRectangle(cornerRadius: 10)
                        //                                    .fill(Color(#colorLiteral(red: 0.9450980424880981, green: 0.9607843160629272, blue: 0.9764705896377563, alpha: 1)))
                        //                            }
                        //                            .frame(width: 73, height: 120)
                        //                            ZStack {
                        //                                RoundedRectangle(cornerRadius: 10)
                        //                                    .fill(Color(#colorLiteral(red: 0.9450980424880981, green: 0.9607843160629272, blue: 0.9764705896377563, alpha: 1)))
                        //                            }
                        //                            .frame(width: 73, height: 120)
                        //                            ZStack {
                        //                                RoundedRectangle(cornerRadius: 10)
                        //                                    .fill(Color(#colorLiteral(red: 0.9450980424880981, green: 0.9607843160629272, blue: 0.9764705896377563, alpha: 1)))
                        //                            }
                        //                            .frame(width: 73, height: 120)
                        //                            ZStack {
                        //                                RoundedRectangle(cornerRadius: 10)
                        //                                    .fill(Color(#colorLiteral(red: 0.9450980424880981, green: 0.9607843160629272, blue: 0.9764705896377563, alpha: 1)))
                        //                            }
                        //                            .frame(width: 73, height: 120)
                        //                            ZStack {
                        //                                RoundedRectangle(cornerRadius: 10)
                        //                                    .fill(Color(#colorLiteral(red: 0.9450980424880981, green: 0.9607843160629272, blue: 0.9764705896377563, alpha: 1)))
                        //                            }
                        //                            .frame(width: 73, height: 120)
                        //                        }
                        //                    }

//                        Apple DatePicker
                        DatePicker("select date", selection: $date, displayedComponents: [.date])
                        //                        .padding(15.0)
                        //                        .frame(width: -1.0)
                            .datePickerStyle(GraphicalDatePickerStyle())
                            .frame(width: 330, alignment: .center)
                            .padding(.leading, 10)
                        
                        Text(StringConstants.kMsgMeetingDuratio)
                            .fontWeight(.medium)
                            .font(FontScheme.kInterRegular(size: getRelativeHeight(20)))
                            .frame(width: 250, height: 12, alignment: .leading)
                            .lineSpacing(26).padding(.top, 10)
                        
                        //                        ZStack {
                        //                            ZStack {
                        //                                Text(StringConstants.kMsgYourAvailabili)
                        //                                .fontWeight(.bold)
                        //                                .font(.subheadline)
                        //                                .multilineTextAlignment(.center)
                        //                                .lineSpacing(36)
                        //                            }
                        //                            .frame(width: 350, height: 35)
                        //                            .background(Color(red: 0.46, green: 0.66, blue: 1))
                        //                            .cornerRadius(10)
                        //                            .offset(x: 0, y: 42)
                        //                            .frame(width: 350, height: 35)
                        
                        //                            ZStack {
                        //                                Text(StringConstants.kLbl2Hours)
                        //                                .font(.callout)
                        //                                .frame(alignment: .leading)
                        //                                .lineSpacing(24)
                        //
                        //                                RoundedRectangle(cornerRadius: 8)
                        //                                .fill(Color(red: 0.50, green: 0.23, blue: 0.27, opacity: 0.50))
                        //                                .offset(x: 141.36, y: 0)
                        //                                .frame(width: 23.14, height: 17)
                        //                            }
                        
                        HStack{
                            
                            // Select Duration
                            
                            Picker(StringConstants.kLbl2Hours,
                                   selection: $selectedDuration) {
                                ForEach(0..<25,
                                        id: \.self) { value in
                                    Text(String(value)).tag(value as Int?)
                                }
                            }
                                   .foregroundColor(ColorConstants.Gray700)
                                   .font(FontScheme.kInterRegular(size: getRelativeHeight(20)))
                                   .pickerStyle(MenuPickerStyle())
                                   .frame(width: 50, alignment: .center)
                            // .border(.black)
                                   .overlay(
                                    RoundedRectangle(cornerRadius: 8)
                                        .stroke(.gray, lineWidth: 2)
                                   )
                            
                            Text("Hour(s)")
                                .fontWeight(.medium)
                                .font(FontScheme.kInterRegular(size: getRelativeHeight(18)))
                                .frame(width: 152, height: 12, alignment: .leading)
                                .lineSpacing(26)
                        }.lineSpacing(26).padding(.top, 10)
                        
                        // Set your availability - SHOULD CALL CALENDAR PAGE
                        // which is OptimalTimeView now
                        
                        Button(action: {}, label: {
//                            HStack(spacing: 0) {
                                Text(StringConstants.kMsgYourAvailabili)
                                    .font(FontScheme.kInterBold(size: getRelativeHeight(25.0)))
                                    .fontWeight(.bold)
                                    .padding(.horizontal, getRelativeWidth(30.0))
                                    .padding(.vertical, getRelativeHeight(15.0))
                                    .foregroundColor(ColorConstants.Gray101)
                                    .minimumScaleFactor(0.5)
                                    .multilineTextAlignment(.center)
                                    .frame(width: getRelativeWidth(330.0),
                                           height: getRelativeHeight(35.0), alignment: .center)
                                    .background(RoundedCorners(topLeft: 10.0, topRight: 10.0,
                                                               bottomLeft: 10.0, bottomRight: 10.0)
                                        .fill(ColorConstants.BlueA100))
                                    .padding(.top, getRelativeHeight(10.0))
                                    .padding(.horizontal, getRelativeWidth(21.0))
                                    .padding(.bottom, getRelativeWidth(10.0))
//                            }
                        })
                        .frame(width: 350, height: 40)
                        .background(Color(red: 0.95, green: 0.96, blue: 0.98))
                        .cornerRadius(10)
                        .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.12), radius: 4)
                        .offset(x: 0, y: 0)
                        .lineSpacing(26).padding(.top, 30)
                        
                        Text(StringConstants.kLblInvitees)
                            .fontWeight(.medium)
                            .font(FontScheme.kInterRegular(size: getRelativeHeight(20)))
                            .frame(width: 200, height: 11.42, alignment: .leading)
                            .lineSpacing(26).padding(.top, 20)
                        //                    ZStack(alignment: .leading) {
                        HStack {
                            TextField(StringConstants.kLblEmail,
                                      text: $viewModel.inputInvitee)
                            .font(FontScheme
                                .kInterRegular(size: getRelativeHeight(12.0)))
                            .foregroundColor(ColorConstants.Black900Cc)
                            .padding()
                            .keyboardType(.emailAddress)
                            
                            
                        }
                        //                            .onChange(of: eventCreationViewModel
                        //                                .stringOfEmails) { newValue in
                        //
                        //                                    eventCreationViewModel.stringOfEmails = newValue
                        //
                        //                                    print($eventCreationViewModel.stringOfEmails.wrappedValue)
                        //                                    userEmailInput = $eventCreationViewModel.stringOfEmails.wrappedValue
                        //                                }
                        //                                .frame(width: getRelativeWidth(295.0),
                        //                                       height: getRelativeHeight(58.0), alignment: .leading)
                        //                                .overlay(RoundedCorners(topLeft: 29.0, topRight: 29.0,
                        //                                                        bottomLeft: 29.0, bottomRight: 29.0)
                        //                                    .stroke(ColorConstants.Gray700,
                        //                                            lineWidth: 1))
                        //                                .background(RoundedCorners(topLeft: 29.0, topRight: 29.0,
                        //                                                           bottomLeft: 29.0,
                        //                                                           bottomRight: 29.0)
                        //                                    .fill(ColorConstants.WhiteA700))
                        
                        
                        //                    }.frame(width: 343, height: 30)
                        
                        
                        Text(StringConstants.kLblDescription)
                            .fontWeight(.medium)
                            .font(FontScheme.kInterRegular(size: getRelativeHeight(20)))
                            .frame(width: 200, height: 11.42, alignment: .leading)
                            .lineSpacing(26).padding(.top, 70)
                        
                        RoundedRectangle(cornerRadius: 10)
                            .fill(Color(red: 0.95, green: 0.96, blue: 0.98))
                            .frame(width: 350, height: 83.78)
                        
                        // Done Button
                        VStack {
                            Button(action: addNewEventToFirebase, label: {
                                HStack(spacing: 0) {
                                    Text(StringConstants.kLblDone).font(FontScheme.kInterBlack(size: getRelativeHeight(15.0)))
                                        .fontWeight(.black)
                                        .foregroundColor(ColorConstants.Gray801)
                                        .minimumScaleFactor(0.5)
                                        .multilineTextAlignment(.leading)
                                        .frame(width: getRelativeWidth(45.0),height: getRelativeHeight(17.0), alignment: .topLeading)
                                        .padding(.vertical, getRelativeHeight(14.0))
                                        .padding(.horizontal, getRelativeWidth(146.0))
                                }
                            })
                            // print warning message if can't sign up
                            if !viewModel.errorMessage.isEmpty {
                                HStack {
                                    Text(viewModel.errorMessage)
                                        .foregroundColor(Color(UIColor.systemRed))
                                        .font(FontScheme.kInterExtraLight(size: getRelativeHeight(12)))
                                    
                                }
                                .frame(width: getRelativeWidth(295.0),
                                       height: getRelativeHeight(20.0), alignment: .center)
                                .padding(.top, getRelativeWidth(5))
                                .padding(.leading, getRelativeWidth(36))
                                
                            }
                        }
                        .frame(width: getRelativeWidth(339.0), height: getRelativeHeight(45.0),
                               alignment: .trailing)
                        .background(RoundedCorners(topLeft: 22.0, topRight: 22.0, bottomLeft: 22.0, bottomRight: 22.0).fill(ColorConstants.IndigoA70077))
                        .padding(.top, getRelativeHeight(18.0)).padding(.horizontal, getRelativeWidth(0.0))
                        .padding(.bottom, 20)
                    }.padding(.top, 20).padding(.leading, getRelativeWidth(27))
                    Group {
                        NavigationLink(destination: HomePageView(),
                                       tag: "HomePageView",
                                       selection: $eventCreationViewModel.nextScreen,
                                       label: {
                            EmptyView()
                        })
                    }
                }.frame(width: getRelativeWidth(UIScreen.main.bounds.width), height: getRelativeHeight(600), alignment: .center)
                .navigationBarTitle(StringConstants.kMsgLetSMakeANe)
            }
            .ignoresSafeArea()
            .hideNavigationBar()
        }
    }
}


struct EventCreationView_Previews: PreviewProvider {
    static var previews: some View {
        EventCreationView().environmentObject(AuthenticationViewModel())
    }
}
