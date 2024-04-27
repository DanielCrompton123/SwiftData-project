//
//  ProjectUpdate.swift
//  Project Tracker
//
//  Created by Daniel Crompton on 19/04/2024.
//

import Foundation
import SwiftData


@Model
class ProjectUpdate: Identifiable {
    @Attribute(.unique) var id: String
    var headline: String
    var summary: String
    var date: Date
    var hours: Float
    var updateType: ProjectUpdateType
    
    var project: Project?
    
    init(headline: String = "", summary: String = "", hours: Float = 0, updateType: ProjectUpdateType = ProjectUpdateType.log) {
        self.id = UUID().uuidString
        self.headline = headline
        self.summary = summary
        self.date = Date()
        self.hours = hours
        self.updateType = updateType
    }
}


enum ProjectUpdateType: Codable {
    case log, milestone
}
