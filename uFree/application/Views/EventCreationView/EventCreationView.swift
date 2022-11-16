import SwiftUI
import Firebase

struct EventCreationView: View {
    @StateObject var eventCreationViewModel = EventCreationViewModel()
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    //User input variables
    @State var eventTitle = ""
    @State var specificDates = ""
    @State var selectedDuration: Int = 1
    @State var invitees = ""
    @State var description = ""
    
    var body: some View {
        NavigationView{
            ScrollView(.vertical, showsIndicators: true){
                VStack(alignment: .leading){
                    Text(StringConstants.kMsgSelectYourDat)
                    .fontWeight(.medium)
                    .font(.callout)
                    .frame(width: 152, height: 12, alignment: .leading)
                    .lineSpacing(26)
                    ScrollView(.horizontal, showsIndicators: false){
                        HStack{
                            ZStack {
                                RoundedRectangle(cornerRadius: 10)
                                .fill(Color(#colorLiteral(red: 0.9450980424880981, green: 0.9607843160629272, blue: 0.9764705896377563, alpha: 1)))
                                //Fri
                                    Text(StringConstants.kLblFri).font(FontScheme
                                        .kInterRegular(size: getRelativeHeight(12.0))).foregroundColor(Color(#colorLiteral(red: 0.29, green: 0.29, blue: 0.29, alpha: 1))).tracking(0.3).multilineTextAlignment(.center).frame(width: 24, height: 14)
                                    .lineSpacing(26)
                                //22
                                    Text(StringConstants.kLbl22).font(FontScheme.kInterSemiBold(size: getRelativeHeight(18.0))).foregroundColor(Color(#colorLiteral(red: 0.29, green: 0.29, blue: 0.29, alpha: 1))).tracking(0.3).multilineTextAlignment(.center).frame(width: 24, height: 24)
                                    .lineSpacing(26)
                            }
                            .frame(width: 73, height: 120)
                            ZStack {
                                RoundedRectangle(cornerRadius: 10)
                                .fill(Color(#colorLiteral(red: 0.9450980424880981, green: 0.9607843160629272, blue: 0.9764705896377563, alpha: 1)))
                                //Sat
                                    Text(StringConstants.kLblSat).font(FontScheme
                                        .kInterRegular(size: getRelativeHeight(12.0))).foregroundColor(Color(#colorLiteral(red: 0.29, green: 0.29, blue: 0.29, alpha: 1))).tracking(0.3).multilineTextAlignment(.center).frame(width: 24, height: 14)
                                    .lineSpacing(26)
                                //23
                                    Text(StringConstants.kLbl23).font(FontScheme.kInterSemiBold(size: getRelativeHeight(18.0))).foregroundColor(Color(#colorLiteral(red: 0.29, green: 0.29, blue: 0.29, alpha: 1))).tracking(0.3).multilineTextAlignment(.center).frame(width: 24, height: 24)
                                    .lineSpacing(26)
                            }
                            .frame(width: 73, height: 120)
                            ZStack {
                                RoundedRectangle(cornerRadius: 10)
                                .fill(Color(#colorLiteral(red: 0.9450980424880981, green: 0.9607843160629272, blue: 0.9764705896377563, alpha: 1)))
                            }
                            .frame(width: 73, height: 120)
                            ZStack {
                                RoundedRectangle(cornerRadius: 10)
                                .fill(Color(#colorLiteral(red: 0.9450980424880981, green: 0.9607843160629272, blue: 0.9764705896377563, alpha: 1)))
                            }
                            .frame(width: 73, height: 120)
                            ZStack {
                                RoundedRectangle(cornerRadius: 10)
                                .fill(Color(#colorLiteral(red: 0.9450980424880981, green: 0.9607843160629272, blue: 0.9764705896377563, alpha: 1)))
                            }
                            .frame(width: 73, height: 120)
                            ZStack {
                                RoundedRectangle(cornerRadius: 10)
                                .fill(Color(#colorLiteral(red: 0.9450980424880981, green: 0.9607843160629272, blue: 0.9764705896377563, alpha: 1)))
                            }
                            .frame(width: 73, height: 120)
                            ZStack {
                                RoundedRectangle(cornerRadius: 10)
                                .fill(Color(#colorLiteral(red: 0.9450980424880981, green: 0.9607843160629272, blue: 0.9764705896377563, alpha: 1)))
                            }
                            .frame(width: 73, height: 120)
                        }
                    }
                    Text(StringConstants.kMsgMeetingDuratio)
                        .fontWeight(.medium)
                        .font(.callout)
                        .frame(width: 143, height: 12, alignment: .leading)
                        .lineSpacing(26).padding(.top, 25)

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
                            // Select Duration
                                                    
                            Picker(StringConstants.kLbl2Hours,
                                   selection: $selectedDuration) {
                                ForEach(0..<25,
                                        id: \.self) { value in
                                    Text(String(value)).tag(value as Int?)
                                }
                            }
                            .foregroundColor(ColorConstants.Gray700)
                            .font(.system(size: getRelativeHeight(16)))
                            .pickerStyle(MenuPickerStyle())
                            
                            // Set your availability - SHOULD CALL CALENDAR PAGE
                                                    
                            Button(action: {}, label: {
                                HStack(spacing: 0) {
                                    Text(StringConstants.kMsgYourAvailabili)
                                        .font(FontScheme.kInterBold(size: getRelativeHeight(14.0)))
                                        .fontWeight(.bold)
                                        .padding(.horizontal, getRelativeWidth(30.0))
                                        .padding(.vertical, getRelativeHeight(10.0))
                                        .foregroundColor(ColorConstants.Gray101)
                                        .minimumScaleFactor(0.5)
                                        .multilineTextAlignment(.center)
                                        .frame(width: getRelativeWidth(330.0),
                                               height: getRelativeHeight(35.0), alignment: .center)
                                        .background(RoundedCorners(topLeft: 10.0, topRight: 10.0,
                                                                   bottomLeft: 10.0, bottomRight: 10.0)
                                                .fill(ColorConstants.BlueA100))
                                        .padding(.top, getRelativeHeight(8.0))
                                        .padding(.horizontal, getRelativeWidth(21.0))
                                }
                            })
                            .frame(width: 350, height: 35)
                            .background(Color(red: 0.95, green: 0.96, blue: 0.98))
                            .cornerRadius(10)
                            .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.12), radius: 4)
                            .offset(x: 0, y: 0)
                            .frame(width: 350, height: 35)
//                        }
//                        .frame(width: 350, height: 50)
                    Text(StringConstants.kLblInvitees)
                        .fontWeight(.medium)
                        .font(.callout)
                        .frame(width: 85, height: 11.42, alignment: .leading)
                        .lineSpacing(26).padding(.top, 45)
                    ZStack(alignment: .leading) {
                        RoundedRectangle(cornerRadius: 10) .fill(Color(red: 0.95, green: 0.96, blue: 0.98)) .frame(width: 350, height: 22.85)
                        
                        HStack(spacing: 11) {
                            RoundedRectangle(cornerRadius: 8) .fill(Color(red: 0.50, green: 0.23, blue: 0.27, opacity: 0.50)) .frame(width: 24, height: 24)
                            Text(StringConstants.kMsgEnterInviteeE).fontWeight(.thin)
                                .font(.caption)
                                .lineSpacing(18)
                        }.frame(width: 343)
                        
                        RoundedRectangle(cornerRadius: 10) .fill(Color(red: 0.95, green: 0.96, blue: 0.98)).offset(x: 0, y: 30) .frame(width: 350, height: 22.85)
                        
                        HStack(spacing: 11) {
                            RoundedRectangle(cornerRadius: 8)
                                .fill(Color(red: 0.50, green: 0.23, blue: 0.27, opacity: 0.50))
                                .frame(width: 24, height: 24)
                            Text(StringConstants.kMsgEnterInviteeE2) .fontWeight(.thin)
                                .font(.caption)
                                .lineSpacing(18)
                        }.offset(x: 1, y: 30) .frame(width: 343)
                        
                        HStack(spacing: 11) {
                            RoundedRectangle(cornerRadius: 8)
                                .fill(Color.black)
                                .frame(width: 24, height: 24)
                            Text(StringConstants.kLblAddNewInvitee) .fontWeight(.thin)
                                .font(.caption)
                                .lineSpacing(18)
                        }.offset(x: 0, y: 60) .frame(width: 343)
                    }.frame(width: 343, height: 30)
                    
                    Text(StringConstants.kLblDescription)
                        .fontWeight(.medium)
                        .font(.callout)
                        .frame(width: 107, height: 11.42, alignment: .leading)
                        .lineSpacing(26).padding(.top, 70)

                        RoundedRectangle(cornerRadius: 10)
                        .fill(Color(red: 0.95, green: 0.96, blue: 0.98))
                        .frame(width: 350, height: 83.78)
                    
                    // Done Button
                    VStack {
                        Button(action: {
                            let specificDate = DateFormatter()
                            specificDate.dateFormat = "yyyy/MM/dd HH:mm"
                            let specificDateObject = specificDate.date(from: "2022/11/10 00:00")
                            createEvent(name: "working on uFree", duration: selectedDuration, description: "we really love xcode man, can't you tell?", date: specificDateObject!)
                            eventCreationViewModel.nextScreen = "HomePageView"
                        }, label: {
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
                    }
                    .frame(width: getRelativeWidth(339.0), height: getRelativeHeight(45.0),
                           alignment: .trailing)
                    .background(RoundedCorners(topLeft: 22.0, topRight: 22.0, bottomLeft: 22.0, bottomRight: 22.0).fill(ColorConstants.IndigoA70077))
                    .padding(.top, getRelativeHeight(18.0)).padding(.horizontal, getRelativeWidth(0.0))
                }.padding(.top, 20).padding(.leading, 20)
                Group {
                    NavigationLink(destination: HomePageView(),
                                   tag: "HomePageView",
                                   selection: $eventCreationViewModel.nextScreen,
                                   label: {
                                       EmptyView()
                                   })
                }
            }.navigationBarTitle(StringConstants.kMsgLetSMakeANe)
        }
    }
}

func createEvent(name: String, duration: Int, description: String, date: Date) {
    print("Reached in create event")
    let ref = Database.database().reference()
    ref.child("events/emails").observeSingleEvent(of: .value, with: { snapshot in
          guard var emailArray = snapshot.value as? [String] else {
              return
          }
          print("Old Email Values: \(emailArray)")
        
        let emailAddress = UserDefaults.standard.object(forKey: "email") as! String
        // retrieving the events based on the email
        let emailIndexValue = UserDefaults.standard.integer(forKey: "userIndexValue")
        
        print("email index value \(emailIndexValue)")
        
        ref.child("events/events").observeSingleEvent(of: .value, with: { snapshot in
            guard let allUserEvents = snapshot.value as? [[[String: String]]] else {
                print("Error: All user events not found in database")
                return
            }
            
            print("All user events: \(allUserEvents)")
            print("EMAIL INDEX VALUE: \(emailIndexValue)")
            
            var specificUserEvents = allUserEvents[emailIndexValue]
            // [[String: String]]
            
            var dateString = ""
            if #available(iOS 15.0, *) {
                dateString = date.formatted(date: .numeric, time: .omitted) as String
            } else {
                // Fallback on earlier versions
                print("Get a new phone")
            }
            let newEventDict: [String: String] = ["title": name, "duration": String(duration), "description": description, "date": dateString]
            
            specificUserEvents.append(newEventDict)
            
            let path = "events/events/" + String(emailIndexValue)
            ref.child(path).setValue(specificUserEvents)
            
            UserDefaults.standard.set(specificUserEvents, forKey: "specificUserEvents")
            
            print("Event successfully created")
        })
        
    })
}


struct EventCreationView_Previews: PreviewProvider {
    static var previews: some View {
        EventCreationView()
    }
}
