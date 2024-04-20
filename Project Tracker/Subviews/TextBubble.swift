//
//  TextBubble.swift
//  Project Tracker
//
//  Created by Daniel Crompton on 20/04/2024.
//

import SwiftUI

struct TextBubble: View {
    
    @State var title: String
    @State var content: String
    @State var color1Name: String
    @State var color2Name: String
    
    var body: some View {
        
        VStack {
            Text(title)
                .font(.prjCaptionText)
            Text(content)
                .font(.prjFeaturedNumber)
                .fontWeight(.bold)
        }
        .foregroundStyle(.white)
        .padding(.horizontal, 10)
        .padding(.vertical, 5)
        .frame(width: 60, height: 40)
        .background {
            RoundedRectangle(cornerRadius: 15)
                .foregroundStyle(LinearGradient(colors: [Color(color1Name), Color(color2Name)], startPoint: .topLeading, endPoint: .bottomTrailing))
                .opacity(0.7)
        }

    }
}

#Preview {
    TextBubble(title: "Hours", content: "230", color1Name: "Navy", color2Name: "Blue")
}
