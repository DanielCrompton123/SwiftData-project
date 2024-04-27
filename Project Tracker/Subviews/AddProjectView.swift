//
//  AddProjectView.swift
//  Project Tracker
//
//  Created by Daniel Crompton on 21/04/2024.
//

import SwiftUI
import SwiftData

struct AddProjectView: View {
    
    @Environment(\.modelContext) private var context
    @Environment(\.dismiss) private var dismiss
    @State private var showsConfirmation = false
    
    var project: Project
    @State private var projectName = ""
    
    var editMode: Bool
    
    var body: some View {
        
        ZStack {
            
            if editMode {
                LinearGradient(colors: [Color("Washed blue"), Color.black], startPoint: .topLeading, endPoint: .bottomTrailing)
                    .ignoresSafeArea()
            } else {
                Color.black
                    .ignoresSafeArea()
            }
            
            VStack(spacing: 30) {
                Text(editMode ? "Edit project" : "Add project")
                    .font(.prjBigHeadline)
                
                AddField(title: "Name", value: $projectName)
                
                Button(action: {
                    // Save the project to SwiftData
                    if editMode {
                        project.name = projectName
                    } else {
                        project.name = projectName
                        context.insert(project)
                    }
                    
                    dismiss()
                }, label: {
                    ZStack {
                        Capsule()
                            .foregroundStyle(LinearGradient(colors: [Color("Navy"), Color("Fuschia")], startPoint: .leading, endPoint: .trailing))
                            .frame(width: 278, height: 50)
                        
                        Text(editMode ? "Save" : "Add")
                            .font(.prjFeaturedText)
                            .fontWeight(.bold)
                    }
                })
                .disabled(projectName.isEmpty)
                
                if editMode {
                    Button("Delete") {
                        // Show confirmation dialogue before deleting
                        showsConfirmation = true
                    }
                    .foregroundStyle(.blush)
                    .bold()
                    .font(.prjRegularText)
                }
                
            }
            
        }
        .foregroundStyle(.white)
        .confirmationDialog("Sure you want to end project?", isPresented: $showsConfirmation, titleVisibility: .visible) {
            // Actions
            Button("Yes") {
                context.delete(project)
                dismiss()
            }
        }
        .onAppear {
            projectName = project.name
        }
        
    }
}
