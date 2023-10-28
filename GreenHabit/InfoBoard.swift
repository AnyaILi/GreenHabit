//
//  InfoBoard.swift
//  GreenHabit
//
//  Created by Anya Li on 10/19/23.
//

import SwiftUI
import UserNotifications

struct InfoBoard: View {
    @EnvironmentObject var profileStore: ProfileStore
    @State var t = 0
    @State var s = "Info1"
    var body: some View {
        var info = ["By the end of the century, greenhouse gas emissions from air conditioning will account for as much as a 0.5-degree Celsius rise in global temperatures. (World Economic Forum)", "The average 60-watt light bulb wastes up to 90% of its energy as heat. Leaving your lights on an extra 8 hours a day adds up to a waste of $900 a year.", "The carbon footprint of the average American is up to 16 tons, 4 times the global average. (The Nature Conservancy)", "32% of the average American’s carbon emissions are spent on home energy, including air conditioning, cooking, and lighting. (Union of Concerned Scientists)", "Turning your heater down to 120 degrees Fahrenheit will cut your water heating costs by 6-10 percent. (United States Environmental Protection Agency)"]
        
        ZStack(alignment: .top){
            Color(hex: "CDD7B6")
                .ignoresSafeArea()
            ZStack{
                Color(hex: "EAECE3")
                    .cornerRadius(30)
                VStack{
                    Image("Clock")
                        .resizable(resizingMode: .stretch)
                        .aspectRatio(contentMode: .fill)
                        .padding(.horizontal, 100.0)
                    ZStack(alignment: .leading){
                        Color(hex: "D9D9D9")
                            .cornerRadius(20)
                        Text("Info Board")
                            .font(.title)
                            .padding(.leading)
                    }
                    .frame(width: 280.0, height: 50.0)
                    ZStack(alignment: .leading){
                        Color(hex: "CDD7B6")
                            .cornerRadius(20)
                        
                        HStack{
                            Button{
                                let content = UNMutableNotificationContent()
                                content.title = "Park"
                                content.subtitle = "Leave no trace\nMinimize waste\nTake care not to disturb plants and animals"
                                content.sound = UNNotificationSound.default

                                
                                let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 10, repeats: false)
                                let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)

                                // add our notification request
                                UNUserNotificationCenter.current().add(request)
                                print("done")

                                if(t==0){
                                    t=4
                                }
                                else{
                                    t=t-1
                                }
                                if(t==0){
                                    s="Info1"
                                }
                                else if(t==1){
                                    s="Info2"
                                }
                                else if(t==2){
                                    s="Info3"
                                }
                                else if(t==3){
                                    s="Info4"
                                }
                                else if(t==4){
                                    s="Info5"
                                }
                            }label:{
                                Image(systemName: "chevron.left")
                                  .foregroundColor(Color.black)

                            }
                            VStack{
                                Image(s)
                                    .resizable(resizingMode: .stretch)
                                    .aspectRatio(contentMode: .fit)
                                    .padding(.top)
                                Text(info[t])
                                    .font(.title3)
                                    .padding()
                            }
                            Button{
                                if(t==4){
                                    t=0
                                }
                                else{
                                    t=t+1
                                }
                                if(t==0){
                                    s="Info1"
                                }
                                else if(t==1){
                                    s="Info2"
                                }
                                else if(t==2){
                                    s="Info3"
                                }
                                else if(t==3){
                                    s="Info4"
                                }
                                else if(t==4){
                                    s="Info5"
                                }

                            }label:{
                                Image(systemName: "chevron.right")
                                  .foregroundColor(Color.black)

                            }
                        }

                    }
                    .frame(width: 290.0, height: 500.0)
                }
                .padding(.vertical)
                
            }
            .padding(.top)
            .frame(width: 310.0, height: 690.0)
        }
    }
}

#Preview {
    InfoBoard().environmentObject(ProfileStore())
}
