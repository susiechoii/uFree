import SwiftUI

struct EventView: View {
    @StateObject var eventViewModel = EventViewModel()
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @EnvironmentObject var viewModel: AuthenticationViewModel
    
    var title: String!
    var everyoneConfirmed: Bool!
    var creator: Bool!
    var event: [String: Any]
//    var indexValue: Int!
//    var date: String!
//    var duration: String!
    
    
    init(particularEvent: [String: Any]) {
        event = particularEvent
        title = particularEvent["title"] as! String
        print("title: \(title)")
        everyoneConfirmed = particularEvent["everyoneConfirmed"] as! Bool
        creator = particularEvent["creator"] as! Bool
    }
    
    var body: some View {
        NavigationView {
            
            VStack {
             
                VStack {
             
                    VStack {
                        
                        Button(action: {
                            self.presentationMode.wrappedValue.dismiss()
                        }, label: {
                            Image("img_arrowleft")
                        })
                        
                        //                        HStack {
//                            HStack {
//                                Image("img_arrowleft_gray_900")
//                                    .resizable()
//                                    .frame(width: getRelativeWidth(9.0),
//                                           height: getRelativeHeight(16.0), alignment: .center)
//                                    .scaledToFit()
//                                    .clipped()
//                                    .padding(.vertical, getRelativeHeight(7.0))
//                                    .onTapGesture {
//                                        self.presentationMode.wrappedValue.dismiss()
//                                    }
//                                Spacer()
//                                Button(action: {}, label: {
//                                    Image("img_group17")
//                                })
//                                .frame(width: getRelativeWidth(30.0),
//                                       height: getRelativeWidth(30.0), alignment: .center)
//                                .background(RoundedCorners(topLeft: 5.0, topRight: 5.0,
//                                                           bottomLeft: 5.0, bottomRight: 5.0)
//                                        .fill(ColorConstants.Gray40075))
//                            }
//                            .frame(width: getRelativeWidth(324.0), height: getRelativeHeight(30.0),
//                                   alignment: .leading)
//                        }
//                        .frame(width: getRelativeWidth(324.0), height: getRelativeHeight(30.0),
//                               alignment: .leading)
//                        .padding(.top, getRelativeHeight(30.0))
//                        .padding(.horizontal, getRelativeWidth(16.0))
                        HStack {
//                            ZStack {}
//                                .hideNavigationBar()
//                                .frame(width: getRelativeWidth(8.0),
//                                       height: getRelativeHeight(87.0), alignment: .center)
//                                .background(RoundedCorners(topLeft: 4.0, topRight: 4.0,
//                                                           bottomLeft: 4.0, bottomRight: 4.0)
//                                        .fill(ColorConstants.OrangeA200))
//                            VStack(alignment: .leading, spacing: 0) {
//                                Text(StringConstants.kLblMeetings)
//                                    .font(FontScheme.kInterRegular(size: getRelativeHeight(12.0)))
//                                    .fontWeight(.regular)
//                                    .foregroundColor(ColorConstants.OrangeA200)
//                                    .minimumScaleFactor(0.5)
//                                    .multilineTextAlignment(.leading)
//                                    .frame(width: getRelativeWidth(51.0),
//                                           height: getRelativeHeight(16.0), alignment: .topLeading)
//                                    .padding(.trailing)
                            
                                Text(title)
                                    .font(FontScheme.kInterSemiBold(size: getRelativeHeight(24.0)))
                                    .fontWeight(.semibold)
                                    .foregroundColor(ColorConstants.Gray900)
                                    .minimumScaleFactor(0.5)
                                    .multilineTextAlignment(.leading)
                                    .frame(width: getRelativeWidth(85.0),
                                           height: getRelativeHeight(24.0), alignment: .topLeading)
                                    .padding(.top, getRelativeHeight(11.0))
                                    .padding(.trailing, getRelativeWidth(10.0))
//                                Text(StringConstants.kMsg0000Am030)
//                                    .font(FontScheme.kInterBold(size: getRelativeHeight(16.0)))
//                                    .fontWeight(.bold)
//                                    .foregroundColor(ColorConstants.Cyan200)
//                                    .minimumScaleFactor(0.5)
//                                    .multilineTextAlignment(.leading)
//                                    .frame(width: getRelativeWidth(157.0),
//                                           height: getRelativeHeight(16.0), alignment: .topLeading)
//                                    .padding(.top, getRelativeHeight(15.0))
//                            }
//                            .frame(width: getRelativeWidth(157.0), height: getRelativeHeight(83.0),
//                                   alignment: .top)
//                            .padding(.leading, getRelativeWidth(16.0))
                        }
                        .frame(width: getRelativeWidth(232.0), height: getRelativeHeight(87.0),
                               alignment: .leading)
//                        .background(RoundedCorners(topLeft: 8.0, topRight: 8.0, bottomLeft: 8.0,
//                                                   bottomRight: 8.0))
                        .padding(.top, getRelativeHeight(17.0))
                        .padding(.trailing, getRelativeWidth(10.0))
                        
                        Button(action: {
                            eventViewModel.nextScreen = "OptimalTimeView"
                        }, label: {
                            HStack(spacing: 0) {
                                Text("CONFIRM AVAILABILITY")
                                    .font(FontScheme
                                        .kInterExtraBold(size: getRelativeHeight(35.0)))
                                    .fontWeight(.heavy)
                                    .padding(.horizontal, getRelativeWidth(30.0))
                                    .padding(.vertical, getRelativeHeight(22.0))
                                    .foregroundColor(ColorConstants.WhiteA700)
                                    .minimumScaleFactor(0.5)
                                    .frame(width: getRelativeWidth(295.0),
                                           height: getRelativeHeight(60.0),
                                           alignment: .center)
                                    .background(RoundedCorners(topLeft: 28.5,
                                                               topRight: 28.5,
                                                               bottomLeft: 28.5,
                                                               bottomRight: 28.5)
                                            .fill(ColorConstants.Red400))
                            }
                        })
                        .frame(width: getRelativeWidth(295.0),
                               height: getRelativeHeight(60.0), alignment: .topLeading)
                        .background(RoundedCorners(topLeft: 28.5, topRight: 28.5,
                                                   bottomLeft: 28.5, bottomRight: 28.5)
                                .fill(ColorConstants.Red400))
//                        ZStack {
//                            Image("img_amigosshopping")
//                                .resizable()
//                                .frame(width: getRelativeWidth(359.0),
//                                       height: getRelativeHeight(215.0), alignment: .center)
//                                .scaledToFit()
//                                .clipped()
//                                .padding(.all, getRelativeWidth(8.0))
//                                .padding(.vertical, getRelativeHeight(8.0))
//                                .padding(.horizontal, getRelativeWidth(8.0))
//                        }
//                        .hideNavigationBar()
//                        .frame(width: UIScreen.main.bounds.width, height: getRelativeHeight(231.0),
//                               alignment: .leading)
//                        .background(ColorConstants.WhiteA700)
//                        .padding(.top, getRelativeHeight(16.0))
//                        VStack(alignment: .leading, spacing: 0) {
//                            Text(StringConstants.kLblDescription)
//                                .font(FontScheme.kInterBold(size: getRelativeHeight(16.0)))
//                                .fontWeight(.bold)
//                                .foregroundColor(ColorConstants.Gray900)
//                                .minimumScaleFactor(0.5)
//                                .multilineTextAlignment(.leading)
//                                .frame(width: getRelativeWidth(85.0),
//                                       height: getRelativeHeight(18.0), alignment: .topLeading)
//                                .padding(.trailing)
//                            Text(StringConstants.kMsgXClubWillBe)
//                                .font(FontScheme.kInterRegular(size: getRelativeHeight(14.0)))
//                                .fontWeight(.regular)
//                                .foregroundColor(ColorConstants.Gray900)
//                                .minimumScaleFactor(0.5)
//                                .multilineTextAlignment(.leading)
//                                .frame(width: getRelativeWidth(331.0),
//                                       height: getRelativeHeight(78.0), alignment: .topLeading)
//                                .padding(.top, getRelativeHeight(9.0))
//                                .padding(.trailing, getRelativeWidth(11.0))
//                            Text(StringConstants.kLblMembers)
//                                .font(FontScheme.kInterBold(size: getRelativeHeight(16.0)))
//                                .fontWeight(.bold)
//                                .foregroundColor(ColorConstants.Gray900)
//                                .minimumScaleFactor(0.5)
//                                .multilineTextAlignment(.leading)
//                                .frame(width: getRelativeWidth(70.0),
//                                       height: getRelativeHeight(16.0), alignment: .topLeading)
//                                .padding(.top, getRelativeHeight(20.0))
//                                .padding(.trailing, getRelativeWidth(10.0))
//                            HStack {
//                                Image("img_amigosavatara")
//                                    .resizable()
//                                    .frame(width: getRelativeWidth(32.0),
//                                           height: getRelativeWidth(32.0), alignment: .center)
//                                    .scaledToFit()
//                                    .clipped()
//                                Spacer()
//                                Image("img_amigosavatara_32X32")
//                                    .resizable()
//                                    .frame(width: getRelativeWidth(32.0),
//                                           height: getRelativeWidth(32.0), alignment: .center)
//                                    .scaledToFit()
//                                    .clipped()
//                                    .padding(.leading, getRelativeWidth(16.0))
//                            }
//                            .frame(width: getRelativeWidth(80.0), height: getRelativeHeight(32.0),
//                                   alignment: .leading)
//                            .padding(.top, getRelativeHeight(11.0))
//                            .padding(.trailing, getRelativeWidth(10.0))
//                            Button(action: {}, label: {
//                                HStack(spacing: 0) {
//                                    Text(StringConstants.kLblDeleteEvent)
//                                        .font(FontScheme.kInterBlack(size: getRelativeHeight(15.0)))
//                                        .fontWeight(.black)
//                                        .padding(.horizontal, getRelativeWidth(30.0))
//                                        .padding(.vertical, getRelativeHeight(15.0))
//                                        .foregroundColor(ColorConstants.Gray801)
//                                        .minimumScaleFactor(0.5)
//                                        .multilineTextAlignment(.leading)
//                                        .frame(width: getRelativeWidth(339.0),
//                                               height: getRelativeHeight(45.0),
//                                               alignment: .topLeading)
//                                        .background(RoundedCorners(topLeft: 22.0, topRight: 22.0,
//                                                                   bottomLeft: 22.0,
//                                                                   bottomRight: 22.0)
//                                                .fill(ColorConstants.Red4004c))
//                                        .padding(.top, getRelativeHeight(16.0))
//                                        .padding(.trailing, getRelativeWidth(4.0))
//                                }
//                            })
//                            .frame(width: getRelativeWidth(339.0), height: getRelativeHeight(45.0),
//                                   alignment: .topLeading)
//                            .background(RoundedCorners(topLeft: 22.0, topRight: 22.0,
//                                                       bottomLeft: 22.0, bottomRight: 22.0)
//                                    .fill(ColorConstants.Red4004c))
//                            .padding(.top, getRelativeHeight(16.0))
//                            .padding(.trailing, getRelativeWidth(4.0))
//                        }
//                        .frame(width: getRelativeWidth(343.0), height: getRelativeHeight(253.0),
//                               alignment: .center)
//                        .background(RoundedCorners(topLeft: 8.0, topRight: 8.0, bottomLeft: 8.0,
//                                                   bottomRight: 8.0))
//                        .padding(.vertical, getRelativeHeight(16.0))
//                        .padding(.horizontal, getRelativeWidth(16.0))
                    }
                    .frame(width: UIScreen.main.bounds.width, height: getRelativeHeight(768.0),
                           alignment: .leading)
                    
                   
//                    .background(RoundedCorners(topLeft: 8.0, topRight: 8.0, bottomLeft: 8.0,
//                                               bottomRight: 8.0))
                }
                .frame(width: UIScreen.main.bounds.width, alignment: .topLeading)
                .background(ColorConstants.WhiteA700)
                .padding(.top, getRelativeHeight(30.0))
                .padding(.bottom, getRelativeHeight(10.0))
                Group {
                    NavigationLink(destination: OptimalTimeView(particularEvent: event).environmentObject(viewModel),
                                   tag: "OptimalTimeView",
                                   selection: $eventViewModel.nextScreen,
                                   label: {
                                       EmptyView()
                                   })
                }
            }
            .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
            .background(ColorConstants.WhiteA700)
        }
    }
}

struct EventView_Previews: PreviewProvider {
    static var previews: some View {
        EventView(particularEvent: ["title":"null"]).environmentObject(AuthenticationViewModel())
    }
}
