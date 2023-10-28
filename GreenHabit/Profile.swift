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
            
            VStack {
                HStack{
                    Text("Profile")
                        .font(.custom("KosugiMaru-Regular", size: 40))
                        .fontWeight(.black)

                    Spacer()
                    
                    NavigationLink("edit"){
                        NewProfileView()
                            .navigationBarBackButtonHidden(true)
                            .navigationBarHidden(true)
                        
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

                        let activity = profileItem.activity
                        
                        let display = "Name: " + name + "\n\nTitle: " + title + "\n\nSchool Start Time: " + String(startHourCurrent) + ":" + String(startMinCurrent) + "\n\nSchool End Time: " + String(endHourCurrent) + ":" + String(endMinCurrent) + "\n\nSchool Address: Valley Christian High School\n100 Skyway Dr, Unit 110, San Jose, CA 95111, United States" + "\n\nAfter School Activity: " + activity
                        
                        Text(display)
                            .font(.subheadline)
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
