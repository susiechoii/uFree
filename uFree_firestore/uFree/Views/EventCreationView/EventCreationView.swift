import SwiftUI
import Firebase
import FirebaseCore
import FirebaseFirestore
import FirebaseAuth

struct EventCreationView: View {
    @StateObject var eventCreationViewModel = EventCreationViewModel()
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @Environment(\.dismiss) var dismiss
    
    @EnvironmentObject var viewModel: AuthenticationViewModel
    
    @State var userEmailInput = ""
    
    //User input variables
    @State var inputTitle = ""
    @State var inputDate = Date.now
    @State var inputDuration: Int = 1
    @State var inputInvitee = ""
    @State var inputDescription = ""
    
    private func addNewEventToFirebase() {
        Task {
            if await viewModel.addNewEventToFirestore(inputTitle: inputTitle, inputDate: inputDate, inputDuration: inputDuration, inputInvitee: inputInvitee, inputDescription: inputDescription) == true {
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
                
                
                // Scroll View for the rest of the views
                ScrollView(.vertical, showsIndicators: true){
                    VStack(alignment: .leading){
                        
                        // Input Title Screen
                        Group{
                            HStack{
                                Text("Event Title:")
                                    .font(FontScheme.kInterRegular(size: getRelativeHeight(20)))
                                    .fontWeight(.medium)
                                    .frame(width: 110, height: 12, alignment: .leading)
                                    .lineSpacing(26)
                                
                                TextField("New Event Title",
                                          text: $inputTitle)
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
                        
                        // Selecting Date
                        
                        Text("Select Date")
                            .font(FontScheme.kInterRegular(size: getRelativeHeight(20)))
                            .fontWeight(.medium)
                            .frame(width: 250, height: 12, alignment: .leading)
                            .lineSpacing(26).padding(.top, 20)
                        
                        //Apple DatePicker
                        DatePicker("Select Date", selection: $inputDate)
                            .datePickerStyle(GraphicalDatePickerStyle())
                            .frame(width: 330, alignment: .center)
                            .padding(.leading, 10)
                        
                        
                        
                        // Meeting Duration Title
                        Text("Meeting Duration")
                            .fontWeight(.medium)
                            .font(FontScheme.kInterRegular(size: getRelativeHeight(20)))
                            .frame(width: 210, height: 12, alignment: .leading)
                            .lineSpacing(26).padding(.top, 10)
                        
                        // Select Duration HStack
                        HStack{
                            
                            Picker(StringConstants.kLbl2Hours,
                                   selection: $inputDuration) {
                                ForEach(0..<25,
                                        id: \.self) { value in
                                    Text(String(value)).tag(value as Int?)
                                }
                            }
                                   .foregroundColor(ColorConstants.Gray700)
                                   .font(FontScheme.kInterRegular(size: getRelativeHeight(20)))
                                   .pickerStyle(MenuPickerStyle())
                                   .frame(width: 50, alignment: .center)
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
                        
                        
                        // Invitees Header
                        Text("Invitees")
                            .fontWeight(.medium)
                            .font(FontScheme.kInterRegular(size: getRelativeHeight(20)))
                            .frame(width: 200, height: 11.42, alignment: .leading)
                            .lineSpacing(26).padding(.top, 20)
                            .padding(.bottom, getRelativeHeight(5))
                        
                        // Invitees Title
                        TextField("Email",
                                  text: $inputInvitee)
                        .font(FontScheme
                            .kInterRegular(size: getRelativeHeight(15.0)))
                        .foregroundColor(ColorConstants.Black900Cc)
                        .frame(width: getRelativeWidth(300), height: 10, alignment: .leading)
                        .padding()
                        .overlay(
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(.gray, lineWidth: 2)
                        )
                        .keyboardType(.emailAddress)
                        
                        
                        // Description header
                        Text("Description")
                            .fontWeight(.medium)
                            .font(FontScheme.kInterRegular(size: getRelativeHeight(20)))
                            .frame(width: 200, height: 11.42, alignment: .leading)
                            .lineSpacing(26).padding(.top, 40).padding(.bottom, getRelativeHeight(5))
                        
                        
                        // Invitees Title
                        TextField("Description",
                                  text: $inputDescription)
                        .font(FontScheme
                            .kInterRegular(size: getRelativeHeight(15.0)))
                        .foregroundColor(ColorConstants.Black900Cc)
                        .frame(width: getRelativeWidth(300), height: getRelativeHeight(50), alignment: .leading)
                        .padding()
                        .overlay(
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(.gray, lineWidth: 2)
                        )
                        
                        // Done Button
                        VStack {
                            Button(action: addNewEventToFirebase
                            
                                   , label: {
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
                        .frame(width: getRelativeWidth(330.0), height: getRelativeHeight(45.0),
                               alignment: .trailing)
                        .background(RoundedCorners(topLeft: 22.0, topRight: 22.0, bottomLeft: 22.0, bottomRight: 22.0).fill(ColorConstants.IndigoA70077))
                        .padding(.top, getRelativeHeight(18.0)).padding(.horizontal, getRelativeWidth(0.0))
                        .padding(.bottom, 20)
                    }.padding(.top, 20).padding(.leading, getRelativeWidth(3))
                    Group {
                        NavigationLink(destination: HomePageView().environmentObject(viewModel),
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
