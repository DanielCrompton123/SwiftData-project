//
//  EditFocusView.swift
//  Project Tracker
//
//  Created by Daniel Crompton on 27/04/2024.
//

import SwiftUI

struct EditFocusView: View {
    @Environment(\.modelContext) private var context
    @Environment(\.dismiss) private var dismiss
    
    var project: Project
    @State private var focus = ""
    
    var body: some View {
        
        @Bindable var project = project
        
        ZStack {
            
            Color.black
                .ignoresSafeArea()
            
            VStack(spacing: 30) {
                Text("Edit *\(project.name)*'s focus")
                    .font(.prjBigHeadline)
                
                AddField(title: "Focus", value: $project.focus, expand: .vertical)
                
                Button(action: {
                    // Save the project to SwiftData
//                    project.focus = focus
                    // Because autosave is on the changes will automatically be saved
                    
                    dismiss()
                }, label: {
                    ZStack {
                        Capsule()
                            .foregroundStyle(LinearGradient(colors: [Color("Navy"), Color("Fuschia")], startPoint: .leading, endPoint: .trailing))
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
