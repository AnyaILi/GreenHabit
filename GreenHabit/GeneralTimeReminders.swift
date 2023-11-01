//
//  GeneralTimeReminders.swift
//  GreenHabit
//
//  Created by Anya Li on 10/26/23.
//

import SwiftUI
import UserNotifications
struct CheckToggleStyle: ToggleStyle {
    
    func makeBody(configuration: Configuration) -> some View {
        
        Button {
            configuration.isOn.toggle()
        } label: {
            Label {
                configuration.label
            } icon: {
                Image(systemName: configuration.isOn ? "checkmark.square.fill" : "square")
                    .foregroundStyle(configuration.isOn ? Color(hex: "000000") : .secondary)
                    .accessibility(label: Text(configuration.isOn ? "Checked" : "Unchecked"))
                    .imageScale(.large)
            }
        }
        .buttonStyle(.plain)
    }
}

struct GeneralTimeReminders: View {
    @State var time = "Reminders:"
    @State var message = "Turn off the lights."
    @State var message1 = "Reduce food waste."
    @State var message2 = "Walk, bike, carpool or use public transport"
    @State var message3 = "Click for Time Based Suggestions:"
    @State var m1 = false
    @State var m2 = false
    @State var m3 = false
    @State var shown = false
    var body: some View {
        ZStack{
            Color(hex: "f6efe7")
                .ignoresSafeArea()
            VStack{
                HStack{
                    Spacer()
                    Image("flower2")
                        .resizable(capInsets: EdgeInsets(), resizingMode: .stretch)
                        .aspectRatio(contentMode: .fit)
                        .padding(.trailing)
                        .frame(width: 100.0)
                        .rotationEffect(.degrees(180.0))
                }
                Spacer()
            }
            VStack{
                Spacer()
                HStack{
                    Image("flower3")
                        .resizable(capInsets: EdgeInsets(), resizingMode: .stretch)
                        .aspectRatio(contentMode: .fit)
                        .padding(.trailing)
                        .frame(width: 200.0)
                        .rotationEffect(.degrees(270.0))
                    Spacer()
                }
            }
            VStack{
                //        let time = ["8:00", "10:00", "12:00", "2:00", "4:00", "8:00", "10:00"]
                var timeSuggestions = ["Turn off the lights. Turn off devices.", "Print less. Use both sides of paper. Use digital resources, emails and e-books.", "Reduce food waste. Learn to compost and recycle.", "Walk, bike, carpool or use public transportation than drive.", "Reduce Screen Time. Spend more time outdoors and connect with nature", "Reduce food waste. Learn to compost and recycle.", "Take shorter showers. Turn off tap while brushing teeth. Unplug."]
                
                let dateCurrent = Date()
                let calendarCurrent = Calendar.current
                let hourCurrent = calendarCurrent.component(.hour, from: dateCurrent)
                let minCurrent = calendarCurrent.component(.minute, from: dateCurrent)
                
                Text(message3)
                    .font(.custom("AnnieUseYourTelescope-Regular", size: 25))


                Button{
                    m1 = false
                    m2 = false
                    m3 = false
                    if(hourCurrent>=6 && hourCurrent<10){
                        message = timeSuggestions[0]
                        message1 = timeSuggestions[1]
                        message2 = timeSuggestions[2]
                    }
                    else if(hourCurrent>=10 && hourCurrent<12){
                        message = timeSuggestions[1]
                        message1 = timeSuggestions[2]
                        message2 = timeSuggestions[3]
                    }
                    else if(hourCurrent>=12 && hourCurrent<14){
                        message = timeSuggestions[2]
                        message1 = timeSuggestions[3]
                        message2 = timeSuggestions[4]
                    }
                    else if(hourCurrent>=14 && hourCurrent<16){
                        message = timeSuggestions[3]
                        message1 = timeSuggestions[4]
                        message2 = timeSuggestions[5]
                    }
                    else if(hourCurrent>=16 && hourCurrent<20){
                        message = timeSuggestions[4]
                        message1 = timeSuggestions[5]
                        message2 = timeSuggestions[6]
                    }
                    else if(hourCurrent>=20 && hourCurrent<22){
                        message = timeSuggestions[5]
                        message1 = timeSuggestions[6]
                        message2 = timeSuggestions[0]
                    }
                    else if(hourCurrent>=22 && hourCurrent<=24){
                        message = timeSuggestions[6]
                        message1 = timeSuggestions[1]
                    }
                    var temp = hourCurrent
                    if(hourCurrent>12){
                        temp=hourCurrent-12
                    }
                    time = String(temp) + ":" + String(minCurrent)

                    if(minCurrent<10){
                        time = String(temp) + ":0" + String(minCurrent)
                    }
                    message3 = ""
                    
                } label:{
                    Image("Clock")
                        .resizable(resizingMode: .stretch)
                        .aspectRatio(contentMode: .fit)
                        .frame(height: 200.0)
                }
                //Spacer()

                
                VStack(alignment: .center){

                    Text(time)
                        .font(.custom("AnnieUseYourTelescope-Regular", size: 40))
//                        .padding(.leading, 50.0)

                                        //                    Text(message)
                    //                        .font(.title3)
                    //                    Text(message1)
                    //                        .font(.title3)
                    //                    Text(message2)
                    //                        .font(.title3)
                    VStack{
                        
                        HStack{
                            Toggle(isOn: $m1) {
                                
                                Text("")
                                
                            }
                            .toggleStyle(CheckToggleStyle())
                            
                            Text(message)
                                .font(.custom("AnnieUseYourTelescope-Regular", size: 20))

                            
                        }
                        .padding(.all)
                        HStack{
                            Toggle(isOn: $m2) {
                                
                                Text("")
                                
                            }
                            .toggleStyle(CheckToggleStyle())
                            
                            Text(message1)
                                .font(.custom("AnnieUseYourTelescope-Regular", size: 20))

                            
                        }
                        .padding(.all)
                        HStack{
                            Toggle(isOn: $m3) {
                                
                                Text("")
                                
                            }
                            .toggleStyle(CheckToggleStyle())
                            
                            Text(message2)
                                .font(.custom("AnnieUseYourTelescope-Regular", size: 20))

                            
                        }
                        .padding(.all)
                                                
                    }
                    .padding(.horizontal)
                }
                
                
                
            }
            .padding()
        }
        
    }
    
    
}


#Preview {
    GeneralTimeReminders()
}
