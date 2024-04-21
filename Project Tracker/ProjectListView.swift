//
//  ContentView.swift
//  Project Tracker
//
//  Created by Daniel Crompton on 19/04/2024.
//

import SwiftUI

struct ProjectListView: View {
    
    @State var newProject: Project?
    
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
                newProject = Project()
            }, label: {
                Image("Add")
            })
            .padding(.leading)
            
        }
        .sheet(item: $newProject) { project in
            AddProjectView(project: project)
                .presentationDetents([.height(250)])
        }
        
    }
    
}

#Preview {
    ProjectListView()
}
