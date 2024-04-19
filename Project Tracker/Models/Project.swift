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
    var name: String
    var startDate: Date
    var focus: String
    
    @Relationship(deleteRule: .cascade, inverse: \ProjectUpdate.project)
    var updates: [ProjectUpdate] = []
    
    init(name: String, focus: String) {
        self.id = UUID().uuidString
        self.name = name
        self.startDate = Date()
        self.focus = focus
    }
}
