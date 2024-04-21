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
    
    var project: Project
    @State private var projectName = ""
    
    var body: some View {
        
        ZStack {
            
            Color.black
                .ignoresSafeArea()
            
            VStack(spacing: 30) {
                Text("New project")
                    .font(.prjBigHeadline)
                
                VStack(spacing: 10) {
                    Text("Name")
                        .font(.prjFeaturedText)
                    
                    TextField("", text: $projectName)
                        .textFieldStyle(.roundedBorder)
                        .frame(width: 278, height: 50)
                }
                
                Button(action: {
                    // Save the project to SwiftData
                    project.name = projectName
                    context.insert(project)
                    
                    dismiss()
                }, label: {
                    ZStack {
                        Capsule()
                            .foregroundStyle(LinearGradient(colors: [Color("Navy"), Color("Purple")], startPoint: .leading, endPoint: .trailing))
                            .frame(width: 278, height: 50)
                        
                        Text("Save")
                            .font(.prjFeaturedText)
                            .fontWeight(.bold)
                    }
                })
                
            }
            
        }
        .foregroundStyle(.white)
        
    }
}

#Preview {
    AddProjectView(project: Project())
}
