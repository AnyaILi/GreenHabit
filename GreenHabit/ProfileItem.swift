//
//  ProfileItem.swift
//  GreenHabit
//
//  Created by Anya Li on 9/23/23.
//

import Foundation
class ProfileItem: Identifiable, Codable{
    
    var title : String
    var id = UUID()
    var name : String
    var startTime: Date
    var endTime: Date
    var activity: String
    
    
    init(name: String, title: String, startTime: Date, endTime: Date, activity: String){
        self.title = title
        self.name = name
        self.startTime = startTime
        self.endTime = endTime
        self.activity = activity
    }
}
