//
//  ProjectCard.swift
//  Project Tracker
//
//  Created by Daniel Crompton on 20/04/2024.
//

import SwiftUI

struct ProjectCard: View {
    var body: some View {
        

        VStack(alignment: .leading, spacing: 10) {
            
            Text("Daniel Crompton")
                .font(.prjBigHeadline)
                .foregroundStyle(.white)
            
            HStack {
                Spacer()
                
                TextBubble(title: "Hours", content: "230", color1Name: "Navy", color2Name: "Blue")
                TextBubble(title: "Sessions", content: "34", color1Name: "Green", color2Name: "Lime")
                TextBubble(title: "Updates", content: "6", color1Name: "Deep purple", color2Name: "Purple")
                TextBubble(title: "Wins", content: "3", color1Name: "Maroon", color2Name: "Olive")
                
                Spacer()
            }
            
            Text("My current focus is...")
                .font(.prjFeaturedText)
                .foregroundStyle(.gray)
            Text("Design the new website")
                .font(.prjFeaturedText)
                .fontWeight(.bold)
                .foregroundStyle(.gray)
            
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

#Preview {
    ProjectCard()
}
