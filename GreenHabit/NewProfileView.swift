
//
//  NewProfileView.swift
//  GreenHabit
//
//  Created by Anya Li on 9/23/23.
//

import SwiftUI

struct NewProfileView: View {
    @Environment(\.managedObjectContext) var context
    @EnvironmentObject var profileStore: ProfileStore
    @State var title: String=""
    @State var name: String=""
    @State private var selection = "Student"
    @State private var startTime : Date = Date()
    @State private var endTime : Date = Date()
    @State private var isShowingSheet = false
    @State var location : String = ""
    @State var a : String = ""
    @State var activity : String = ""
    @State var color : String = ""

    let titles = ["Student", "Office Worker", "Home makers"]
    var body: some View {
        ZStack{
            Color(hex: "f6efe7")
                .ignoresSafeArea()
            VStack{
                Text("Profile")
                    .font(.custom("KosugiMaru-Regular", size: 40))
                    .fontWeight(.bold)
                ScrollView{
                    VStack{
                        TextField("Enter your name", text: $name)
                            .font(.custom("KosugiMaru-Regular", size: 20))
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
                                    Text("Title: ")
                                    Text(selection)
                                }
                                .font(.headline)
                                .foregroundColor(.white)
                                .background(Color(hex: "CDD7B6"))
                                .cornerRadius(10)
                            ,
                            content: {
                                ForEach(titles, id: \.self){ option in
                                    HStack{
                                        Text(option)
                                    }
                                    .tag(option)
                                }
                            })
                        .pickerStyle(.inline)
                        
                        //                Text("Selected Title: \(selection)")
                        if(selection == "Student"){
                            VStack{
                                Text("School Start Time:")
                                TimePicker(currentDate: $startTime)
                                    .padding()
                                Text("School End Time:")
                                TimePicker(currentDate: $endTime)
                                    .padding()
                                Button("School Address", action: {isShowingSheet.toggle()})
                                    .buttonStyle(.bordered)
                                    .foregroundColor(.black)
                                    .tint(.gray)
                                Button("+ Add an after school activity") {
                                    a = "Enter Activity"
                                    color = "CDD7B6"
                                }
                                .padding(.top)
                                .foregroundColor(.black)
                                .buttonStyle(.borderedProminent)
                                .tint(Color(hex: "F6EFE8"))
                                .cornerRadius(10)
                                
                                
                                TextField(a, text: $activity)
                                    .padding()
                                    .background(Color(hex: color))
                                    .cornerRadius(15)
                                    .foregroundColor(Color.black)
                                    .padding(.horizontal)
                                
                                
                            }
                            
                        }
                        else if(selection == "Office Worker"){
                            VStack{
                                Text("Work Start Time:")
                                TimePicker(currentDate: $startTime)
                                    .padding()
                                Text("Work End Time:")
                                TimePicker(currentDate: $endTime)
                                    .padding()
                            }
                            
                        }
                        
                        NavigationLink("Add"){
                            Homepage(profile: ProfileItem(name: self.name, title: self.selection, startTime: self.startTime, endTime: self.endTime, activity: self.activity))
                                .navigationBarBackButtonHidden(true)
                                .navigationBarHidden(true)
                            
                            
                        }
                        .padding(.top)
                        .foregroundColor(Color.black)
                        .buttonStyle(.borderedProminent)
                        .tint(Color(hex: "F6EFE8"))
                        .cornerRadius(10)
                        .simultaneousGesture(TapGesture().onEnded {
                            profileStore.profile.append(ProfileItem(name: self.name, title: self.selection, startTime: self.startTime, endTime: self.endTime, activity: self.activity))
                        })
                        
                        
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
