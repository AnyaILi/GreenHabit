
//
//  NewProfileView.swift
//  GreenHabit
//
//  Created by Anya Li on 9/23/23.
//

import SwiftUI
import UserNotifications

struct NewProfileView: View {
    @Environment(\.managedObjectContext) var context
    @EnvironmentObject var profileStore: ProfileStore
    @State var title: String=""
    @State var name: String=""
    @State private var selection = "Student"
    @State private var startTime : Date = Date()
    @State private var endTime : Date = Date()
    @State private var lunchTime : Date = Date()
    @State private var bedTime : Date = Date()
    @State private var isShowingSheet = false
    @State var location : String = ""
    @State var address : String = ""
    @State var a : String = ""
    @State var activity : String = ""
    @State var color : String = ""

    let titles = ["Student", "Office Worker", "Homemaker"]
    var body: some View {
        ZStack{
            Color(hex: "f6efe7")
                .ignoresSafeArea()
            VStack{
                HStack{
                    Spacer()
                    Image("flower1")
                        .resizable(capInsets: EdgeInsets(), resizingMode: .stretch)
                        .aspectRatio(contentMode: .fit)
                        .padding(.trailing)
                        .frame(width: 100.0)
                }
                Spacer()
            }

            VStack{
                Text("Profile")
                    .font(.custom("AnnieUseYourTelescope-Regular", size: 40))
                    .fontWeight(.bold)
                ScrollView{
                    VStack{
                        TextField("Enter your name", text: $name)
                            .font(.custom("AnnieUseYourTelescope-Regular", size: 20))
                            .padding()
                            .background(Color(hex: "CDD7B6"))
                            .cornerRadius(15)
                            .padding([.top, .leading, .trailing])
                        
                        //                Menu("Title") {
                        //                    Text("Student")
                        //                    Text("Office Worker")
                        //                    Text("Menu Item 3")
                        //                }
                        //                .menuStyle(MenuButtonStyle())
                        
                        Picker(
                            selection: $selection,
                            label:
                                HStack{
                                    Text("Occupation: ")
                                    Text(selection)
                                        .font(.custom("AnnieUseYourTelescope-Regular", size: 20))
                                }
                                .background(Color(hex: "CDD7B6"))
                                .cornerRadius(10)
                            ,
                            content: {
                                ForEach(titles, id: \.self){ option in
                                    HStack{
                                        Text(option)
                                            .font(.custom("AnnieUseYourTelescope-Regular", size: 20))
                                    }
                                    .tag(option)
                                }
                            })
                        .padding(.horizontal)
                        .pickerStyle(.inline)
                        
                        //                Text("Selected Title: \(selection)")
                        if(selection == "Student"){
                            VStack{
                                Text("Home Address:")
                                    .font(.custom("AnnieUseYourTelescope-Regular", size: 20))

                                Button{
                                    isShowingSheet.toggle()
                                    address = "11177 Linda Vista Dr"
                                }label:{
                                    Image(systemName: "location.fill")
                                }
                                .font(.custom("AnnieUseYourTelescope-Regular", size: 20))

                                    .buttonStyle(.bordered)
                                    .foregroundColor(.black)
                                    .tint(.gray)
                                Text(address)
                                    .font(.custom("AnnieUseYourTelescope-Regular", size: 20))
                                    .padding(.bottom)

                                Text("School Start Time:")
                                    .font(.custom("AnnieUseYourTelescope-Regular", size: 20))
                                TimePicker(currentDate: $startTime)
                                
                                    .padding(.bottom)
                                Text("School End Time:")
                                    .font(.custom("AnnieUseYourTelescope-Regular", size: 20))

                                TimePicker(currentDate: $endTime)
                                    .padding(.bottom)
                                
                                Text("School Address")
                                    .padding(.top)
                                    .font(.custom("AnnieUseYourTelescope-Regular", size: 20))

                                Button{
                                    isShowingSheet.toggle()
                                    location = "Valley Christian High School"
                                }label:{
                                    Image(systemName: "location.fill")
                                }
                                .font(.custom("AnnieUseYourTelescope-Regular", size: 20))

                                    .buttonStyle(.bordered)
                                    .foregroundColor(.black)
                                    .tint(.gray)
                                Text(location)
                                    .font(.custom("AnnieUseYourTelescope-Regular", size: 20))

                                
                                Text("Lunch Time:")
                                    .font(.custom("AnnieUseYourTelescope-Regular", size: 20))
                                    .padding(.top)
                                TimePicker(currentDate: $lunchTime)
                                Button("+ Add an after school activity") {
                                    a = "Enter Activity"
                                    color = "CDD7B6"
                                }
                                .font(.custom("AnnieUseYourTelescope-Regular", size: 20))
                                .padding(.top)
                                .foregroundColor(.black)
                                .buttonStyle(.borderedProminent)
                                .tint(Color(hex: "e3ded8"))
                                .cornerRadius(10)
                                
                                                                
                                TextField(a, text: $activity)
                                    .font(.custom("AnnieUseYourTelescope-Regular", size: 20))
                                    .padding()
                                    .background(Color(hex: color))
                                    .cornerRadius(15)
                                    .foregroundColor(Color.black)
                                    .padding(.horizontal)
                                
                                Text("Bed Time:")
                                    .font(.custom("AnnieUseYourTelescope-Regular", size: 20))
                                    .padding(.top)
                                TimePicker(currentDate: $bedTime)


                                
                                
                            }
                            
                        }
                        else if(selection == "Office Worker"){
                            VStack{
                                Text("Home Address:")
                                    .font(.custom("AnnieUseYourTelescope-Regular", size: 20))

                                Button{
                                    isShowingSheet.toggle()
                                    address = "11177 Linda Vista Dr"
                                }label:{
                                    Image(systemName: "location.fill")
                                }
                                .font(.custom("AnnieUseYourTelescope-Regular", size: 20))

                                    .buttonStyle(.bordered)
                                    .foregroundColor(.black)
                                    .tint(.gray)
                                Text(address)
                                    .font(.custom("AnnieUseYourTelescope-Regular", size: 20))
                                    .padding(.bottom)
                                Text("Work Start Time:")
                                    .font(.custom("AnnieUseYourTelescope-Regular", size: 20))

                                TimePicker(currentDate: $startTime)
                                    .padding()
                                Text("Work End Time:")
                                    .font(.custom("AnnieUseYourTelescope-Regular", size: 20))

                                TimePicker(currentDate: $endTime)
                                    .padding()
                                
                                Text("Work Address")
                                    .padding(.top)
                                    .font(.custom("AnnieUseYourTelescope-Regular", size: 20))

                                Button{
                                    isShowingSheet.toggle()
//                                    location = "Valley Christian High School"
                                }label:{
                                    Image(systemName: "location.fill")
                                }
                                .font(.custom("AnnieUseYourTelescope-Regular", size: 20))

                                    .buttonStyle(.bordered)
                                    .foregroundColor(.black)
                                    .tint(.gray)
                                Text("")
                                    .font(.custom("AnnieUseYourTelescope-Regular", size: 20))

                                
                                Text("Lunch Time:")
                                    .font(.custom("AnnieUseYourTelescope-Regular", size: 20))
                                    .padding(.top)
                                TimePicker(currentDate: $lunchTime)
                                Button("+ Meeting Times") {
                                    a = "Enter Meeting Time"
                                    color = "CDD7B6"
                                }
                                .font(.custom("AnnieUseYourTelescope-Regular", size: 20))
                                .padding(.top)
                                .foregroundColor(.black)
                                .buttonStyle(.borderedProminent)
                                .tint(Color(hex: "e3ded8"))
                                .cornerRadius(10)
                                
                                                                
                                TextField(a, text: $activity)
                                    .font(.custom("AnnieUseYourTelescope-Regular", size: 20))
                                    .padding()
                                    .background(Color(hex: color))
                                    .cornerRadius(15)
                                    .foregroundColor(Color.black)
                                    .padding(.horizontal)
                                
                                Text("Upcoming Business Trip")
                                    .padding(.top)
                                    .font(.custom("AnnieUseYourTelescope-Regular", size: 20))

                                Button{
                                    isShowingSheet.toggle()
//                                    location = "Valley Christian High School"
                                }label:{
                                    Image(systemName: "location.fill")
                                }
                                .font(.custom("AnnieUseYourTelescope-Regular", size: 20))

                                    .buttonStyle(.bordered)
                                    .foregroundColor(.black)
                                    .tint(.gray)
                                DatePicker(selection: $endTime, label: {
                                    VStack{
                                        Text("Date:")
                                            .font(.custom("AnnieUseYourTelescope-Regular", size: 20))
                                    }

                                })
                                .padding()
                                
                                Text("Bed Time:")
                                    .font(.custom("AnnieUseYourTelescope-Regular", size: 20))
                                    .padding(.top)
                                TimePicker(currentDate: $bedTime)
                            }
                            
                        }
                        
                        else if (selection == "Homemaker"){
                            VStack{
                                Text("Home Address:")
                                    .font(.custom("AnnieUseYourTelescope-Regular", size: 20))

                                Button{
                                    isShowingSheet.toggle()
                                    address = "11177 Linda Vista Dr"
                                }label:{
                                    Image(systemName: "location.fill")
                                }
                                .font(.custom("AnnieUseYourTelescope-Regular", size: 20))

                                    .buttonStyle(.bordered)
                                    .foregroundColor(.black)
                                    .tint(.gray)
                                Text(address)
                                    .font(.custom("AnnieUseYourTelescope-Regular", size: 20))
                                    .padding(.bottom)
                                                                
                                Text("Lunch Preparation Time:")
                                    .font(.custom("AnnieUseYourTelescope-Regular", size: 20))
                                TimePicker(currentDate: $lunchTime)
                                Button("+ House Chore") {
                                    a = "Enter Meeting Time"
                                    color = "CDD7B6"
                                }
                                .font(.custom("AnnieUseYourTelescope-Regular", size: 20))
                                .padding(.top)
                                .foregroundColor(.black)
                                .buttonStyle(.borderedProminent)
                                .tint(Color(hex: "e3ded8"))
                                .cornerRadius(10)
                                
                                                                
                                TextField(a, text: $activity)
                                    .font(.custom("AnnieUseYourTelescope-Regular", size: 20))
                                    .padding()
                                    .background(Color(hex: color))
                                    .cornerRadius(15)
                                    .foregroundColor(Color.black)
                                    .padding(.horizontal)
                                
                                Text("House Chore Time:")
                                    .font(.custom("AnnieUseYourTelescope-Regular", size: 20))
                                    .padding(.top)
                                TimePicker(currentDate: $bedTime)

                                                                
                                Text("Bed Time:")
                                    .font(.custom("AnnieUseYourTelescope-Regular", size: 20))
                                    .padding(.top)
                                TimePicker(currentDate: $bedTime)
                            }

                        }
                        ZStack{
                            VStack{
                                Spacer()
                                HStack{
                                    Image("flower2")
                                        .resizable(capInsets: EdgeInsets(), resizingMode: .stretch)
                                        .aspectRatio(contentMode: .fit)
                                        .padding(.leading)
                                        .frame(width: 100.0)
                                    Spacer()
                                }
                            }
                            
                            NavigationLink("Add"){
                                Homepage(profile: ProfileItem(name: self.name, title: self.selection, startTime: self.startTime, endTime: self.endTime, lunchTime: self.lunchTime, activity: self.activity, bedTime: self.bedTime))
                                    .navigationBarBackButtonHidden(true)
                                    .navigationBarHidden(true)
                                
                                
                            }
                            .font(.custom("AnnieUseYourTelescope-Regular", size: 20))
                            .padding(.top)
                            .foregroundColor(Color.black)
                            .buttonStyle(.borderedProminent)
                            .tint(Color(hex: "CCAC95"))
                            .cornerRadius(10)
                            .simultaneousGesture(TapGesture().onEnded {
                                UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { success, error in
                                    if success {
                                        print("All set!")
                                    } else if let error = error {
                                        print(error.localizedDescription)
                                    }
                                }
                                
                                profileStore.profile.append(ProfileItem(name: self.name, title: self.selection, startTime: self.startTime, endTime: self.endTime, lunchTime: self.lunchTime, activity: self.activity, bedTime: self.bedTime))
                            })
                            
                        }
                    }
                }
                .sheet(isPresented: $isShowingSheet){
                    AddressPicker(locationSearchService: LocationSearchService())
                }
            }
        }
    }
    
    func didDismiss() {
        // Handle the dismissing action.
    }
    private func addTask(name: String, title: String, startTime: Date, endTime: Date) {
        
        //        let task = Profile1(context: context)
        //        task.id = UUID()
        //        task.title = title
        //        task.name = name
        //        task.startTime = startTime
        //
        //        do {
        //                    try context.save()
        //        } catch {
        //                    print(error)
        //        }
        
    }
}
        

#Preview {
    NewProfileView().environmentObject(ProfileStore())
}
