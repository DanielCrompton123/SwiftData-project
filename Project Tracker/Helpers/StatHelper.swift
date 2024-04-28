//
//  StatHelper.swift
//  Project Tracker
//
//  Created by Daniel Crompton on 28/04/2024.
//

import SwiftUI

struct StatHelper {
    
    // Call this after adding
    static func updateAdded(project: Project, update: ProjectUpdate) {
        // Add hours
        project.hours += update.hours
        
        // Add wins
        if update.updateType == .milestone {
            project.wins += 1
        }
        
        // Add sessions, should be getting the other updates on the same date as the project update
        if sameDayUpdates(for: project, date: update.date).count == 1 {
            // This is the first update of today
            project.sessions += 1
        }
    }
    
    
    // Call this after deleting
    static func updateDeleted(project: Project, update: ProjectUpdate) {
        // Remove an hour
        project.hours -= update.hours
        
        // If a milestone remove a win
        if update.updateType == .milestone {
            project.wins -= 1
        }
        
        // Deduct a session if this is the only update of today
        if sameDayUpdates(for: project, date: update.date).count == 0 {
            project.sessions -= 1
        }
    }
    
    
    static func updateEdited(project: Project, difference: Float) {
        project.hours += difference
    }
    
    
    static private func sameDayUpdates(for project: Project, date: Date) -> [ProjectUpdate] {
        return project.updates.filter({ Calendar.current.isDate(date, inSameDayAs: $0.date) })
    }
    
}
