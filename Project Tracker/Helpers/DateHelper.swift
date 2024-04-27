//
//  DateHelper.swift
//  Project Tracker
//
//  Created by Daniel Crompton on 27/04/2024.
//

import Foundation


struct DateHelper {
    
    static func convertDate(_ date: Date) -> String {
        let f = DateFormatter()
        f.dateFormat = "EEEE, MMMM d, yyyy"
        return f.string(from: date)
    }
    
}
