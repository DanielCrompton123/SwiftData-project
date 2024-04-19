//
//  Project_TrackerApp.swift
//  Project Tracker
//
//  Created by Daniel Crompton on 19/04/2024.
//

import SwiftUI
import SwiftData

@main
struct ProjectTrackerApp: App {
    var body: some Scene {
        WindowGroup {
            ProjectListView()
                .modelContainer(for: [Project.self, ProjectUpdate.self])
        }
    }
}
