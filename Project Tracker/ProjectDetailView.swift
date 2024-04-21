//
//  ProjectDetailView.swift
//  Project Tracker
//
//  Created by Daniel Crompton on 21/04/2024.
//

import SwiftUI

struct ProjectDetailView: View {
    
    @Environment(\.dismiss) private var dismiss
    var project: Project
    
    var body: some View {
        VStack {
            Text(project.name)
                .navigationBarBackButtonHidden()
            
            Button("Back") {
                // Navigate back
                dismiss()
            }
        }
    }
}

#Preview {
    ProjectDetailView(project: Project())
}
