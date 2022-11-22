import SwiftUI
import Firebase

struct OnboardAvailabilityScreenView: View {
    @StateObject var onboardAvailabilityScreenViewModel = OnboardAvailabilityScreenViewModel()
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var body: some View {
        VStack (alignment: .center, spacing: 0){
            
            // TOP HEADER BAR
            ZStack(alignment: .topLeading) {
                
                // WHEN ARE YOU FREE TEXT
                VStack (alignment: .leading, spacing: 0){
                    Text("When are")
                        .font(FontScheme.kInterRegular(size: getRelativeHeight(25)))
                        .foregroundColor(ColorConstants.Bluegray900)
                        .minimumScaleFactor(0.5)
                        .multilineTextAlignment(.leading)
                        .frame(width: getRelativeWidth(108.0),
                               height: getRelativeHeight(25), alignment: .leading)
                    Text("uFree?")
                        .font(FontScheme.kInterRegular(size: getRelativeHeight(30)))
                        .fontWeight(.bold)
                        .foregroundColor(ColorConstants.Bluegray900)
                        .minimumScaleFactor(0.5)
                        .multilineTextAlignment(.leading)
                        .frame(width: getRelativeWidth(108.0),
                               height: getRelativeHeight(40), alignment: .leading)
                        .padding(.top, getRelativeHeight(-5))
                    Text("Set your default availability.")
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
            
            
            // SCROLL VIEW FOR THE DAYS OF THE WEEK
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHStack {
                    ForEach(0 ... 6, id: \.self) { index in
                        
                        DaysTimeSele1Cell(index: index)
                    }
                }
                .padding(.horizontal, getRelativeWidth(25))
                .padding(.top, getRelativeHeight(-25))
            }
            .frame(width: UIScreen.main.bounds.width, height: getRelativeHeight(580))
            
            
            // SAVE AND CONTINUE BUTTON
            Button(action: {
                sendCalendarToFirebase()
                onboardAvailabilityScreenViewModel.nextScreen = "HomePageView"
            }, label: {
                Text("SAVE AND CONTINUE")
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

            })
            .frame(width: getRelativeWidth(295.0),
                   height: getRelativeHeight(60.0), alignment: .center)
            .background(RoundedCorners(topLeft: 28.5, topRight: 28.5,
                                       bottomLeft: 28.5, bottomRight: 28.5)
                .fill(ColorConstants.Red400))
            
            
            // NAVIGATION LINK GROUP
            Group {
                NavigationLink(destination: HomePageView(),
                               tag: "HomePageView",
                               selection: $onboardAvailabilityScreenViewModel.nextScreen,
                               label: {
                    EmptyView()
                })
            }
            
            
        }
        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height, alignment: .center)
        .padding(.top, 0)
        .background(ColorConstants.WhiteA700)
        .ignoresSafeArea()
        .hideNavigationBar()
        
    }
}

func sendCalendarToFirebase() {
    
    let ref = Database.database().reference()
    ref.child("calendar/emails").observeSingleEvent(of: .value, with: { snapshot in
        guard var emailArray = snapshot.value as? [String] else {
            return
        }
        print("Old Email Values: \(emailArray)")
        
        print(UserDefaults.standard.object(forKey: "email") as? String)
        emailArray.append(UserDefaults.standard.object(forKey: "email") as! String)
        ref.child("calendar/emails").setValue(emailArray)
        
        ref.child("calendar/preferences").observeSingleEvent(of: .value, with: { snapshot in
            guard var preferencesArray = snapshot.value as? [[Int]] else {
                return
            }
            
            var myNewArray = UserDefaults.standard.object(forKey: "listOfHours") as! [Int]
            myNewArray.sort()
            
            preferencesArray.append(myNewArray)
            ref.child("calendar/preferences").setValue(preferencesArray)
            print("Success")
        })
        
    })
}

struct OnboardAvailabilityScreenView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardAvailabilityScreenView()
    }
}
