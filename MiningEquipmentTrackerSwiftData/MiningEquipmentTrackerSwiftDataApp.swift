//
//  MiningEquipmentTrackerSwiftDataApp.swift
//  MiningEquipmentTrackerSwiftData
//
//  Created by Jacob Spence on 1/31/25.
//

import SwiftUI
import SwiftData

@main
struct MiningEquipmentTrackerSwiftDataApp: App {
    // Create the model container with your model types
    var container: ModelContainer = {
        do {
            let container = try ModelContainer(for: Equipment.self, Part.self, PartSet.self)
            return container
        } catch {
            fatalError("Failed to create ModelContainer: \(error)")
        }
    }()

    // For simple mock login
    @StateObject var userSession = UserSession()

    var body: some Scene {
        WindowGroup {
            // If logged in, show MainTabView, else show LoginView
            if userSession.isLoggedIn {
                MainTabView()
                    .environment(\.modelContext, container.mainContext)
                    .environmentObject(userSession)
            } else {
                LoginView()
                    .environment(\.modelContext, container.mainContext)
                    .environmentObject(userSession)
            }
        }
    }
}
