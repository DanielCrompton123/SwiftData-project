//
//  Project.swift
//  Project Tracker
//
//  Created by Daniel Crompton on 19/04/2024.
//

import Foundation
import SwiftData


@Model
class Project: Identifiable {
    @Attribute(.unique) var id: String
    var name: String = ""
    var focus: String = ""
    var startDate: Date = Date()
    
    @Relationship(deleteRule: .cascade, inverse: \ProjectUpdate.project)
    var updates: [ProjectUpdate] = []
    
    var hours: Float = 0.0
    var sessions = 0
    var wins = 0
    
    init() {
        self.id = UUID().uuidString
    }
    
}
