//
//  ContentView.swift
//  Project Tracker
//
//  Created by Daniel Crompton on 19/04/2024.
//

import SwiftUI

struct ProjectListView: View {
    
    var body: some View {
        
        ZStack(alignment: .bottomLeading) {
            
            LinearGradient(colors: [Color("Deep purple"), Color("Blush")], startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()

            VStack(alignment: .leading) {
                
                Text("Projects")
                    .font(Font.prjScreenHeading)
                
                ScrollView {
                    VStack(spacing: 20) {
                        ProjectCard()
                        ProjectCard()
                        ProjectCard()
                        ProjectCard()
                        ProjectCard()
                        ProjectCard()
                        ProjectCard()
                    }
                }
                .scrollIndicators(.hidden)
                                
            }
            .foregroundStyle(.white)
            .padding()
            
            Button(action: {
                
            }, label: {
                Image("Add")
            })
            .padding(.leading)
            
        }
        
    }
    
}

#Preview {
    ProjectListView()
}
