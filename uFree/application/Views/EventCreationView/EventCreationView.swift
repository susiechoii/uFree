import SwiftUI
import Firebase

struct EventCreationView: View {
    @StateObject var eventCreationViewModel = EventCreationViewModel()
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    var body: some View {
        VStack {
            VStack(alignment: .trailing, spacing: 0) {
                VStack(alignment: .leading, spacing: 0) {
                    VStack {
                        ScrollView(.horizontal, showsIndicators: false) {
                            ZStack(alignment: .bottomTrailing) {
                                Text(StringConstants.kMsgLetSMakeANe)
                                    .font(FontScheme.kInterSemiBold(size: getRelativeHeight(24.0)))
                                    .fontWeight(.semibold)
                                    .foregroundColor(ColorConstants.Bluegray900)
                                    .minimumScaleFactor(0.5)
                                    .multilineTextAlignment(.leading)
                                    .frame(width: getRelativeWidth(156.0),
                                           height: getRelativeHeight(49.0), alignment: .topLeading)
                                    .padding(.bottom, getRelativeHeight(183.0))
                                    .padding(.trailing, getRelativeWidth(195.0))
                                ZStack(alignment: .bottomLeading) {
                                    HStack {
                                        VStack {
                                            Text(StringConstants.kLbl22)
                                                .font(FontScheme
                                                    .kInterSemiBold(size: getRelativeHeight(18.0)))
                                                .fontWeight(.semibold)
                                                .foregroundColor(ColorConstants.Gray801)
                                                .minimumScaleFactor(0.5)
                                                .multilineTextAlignment(.leading)
                                                .frame(width: getRelativeWidth(24.0),
                                                       height: getRelativeHeight(18.0),
                                                       alignment: .topLeading)
                                                .padding(.top, getRelativeHeight(43.0))
                                                .padding(.horizontal, getRelativeWidth(25.0))
                                            Text(StringConstants.kLblFri)
                                                .font(FontScheme
                                                    .kInterRegular(size: getRelativeHeight(12.0)))
                                                .fontWeight(.regular)
                                                .foregroundColor(ColorConstants.Gray801)
                                                .minimumScaleFactor(0.5)
                                                .multilineTextAlignment(.leading)
                                                .frame(width: getRelativeWidth(13.0),
                                                       height: getRelativeHeight(14.0),
                                                       alignment: .topLeading)
                                                .padding(.vertical, getRelativeHeight(4.0))
                                                .padding(.horizontal, getRelativeWidth(25.0))
                                        }
                                        .frame(width: getRelativeWidth(73.0),
                                               height: getRelativeHeight(120.0), alignment: .center)
                                        .background(RoundedCorners(topLeft: 10.0, topRight: 10.0,
                                                                   bottomLeft: 10.0,
                                                                   bottomRight: 10.0)
                                                .fill(ColorConstants.Gray101))
                                        VStack {
                                            Text(StringConstants.kLbl23)
                                                .font(FontScheme
                                                    .kInterSemiBold(size: getRelativeHeight(18.0)))
                                                .fontWeight(.semibold)
                                                .foregroundColor(ColorConstants.WhiteA700)
                                                .minimumScaleFactor(0.5)
                                                .multilineTextAlignment(.leading)
                                                .frame(width: getRelativeWidth(24.0),
                                                       height: getRelativeHeight(18.0),
                                                       alignment: .topLeading)
                                                .padding(.top, getRelativeHeight(43.0))
                                                .padding(.horizontal, getRelativeWidth(25.0))
                                            Text(StringConstants.kLblSat)
                                                .font(FontScheme
                                                    .kInterRegular(size: getRelativeHeight(12.0)))
                                                .fontWeight(.regular)
                                                .foregroundColor(ColorConstants.WhiteA700)
                                                .minimumScaleFactor(0.5)
                                                .multilineTextAlignment(.leading)
                                                .frame(width: getRelativeWidth(24.0),
                                                       height: getRelativeHeight(14.0),
                                                       alignment: .topLeading)
                                                .padding(.vertical, getRelativeHeight(4.0))
                                                .padding(.horizontal, getRelativeWidth(25.0))
                                        }
                                        .frame(width: getRelativeWidth(73.0),
                                               height: getRelativeHeight(120.0), alignment: .center)
                                        .background(RoundedCorners(topLeft: 10.0, topRight: 10.0,
                                                                   bottomLeft: 10.0,
                                                                   bottomRight: 10.0)
                                                .fill(ColorConstants.Red300))
                                        .padding(.leading, getRelativeWidth(12.0))
                                    }
                                    .frame(width: getRelativeWidth(158.0),
                                           height: getRelativeHeight(120.0),
                                           alignment: .bottomLeading)
                                    .padding(.top, getRelativeHeight(28.36))
                                    .padding(.trailing, getRelativeWidth(255.0))
                                    HStack {
                                        Image("img_rectangle9")
                                            .resizable()
                                            .frame(width: getRelativeWidth(73.0),
                                                   height: getRelativeHeight(120.0),
                                                   alignment: .center)
                                            .scaledToFit()
                                            .clipped()
                                        HStack {
                                            VStack {
                                                Text(StringConstants.kLbl24)
                                                    .font(FontScheme
                                                        .kInterSemiBold(size: getRelativeHeight(18.0)))
                                                    .fontWeight(.semibold)
                                                    .foregroundColor(ColorConstants.Gray801)
                                                    .minimumScaleFactor(0.5)
                                                    .multilineTextAlignment(.leading)
                                                    .frame(width: getRelativeWidth(24.0),
                                                           height: getRelativeHeight(18.0),
                                                           alignment: .topLeading)
                                                    .padding(.top, getRelativeHeight(43.0))
                                                    .padding(.horizontal, getRelativeWidth(25.0))
                                                Text(StringConstants.kLblSun)
                                                    .font(FontScheme
                                                        .kInterRegular(size: getRelativeHeight(12.0)))
                                                    .fontWeight(.regular)
                                                    .foregroundColor(ColorConstants.Gray801)
                                                    .minimumScaleFactor(0.5)
                                                    .multilineTextAlignment(.leading)
                                                    .frame(width: getRelativeWidth(24.0),
                                                           height: getRelativeHeight(14.0),
                                                           alignment: .topLeading)
                                                    .padding(.vertical, getRelativeHeight(4.0))
                                                    .padding(.horizontal, getRelativeWidth(25.0))
                                            }
                                            .frame(width: getRelativeWidth(73.0),
                                                   height: getRelativeHeight(120.0),
                                                   alignment: .center)
                                            .background(RoundedCorners(topLeft: 10.0,
                                                                       topRight: 10.0,
                                                                       bottomLeft: 10.0,
                                                                       bottomRight: 10.0)
                                                    .fill(ColorConstants.Gray101))
                                            VStack {
                                                Text(StringConstants.kLbl25)
                                                    .font(FontScheme
                                                        .kInterSemiBold(size: getRelativeHeight(18.0)))
                                                    .fontWeight(.semibold)
                                                    .foregroundColor(ColorConstants.Gray801)
                                                    .minimumScaleFactor(0.5)
                                                    .multilineTextAlignment(.leading)
                                                    .frame(width: getRelativeWidth(24.0),
                                                           height: getRelativeHeight(18.0),
                                                           alignment: .topLeading)
                                                    .padding(.top, getRelativeHeight(43.0))
                                                    .padding(.horizontal, getRelativeWidth(25.0))
                                                Text(StringConstants.kLblMo)
                                                    .font(FontScheme
                                                        .kInterRegular(size: getRelativeHeight(12.0)))
                                                    .fontWeight(.regular)
                                                    .foregroundColor(ColorConstants.Gray801)
                                                    .minimumScaleFactor(0.5)
                                                    .multilineTextAlignment(.leading)
                                                    .frame(width: getRelativeWidth(16.0),
                                                           height: getRelativeHeight(14.0),
                                                           alignment: .topLeading)
                                                    .padding(.vertical, getRelativeHeight(4.0))
                                                    .padding(.horizontal, getRelativeWidth(25.0))
                                            }
                                            .frame(width: getRelativeWidth(73.0),
                                                   height: getRelativeHeight(120.0),
                                                   alignment: .center)
                                            .background(RoundedCorners(topLeft: 10.0,
                                                                       topRight: 10.0,
                                                                       bottomLeft: 10.0,
                                                                       bottomRight: 10.0)
                                                    .fill(ColorConstants.Gray101))
                                            .padding(.leading, getRelativeWidth(12.0))
                                            Image("img_rectangle8")
                                                .resizable()
                                                .frame(width: getRelativeWidth(73.0),
                                                       height: getRelativeHeight(120.0),
                                                       alignment: .center)
                                                .scaledToFit()
                                                .clipped()
                                                .padding(.leading, getRelativeWidth(12.0))
                                        }
                                        .frame(width: getRelativeWidth(243.0),
                                               height: getRelativeHeight(120.0), alignment: .center)
                                        .padding(.leading, getRelativeWidth(182.0))
                                    }
                                    .frame(width: UIScreen.main.bounds.width,
                                           height: getRelativeHeight(121.0),
                                           alignment: .bottomLeading)
                                    .padding(.top, getRelativeHeight(27.36))
                                    Text(StringConstants.kMsgSelectYourDat)
                                        .font(FontScheme
                                            .kInterMedium(size: getRelativeHeight(16.0)))
                                        .fontWeight(.medium)
                                        .foregroundColor(ColorConstants.Bluegray900)
                                        .minimumScaleFactor(0.5)
                                        .multilineTextAlignment(.leading)
                                        .frame(width: getRelativeWidth(137.0),
                                               height: getRelativeHeight(16.0),
                                               alignment: .topLeading)
                                        .padding(.bottom, getRelativeHeight(132.0))
                                        .padding(.trailing, getRelativeWidth(276.0))
                                }
                                .hideNavigationBar()
                                .frame(width: UIScreen.main.bounds.width,
                                       height: getRelativeHeight(148.0),
                                       alignment: .bottomTrailing)
                                .padding(.top, getRelativeHeight(139.64))
                                Image("img_group6")
                                    .resizable()
                                    .frame(width: getRelativeWidth(271.0),
                                           height: getRelativeHeight(204.0), alignment: .center)
                                    .scaledToFit()
                                    .clipped()
                                    .padding(.bottom, getRelativeHeight(84.0))
                                    .padding(.leading, getRelativeWidth(165.0))
                            }
                            .hideNavigationBar()
                            .frame(width: UIScreen.main.bounds.width,
                                   height: getRelativeHeight(288.0), alignment: .leading)
                        }
                        Text(StringConstants.kMsgMeetingDuratio)
                            .font(FontScheme.kInterMedium(size: getRelativeHeight(16.0)))
                            .fontWeight(.medium)
                            .foregroundColor(ColorConstants.Bluegray900)
                            .minimumScaleFactor(0.5)
                            .multilineTextAlignment(.leading)
                            .frame(width: getRelativeWidth(135.0), height: getRelativeHeight(16.0),
                                   alignment: .topLeading)
                            .padding(.top, getRelativeHeight(35.0))
                            .padding(.horizontal, getRelativeWidth(85.0))
                        Picker(StringConstants.kLbl2Hours,
                               selection: $eventCreationViewModel.durationPicker1) {
                            ForEach(eventCreationViewModel.durationPicker1Values,
                                    id: \.self) { value in
                                Text(value)
                            }
                        }
                        .foregroundColor(ColorConstants.Gray700)
                        .font(.system(size: getRelativeHeight(16)))
                        .pickerStyle(MenuPickerStyle())
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
                        .frame(width: getRelativeWidth(330.0), height: getRelativeHeight(35.0),
                               alignment: .center)
                        .background(RoundedCorners(topLeft: 10.0, topRight: 10.0, bottomLeft: 10.0,
                                                   bottomRight: 10.0)
                                .fill(ColorConstants.BlueA100))
                        .padding(.top, getRelativeHeight(8.0))
                        .padding(.horizontal, getRelativeWidth(21.0))
                        Text(StringConstants.kLblInvitees)
                            .font(FontScheme.kInterMedium(size: getRelativeHeight(16.0)))
                            .fontWeight(.medium)
                            .foregroundColor(ColorConstants.Bluegray900)
                            .minimumScaleFactor(0.5)
                            .multilineTextAlignment(.leading)
                            .frame(width: getRelativeWidth(61.0), height: getRelativeHeight(16.0),
                                   alignment: .topLeading)
                            .padding(.top, getRelativeHeight(16.0))
                            .padding(.horizontal, getRelativeWidth(85.0))
                        VStack(spacing: 0) {
                            ScrollView(.vertical, showsIndicators: false) {
                                LazyVStack {
                                    ForEach(0 ... 1, id: \.self) { index in
                                        StackrectanglenineoneCell()
                                    }
                                }
                            }
                        }
                        .frame(width: getRelativeWidth(321.0), alignment: .trailing)
                        .padding(.top, getRelativeHeight(10.0))
                        .padding(.horizontal, getRelativeWidth(26.0))
                        HStack {
                            Image("img_combinedshape_24X24")
                                .resizable()
                                .frame(width: getRelativeWidth(24.0),
                                       height: getRelativeWidth(24.0), alignment: .center)
                                .scaledToFit()
                                .clipped()
                            Text(StringConstants.kLblAddNewInvitee)
                                .font(FontScheme.kInterExtraLight(size: getRelativeHeight(12.0)))
                                .fontWeight(.ultraLight)
                                .foregroundColor(ColorConstants.Gray900)
                                .minimumScaleFactor(0.5)
                                .multilineTextAlignment(.leading)
                                .frame(width: getRelativeWidth(89.0),
                                       height: getRelativeHeight(12.0), alignment: .topLeading)
                                .padding(.top, getRelativeHeight(5.0))
                                .padding(.bottom, getRelativeHeight(6.0))
                                .padding(.leading, getRelativeWidth(11.0))
                        }
                        .frame(width: getRelativeWidth(124.0), height: getRelativeHeight(24.0),
                               alignment: .leading)
                        .padding(.top, getRelativeHeight(7.0))
                        .padding(.horizontal, getRelativeWidth(85.0))
                        VStack(alignment: .leading, spacing: 0) {
                            Text(StringConstants.kLblDescription)
                                .font(FontScheme.kInterMedium(size: getRelativeHeight(16.0)))
                                .fontWeight(.medium)
                                .foregroundColor(ColorConstants.Bluegray900)
                                .minimumScaleFactor(0.5)
                                .multilineTextAlignment(.leading)
                                .frame(width: getRelativeWidth(89.0),
                                       height: getRelativeHeight(16.0), alignment: .topLeading)
                                .padding(.trailing)
                            ZStack {}
                                .hideNavigationBar()
                                .frame(width: getRelativeWidth(328.0),
                                       height: getRelativeHeight(83.0), alignment: .leading)
                                .background(RoundedCorners(topLeft: 10.0, topRight: 10.0,
                                                           bottomLeft: 10.0, bottomRight: 10.0)
                                        .fill(ColorConstants.Gray101))
                                .padding(.top, getRelativeHeight(11.0))
                        }
                        .frame(width: getRelativeWidth(328.0), height: getRelativeHeight(110.0),
                               alignment: .trailing)
                        .background(RoundedCorners(topLeft: 10.0, topRight: 10.0, bottomLeft: 10.0,
                                                   bottomRight: 10.0))
                        .padding(.top, getRelativeHeight(17.0))
                        .padding(.horizontal, getRelativeWidth(23.0))
                        VStack {
                            Button(action: {
                                let specificDate = DateFormatter()
                                specificDate.dateFormat = "yyyy/MM/dd HH:mm"
                                
                                let specificDateObject = specificDate.date(from: "2022/11/10 00:00")
                                
                                createEvent(name: "working on uFree", duration: 5, description: "we really love xcode man, can't you tell?", date: specificDateObject!)
                                eventCreationViewModel.nextScreen = "HomePageView"
                            }, label: {
                                HStack(spacing: 0) {
                                    Text(StringConstants.kLblDone)
                                .font(FontScheme.kInterBlack(size: getRelativeHeight(15.0)))
                                .fontWeight(.black)
                                .foregroundColor(ColorConstants.Gray801)
                                .minimumScaleFactor(0.5)
                                .multilineTextAlignment(.leading)
                                .frame(width: getRelativeWidth(45.0),
                                       height: getRelativeHeight(17.0), alignment: .topLeading)
                                .padding(.vertical, getRelativeHeight(14.0))
                                .padding(.horizontal, getRelativeWidth(146.0))
                                }
                            
                        })
                        .frame(width: getRelativeWidth(339.0), height: getRelativeHeight(45.0),
                               alignment: .trailing)
                        .background(RoundedCorners(topLeft: 22.0, topRight: 22.0, bottomLeft: 22.0,
                                                   bottomRight: 22.0)
                                .fill(ColorConstants.IndigoA70077))
                        .padding(.top, getRelativeHeight(18.0))
                        .padding(.horizontal, getRelativeWidth(16.0))
                    }
                    .frame(width: UIScreen.main.bounds.width, height: getRelativeHeight(746.0),
                           alignment: .leading)
                    .background(ColorConstants.WhiteA700)
                }
                .frame(width: UIScreen.main.bounds.width, height: getRelativeHeight(746.0),
                       alignment: .leading)
                VStack(alignment: .trailing, spacing: 0) {
                    Text("TabBars")
                        .minimumScaleFactor(0.5)
                        .multilineTextAlignment(.leading)
                        .frame(width: UIScreen.main.bounds.width, height: getRelativeHeight(96.0),
                               alignment: .trailing)
                }
                .frame(width: UIScreen.main.bounds.width, height: getRelativeHeight(96.0),
                       alignment: .leading)
            }
            .frame(width: UIScreen.main.bounds.width, alignment: .topLeading)
            .background(ColorConstants.WhiteA700)
            .padding(.top, getRelativeHeight(30.0))
            .padding(.bottom, getRelativeHeight(10.0))
        }
        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        .background(ColorConstants.WhiteA700)
        .ignoresSafeArea()
        .hideNavigationBar()
    }
        Group {
            NavigationLink(destination: HomePageView(),
                           tag: "HomePageView",
                           selection: $eventCreationViewModel.nextScreen,
                           label: {
                               EmptyView()
                           })
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
        let emailIndexValue = emailArray.firstIndex(of: emailAddress) ?? -1
        
        print("email index value \(emailIndexValue)")
        
        ref.child("events/events").observeSingleEvent(of: .value, with: { snapshot in
            guard let allUserEvents = snapshot.value as? [[[String: String]]] else {
                print("Error: All user events not found in database")
                return
            }
            
            print("All user events: \(allUserEvents)")
            
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
            
            ref.child("events/events").setValue(specificUserEvents)
            
            print("Event successfully created")
        })
        
    })
}


struct EventCreationView_Previews: PreviewProvider {
    static var previews: some View {
        EventCreationView()
    }
}
