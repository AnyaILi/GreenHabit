//
//  Profile.swift
//  GreenHabit
//
//  Created by Anya Li on 10/19/23.
//



import SwiftUI
import Foundation

struct Profile: View {
    @Environment(\.managedObjectContext) var context
    @EnvironmentObject var profileStore: ProfileStore
    @State private var showNewTask = false
    let dateFormatter = DateFormatter()
    var body: some View {
        ZStack{
            Color(hex: "f6efe7")
                .ignoresSafeArea()
            VStack{
                HStack{
                    Image("flower3")
                        .resizable(capInsets: EdgeInsets(), resizingMode: .stretch)
                        .aspectRatio(contentMode: .fit)
                        .padding(.trailing)
                        .frame(width: 160.0)
                    Spacer()
                }
                Spacer()
            }
            VStack {
                HStack{
                    Text("Profile")
                        .font(.custom("AnnieUseYourTelescope-Regular", size: 40))
                        .fontWeight(.black)
                        .padding(.leading, 50.0)
                        .padding(.top)

                    Spacer()
                    
                    NavigationLink("edit"){
                        NewProfileView()
//                            .navigationBarBackButtonHidden(true)
//                            .navigationBarHidden(true)
                        
                    }
                    .foregroundColor(Color.black)
                    .buttonStyle(.borderedProminent)
                    .tint(Color(hex: "8b9475"))
                    .cornerRadius(10)
                                        
                }
                .padding()
                Spacer()
                List {
                    ForEach(profileStore.profile) { profileItem in
                        let name = profileItem.name
                        let title = profileItem.title
                        
                        let startTime = profileItem.startTime
                        let startCalendarCurrent = Calendar.current
                        let startHourCurrent = startCalendarCurrent.component(.hour, from: startTime)
                        let startMinCurrent = startCalendarCurrent.component(.minute, from: startTime)
                        
                        let endTime = profileItem.endTime
                        let endCalendarCurrent = Calendar.current
                        let endHourCurrent = endCalendarCurrent.component(.hour, from: endTime) - 12
                        let endMinCurrent = endCalendarCurrent.component(.minute, from: endTime)
                        
                        let lunchTime = profileItem.lunchTime
                        let lunchCalendarCurrent = Calendar.current
                        let lunchHourCurrent = lunchCalendarCurrent.component(.hour, from: lunchTime)
                        let lunchMinCurrent = lunchCalendarCurrent.component(.minute, from: lunchTime)


                        let activity = profileItem.activity
                        
                        let bedTime = profileItem.bedTime
                        let bedCalendarCurrent = Calendar.current
                        let bedHourCurrent = bedCalendarCurrent.component(.hour, from: bedTime)-12
                        let bedMinCurrent = bedCalendarCurrent.component(.minute, from: bedTime)

                        
                        let displayName = "Name: " + name
                        
                        Text(displayName)
                            .font(.custom("AnnieUseYourTelescope-Regular", size: 20))
                            .foregroundColor(Color(hex: "000000"))
                        
                        let displayOccupation = "Occupation: " + title
                        
                        Text(displayOccupation)
                            .font(.custom("AnnieUseYourTelescope-Regular", size: 20))
                            .foregroundColor(Color(hex: "000000"))
                        
                        let displaySchoolStartTime = "School Start Time: " + String(startHourCurrent) + ":0" + String(startMinCurrent)
                        
                        Text(displaySchoolStartTime)
                            .font(.custom("AnnieUseYourTelescope-Regular", size: 20))
                            .foregroundColor(Color(hex: "000000"))
                        
                        let displaySchoolEndTime = "School End Time: " + String(endHourCurrent) + ":" + String(endMinCurrent)
                        
                        Text(displaySchoolEndTime)
                            .font(.custom("AnnieUseYourTelescope-Regular", size: 20))
                            .foregroundColor(Color(hex: "000000"))
                        
                        let displaySchoolAddress = "School Address: \nValley Christian High School\n100 Skyway Dr, Unit 110, San Jose, CA 95111, United States"

                        Text(displaySchoolAddress)
                            .font(.custom("AnnieUseYourTelescope-Regular", size: 20))
                            .foregroundColor(Color(hex: "000000"))

                        let displayLunchTime = "Lunch Time: " + String(lunchHourCurrent) + ":0" + String(lunchMinCurrent)
                        
                        Text(displayLunchTime)
                            .font(.custom("AnnieUseYourTelescope-Regular", size: 20))
                            .foregroundColor(Color(hex: "000000"))
                        
                        let displayAfterSchoolActivity = "After School Activity: " + activity
                        
                        Text(displayAfterSchoolActivity)
                            .font(.custom("AnnieUseYourTelescope-Regular", size: 20))
                            .foregroundColor(Color(hex: "000000"))
                        
                        let displayBedTime =  "Bed Time: " + String(bedHourCurrent) + ":" + String(bedMinCurrent)
                        
                        Text(displayBedTime)
                            .font(.custom("AnnieUseYourTelescope-Regular", size: 20))
                            .foregroundColor(Color(hex: "000000"))



                    }

                    
                    
                }
                 .listStyle(.plain)
                
                
            }
        }
        
        if showNewTask {
            NewProfileView()
        }
    
                
    }

}

#Preview {
    Profile().environmentObject(ProfileStore())
}
