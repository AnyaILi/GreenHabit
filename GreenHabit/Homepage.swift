//
//  Homepage.swift
//  GreenHabit
//
//  Created by Anya Li on 9/30/23.
//

import SwiftUI

struct Homepage: View {
    var profile = ProfileItem(name: "", title: "", startTime: Foundation.Date(), endTime: Foundation.Date(), lunchTime: Foundation.Date(), activity: "", bedTime: Foundation.Date())
    @StateObject private var viewModel: ContentViewModel

    init(profile: ProfileItem){
        _viewModel = StateObject(wrappedValue: ContentViewModel(/*profile: profile*/))

    }
    var body: some View {
        ZStack{
            Color(hex: "CDD7B6")
                .ignoresSafeArea()
            VStack{
                HStack{
                    Image("flower1")
                        .resizable(capInsets: EdgeInsets(), resizingMode: .stretch)
                        .aspectRatio(contentMode: .fit)
                        .padding(.trailing)
                        .frame(width: 150.0)
                    Spacer()
                }
                Spacer()
            }
            VStack{
                Spacer()
                HStack{
                    Spacer()
                    Image("flower3")
                        .resizable(capInsets: EdgeInsets(), resizingMode: .stretch)
                        .aspectRatio(contentMode: .fit)
                        .padding(.trailing)
                        .frame(width: 150.0)
                        .rotationEffect(.degrees(180.0))
                }
            }

            VStack{
                Image("Clock")
                    .resizable(resizingMode: .stretch)
                    .aspectRatio(contentMode: .fit)
                    .padding(.horizontal, 75.0)
                Text("Welcome!")
                    .font(.custom("AnnieUseYourTelescope-Regular", size: 30))
                    .frame(maxWidth: .infinity, alignment: .center)
                    .foregroundColor(Color(hex: "8b8b8b"))
                    .padding(.horizontal, 30)
                    .padding(.vertical, 10)
                    .background(Color(hex: "eaece2"))
                    .mask(RoundedRectangle(cornerRadius: 20))
                    .shadow(radius:5)
                    .padding()
                
                NavigationLink(destination: InfoBoard()) {
                     HStack{
                       VStack(alignment: .leading){
                         Text("Info Board")
                               .font(.custom("AnnieUseYourTelescope-Regular", size: 30))
                           .foregroundColor(Color(hex: "8b8b8b"))
                           
                    }
                       .frame(maxWidth: .infinity, alignment: .leading)
                       Image(systemName: "chevron.right")
                         .foregroundColor(Color.black)
                     }
                     .padding(.horizontal, 30)
                     .padding(.vertical, 10)
                     .background(Color(hex: "eaece2"))
                     .mask(RoundedRectangle(cornerRadius: 20))
                     .shadow(radius:5)
                   }
                   .padding()
                

                

                NavigationLink(destination: GeneralTimeReminders()) {
                     HStack{
                       VStack(alignment: .leading){
                         Text("General Reminders")
                               .font(.custom("AnnieUseYourTelescope-Regular", size: 30))
                           .foregroundColor(Color(hex: "8b8b8b"))
                           
                    }
                       .frame(maxWidth: .infinity, alignment: .leading)
                       Image(systemName: "chevron.right")
                         .foregroundColor(Color.black)
                     }
                     .padding(.horizontal, 30)
                     .padding(.vertical, 10)
                     .background(Color(hex: "eaece2"))
                     .mask(RoundedRectangle(cornerRadius: 20))
                     .shadow(radius:5)
                   }
                   .padding()
                
                NavigationLink(destination: Profile()) {
                     HStack{
                       VStack(alignment: .leading){
                         Text("Profile")
                               .font(.custom("AnnieUseYourTelescope-Regular", size: 30))
                           .foregroundColor(Color(hex: "8b8b8b"))
                           
                    }
                       .frame(maxWidth: .infinity, alignment: .leading)
                       Image(systemName: "chevron.right")
                         .foregroundColor(Color.black)
                     }
                     .padding(.horizontal, 30)
                     .padding(.vertical, 10)
                     .background(Color(hex: "eaece2"))
                     .mask(RoundedRectangle(cornerRadius: 20))
                     .shadow(radius:5)
                   }
                   .padding()

//                Button("Schedule Notification") {
//                    TimeNotifications(profile: profile)
//                }
            }
        }
        
    }
}

#Preview {
    Homepage(profile: ProfileItem(name: "", title: "", startTime: Foundation.Date(), endTime: Foundation.Date(), lunchTime: Foundation.Date(), activity: "", bedTime: Foundation.Date()))
}
