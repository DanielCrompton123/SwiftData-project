//
//  ProjectCard.swift
//  Project Tracker
//
//  Created by Daniel Crompton on 20/04/2024.
//

import SwiftUI

struct ProjectCard: View {
    
    var project: Project
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 10) {
            
            Text(project.name)
                .font(.prjBigHeadline)
                .foregroundStyle(.white)
            
            HStack(spacing: 10) {
                Spacer()
                
                TextBubble(title: "Hours", content: String(project.hours), color1Name: "Navy", color2Name: "Sky blue")
                TextBubble(title: "Sessions", content: String(project.sessions), color1Name: "Green", color2Name: "Lime")
                TextBubble(title: "Updates", content: String(project.updates.count), color1Name: "Deep purple", color2Name: "Fuschia")
                TextBubble(title: "Wins", content: String(project.wins), color1Name: "Maroon", color2Name: "Olive")
                
                Spacer()
            }
            
            if !project.focus.isEmpty {
                
                Text("My current focus is...")
                    .font(.prjFeaturedText)
                    .foregroundStyle(.gray)
                Text(project.focus)
                    .font(.prjFeaturedText)
                    .fontWeight(.bold)
                    .foregroundStyle(.gray)
                
            }
            
        }
        .padding(.vertical, 10)
        .padding(.horizontal, 20)
        .background {
            RoundedRectangle(cornerRadius: 15)
                .opacity(0.7)
                .foregroundStyle(.black)
                .shadow(radius: 5, x: 0, y: 4)

        }

    }
}
