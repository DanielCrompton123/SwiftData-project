//
//  AddUpdateView.swift
//  Project Tracker
//
//  Created by Daniel Crompton on 27/04/2024.
//

import SwiftUI

struct AddUpdateView: View {
    
    @Environment(\.modelContext) private var context
    @Environment(\.dismiss) private var dismiss
    
    var project: Project
    var update: ProjectUpdate
    
    @State private var headline = ""
    @State private var summary = ""
    @State private var hours = ""
    
    var body: some View {
        
        ZStack {
            
            Color.black
                .ignoresSafeArea()
            
            VStack(spacing: 30) {
                Text("Update project")
                    .font(.prjBigHeadline)
                
                AddField(title: "Headline", value: $headline)
                AddField(title: "Summary", value: $summary, expand: .vertical)
                AddField(title: "Hours", value: $hours)
                    .keyboardType(.numberPad)
                
                Button(action: {
                    // Save the project to SwiftData
                    update.headline = headline
                    update.summary = summary
                    update.hours = Float(hours)!
                    
                    project.updates.append(update)
                    
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
            .padding()
            
        }
        .foregroundStyle(.white)
        
    }
}
