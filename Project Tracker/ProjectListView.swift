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
    @State var selectedProject: Project?
    
    var body: some View {
        
        NavigationStack {
            
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
                                .onTapGesture {
                                    selectedProject = project // so that the navigation destination (on root element) is triggered
                                }
                                .onLongPressGesture {
                                    newProject = project // So that the sheet is trigered
                                }
                                
                            }
                        }
                    }
                    .scrollIndicators(.hidden)
                    
                }
                .foregroundStyle(.white)
                .padding(30)
                
                Button(action: {
                    newProject = Project()
                }, label: {
                    Image("Add project")
                })
                .padding()
                
            }
            .navigationDestination(item: $selectedProject) { project in
                ProjectDetailView(project: project)
                    .foregroundStyle(.black)
            }
            
        }
        .sheet(item: $newProject) { project in
            let isEditing = !project.name.isEmpty
            AddProjectView(project: project, editMode: isEditing)
                .presentationDetents([.fraction(0.5)])
        }

    }
    
}

#Preview {
    ProjectListView()
}
