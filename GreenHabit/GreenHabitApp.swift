//
//  GreenHabitApp.swift
//  GreenHabit
//
//  Created by Anya Li on 10/25/23.
//

import SwiftUI

@main
struct GreenHabitApp: App {
    @StateObject var store = ProfileStore()
//    let persistenceController = PersistenceController.shared
//    init(){
//        let center = UNUserNotificationCenter.current()
//        center.requestAuthorization(options: [.alert, .sound, .badge]) {result, error in if let error = error {
//                print(error)
//            }
//        }
//    }

    var body: some Scene {
        WindowGroup {
            ContentView() {
                Task {
                    do {
                        try await store.save(scrums: store.profile)
                    } catch {
                        fatalError(error.localizedDescription)
                    }
                }
            }
            .task {
                do {
                    try await store.load()
                } catch {
                    fatalError(error.localizedDescription)
                }
            }
            .environmentObject(store)
            
        }
    }
}
