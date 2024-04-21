//
//  ContentView.swift
//  Project Tracker
//
//  Created by Daniel Crompton on 19/04/2024.
//

import SwiftUI
import SwiftData

struct ProjectListView: View {
    
    @Environment(\.modelContext) private var context
    @Query private var projects: [Project]
    
    
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
                        ForEach(projects) { project in
                            ProjectCard(project: project)
                        }
                    }
                }
                .scrollIndicators(.hidden)
                                
            }
            .foregroundStyle(.white)
            .padding()
            
            Button(action: {
                newProject = Project()
            }, label: {
                Image("Add project")
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
