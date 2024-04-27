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
    var editMode: Bool
    
    @State private var headline = ""
    @State private var summary = ""
    @State private var hours = ""
    @State private var showsConfirmation = false
    
    var body: some View {
        
        ZStack {
            
            if editMode {
                LinearGradient(colors: [.lime, .black], startPoint: .bottomTrailing, endPoint: .topLeading)
                    .ignoresSafeArea()
            } else {
                Color.black
                    .ignoresSafeArea()
            }
            
            VStack(spacing: 30) {
                Text(editMode ? "Edit update" : "Add update")
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
                    
                    if !editMode {
                        project.updates.append(update)
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
            .padding()
            
        }
        .foregroundStyle(.white)
        .confirmationDialog("Sure you want to delete update?", isPresented: $showsConfirmation, titleVisibility: .visible) {
            // Actions
            Button("Yes") {
                project.updates.removeAll { u in
                    u.id == update.id
                }
                dismiss()
            }
        }
        .onAppear {
            headline = update.headline
            summary = update.summary
            hours = String(update.hours)
        }
        
    }
}
