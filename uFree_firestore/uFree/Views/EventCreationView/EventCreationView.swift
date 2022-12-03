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
                        Text("Create a")
                            .font(FontScheme.kInterRegular(size: getRelativeHeight(35)))
                            .foregroundColor(ColorConstants.Bluegray900)
                            .minimumScaleFactor(0.5)
                            .multilineTextAlignment(.leading)
                            .frame(width: getRelativeWidth(108.0),
                                   height: getRelativeHeight(35), alignment: .leading)
                            .padding(.top, getRelativeHeight(50))
                        Text("New Event")
                            .font(FontScheme.kInterRegular(size: getRelativeHeight(40)))
                            .fontWeight(.bold)
                            .foregroundColor(ColorConstants.Bluegray900)
                            .minimumScaleFactor(0.5)
                            .multilineTextAlignment(.leading)
                            .frame(width: getRelativeWidth(250.0),
                                   height: getRelativeHeight(40), alignment: .leading)
                            .padding(.top, getRelativeHeight(0))
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
                        Group{
                            HStack{
                                Text("Event Title:")
                                    .fontWeight(.medium)
                                    .font(FontScheme.kInterRegular(size: getRelativeHeight(20)))
                                    .frame(width: 110, height: 12, alignment: .leading)
                                    .lineSpacing(26)
                                
                                TextField("New Event Title",
                                              text: $viewModel.inputTitle)
                                    .font(FontScheme
                                        .kInterRegular(size: getRelativeHeight(20.0)))
                                    .foregroundColor(ColorConstants.Black900Cc)
                                    .frame(width: 200, height: 10, alignment: .leading)
                                    .padding()
                                    .overlay(
                                     RoundedRectangle(cornerRadius: 8)
                                         .stroke(.gray, lineWidth: 2)
                                    )
                                    .keyboardType(.emailAddress)
                            }
                        }
                        
                        Group{
                            Text("Select Date")
                                .fontWeight(.medium)
                                .font(FontScheme.kInterRegular(size: getRelativeHeight(20)))
                                .frame(width: 250, height: 12, alignment: .leading)
                                .lineSpacing(26).padding(.top, 20)

    //                        Apple DatePicker
                            DatePicker("select date", selection: $viewModel.inputDate, displayedComponents: [.date])
                            //                        .padding(15.0)
                            //                        .frame(width: -1.0)
                                .datePickerStyle(GraphicalDatePickerStyle())
                                .frame(width: 330, alignment: .center)
                                .padding(.leading, 10)
                        }
                        
                        HStack{
                            VStack(alignment: .leading){
                                Text(StringConstants.kMsgMeetingDuratio)
                                    .fontWeight(.medium)
                                    .font(FontScheme.kInterRegular(size: getRelativeHeight(20)))
                                    .frame(width: 210, height: 12, alignment: .leading)
                                    .lineSpacing(26).padding(.top, 10)
                                
                                HStack{
                                    
                                    // Select Duration
                                    
                                    Picker(StringConstants.kLbl2Hours,
                                           selection: $viewModel.inputDuration) {
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
                                        .frame(width: 125, height: 12, alignment: .leading)
                                        .lineSpacing(26)
                                }.lineSpacing(26).padding(.top, 10)
                            }
                        
                            // Set your availability - SHOULD CALL CALENDAR PAGE
                            // which is OptimalTimeView now
                            
                            Button(action: {}, label: {
                                VStack(spacing: 0) {
                                    Text("Edit")
                                        .font(FontScheme.kInterBold(size: getRelativeHeight(30.0)))
                                        .fontWeight(.bold)
                                        .padding(.horizontal, getRelativeWidth(10.0))
                                        .foregroundColor(ColorConstants.Gray101)
                                        .minimumScaleFactor(0.5)
                                        .multilineTextAlignment(.center)
                                        .frame(width: getRelativeWidth(125.0),
                                               height: getRelativeHeight(75), alignment: .center)
                                        .background(RoundedCorners(topLeft: 10.0, topRight: 10.0,
                                                                   bottomLeft: 10.0, bottomRight: 10.0)
                                            .fill(ColorConstants.BlueA100))
                                        .padding(.top, getRelativeHeight(10.0))
                                    Text("Avaailability")
                                        .font(FontScheme.kInterBold(size: getRelativeHeight(30.0)))
                                        .fontWeight(.bold)
                                        .padding(.horizontal, getRelativeWidth(10.0))
                                        .foregroundColor(ColorConstants.Gray101)
                                        .minimumScaleFactor(0.5)
                                        .multilineTextAlignment(.center)
                                        .frame(width: getRelativeWidth(125.0),
                                               height: getRelativeHeight(75), alignment: .center)
                                        .background(RoundedCorners(topLeft: 10.0, topRight: 10.0,
                                                                   bottomLeft: 10.0, bottomRight: 10.0)
                                            .fill(ColorConstants.BlueA100))
                                        .padding(.bottom, getRelativeWidth(10.0))
                                }
                            })
                            .frame(width: 125, height: 75)
                            .background(Color(red: 0.95, green: 0.96, blue: 0.98))
                            .cornerRadius(10)
                            .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.12), radius: 4)
                            .offset(x: 0, y: 0)
                            .lineSpacing(26).padding(.top, 10)
                        }
                        
                       
                            Text("Invitees")
                                .fontWeight(.medium)
                                .font(FontScheme.kInterRegular(size: getRelativeHeight(20)))
                                .frame(width: 200, height: 11.42, alignment: .leading)
                                .lineSpacing(26).padding(.top, 20)
                            
                            TextField("Email",
                                      text: $viewModel.inputInvitee)
                            .font(FontScheme
                                .kInterRegular(size: getRelativeHeight(12.0)))
                            .foregroundColor(ColorConstants.Black900Cc)
                            .overlay(
                                RoundedRectangle(cornerRadius: 8)
                                 .stroke(.gray, lineWidth: 2)
                            )
                            .keyboardType(.emailAddress)
                            .lineSpacing(26).padding(.top, 10)
                        
                        
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
                            .lineSpacing(26).padding(.top, 50)
                        
                        TextField("Description",
                                  text: $viewModel.inputDescription)
                        .font(FontScheme
                            .kInterRegular(size: getRelativeHeight(12.0)))
                        .foregroundColor(ColorConstants.Black900Cc)
                        .padding()
                        .overlay(
                            RoundedRectangle(cornerRadius: 8)
                             .stroke(.gray, lineWidth: 2)
                        )
                        .keyboardType(.emailAddress)
                        .lineSpacing(26).padding(.top, 10)
                        
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
                }
                .frame(width: getRelativeWidth(UIScreen.main.bounds.width), height: getRelativeHeight(600), alignment: .center)
                .padding(.top, 20)
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
