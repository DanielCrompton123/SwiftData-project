//
//  ProjectDetailView.swift
//  Project Tracker
//
//  Created by Daniel Crompton on 21/04/2024.
//

import SwiftUI

struct ProjectDetailView: View {
    
    var project: Project
    @State var newUpdate: ProjectUpdate?
        
    var body: some View {
                    
        ZStack(alignment: .bottomLeading) {
            
            LinearGradient(colors: [Color("Navy"), Color("Sky blue")], startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            
            LinearGradient(colors: [Color("Sky blue").opacity(0.5), Color("Navy")], startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
                .frame(width: 1)
                .padding(.leading, 48)
            
            VStack {
                ProjectDetailHeader(project: project)
                    .padding(.bottom)
                
                ScrollView {
                    
                    VStack(spacing: 20) {
                        ForEach(project.updates) { update in
                            ProjectUpdateView(update: update)
                        }
                    }
                    .padding(.bottom, 120)
                    
                }
                .scrollIndicators(.hidden)
                .padding(.horizontal, 30)
            }
            
            ProjectDetailFooter(update: $newUpdate)
            
        }
        .navigationBarBackButtonHidden()
        .sheet(item: $newUpdate) { update in
            AddUpdateView(project: project, update: update)
                .presentationDetents([.height(450)])
        }

    }
}


struct ProjectDetailHeader: View {
    var project: Project

    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text(project.name)
                .font(.prjScreenHeading)
            
            HStack(spacing: 20) {
                Spacer()
                
                TextBubble(title: "Hours", content: "230", color1Name: "Navy", color2Name: "Sky blue", isBold: false)
                TextBubble(title: "Sessions", content: "34", color1Name: "Green", color2Name: "Lime", isBold: false)
                TextBubble(title: "Updates", content: "6", color1Name: "Deep purple", color2Name: "Fuschia", isBold: false)
                TextBubble(title: "Wins", content: "3", color1Name: "Maroon", color2Name: "Olive", isBold: false)
                
                Spacer()
            }
            
            Text("My current focus is...")
                .font(.prjFeaturedText)
                .fontWeight(.bold)
                .foregroundStyle(.gray)
            
            HStack {
                Image(systemName: "checkmark.square")
                Text("Launch the website with the new design.")
                    .font(.prjFeaturedText)
            }
            .padding(.leading, 7)
            .foregroundStyle(.gray)
        
        }
        .padding()
        .foregroundStyle(.white)
        .background {
            Color.black
                .opacity(0.7)
                .clipShape(.rect(bottomLeadingRadius: 15, bottomTrailingRadius: 15))
                .shadow(radius: 5, x: 0, y: 4)
                .ignoresSafeArea()
        }

    }
    
}


struct ProjectDetailFooter: View {
    
    @Environment(\.dismiss) private var dismiss
    @Binding var update: ProjectUpdate?
    
    var body: some View {
        
        HStack {
            
            // ADD BUTTON
            Button {
                // Add update
                update = ProjectUpdate()
            } label: {
                Image("Add project")
            }

            Spacer()
            
            // BACK BUTTON
            Button {
                // Dismiss AKA go up a level in the navigation stack
                dismiss()
            } label: {
                Text("Back")
                    .foregroundStyle(.white)
                    .font(.prjFeaturedText)
                    .fontWeight(.bold)
                    .padding(.vertical, 10)
                    .padding(.horizontal, 30)
                    .background {
                        Capsule()
                            .foregroundStyle(.black)
                            .opacity(0.5)
                    }
            }

        }
        .padding()
        .background {
            Color.black
                .opacity(0.4)
                .clipShape(.rect(topLeadingRadius: 15, topTrailingRadius: 15))
                .ignoresSafeArea()
        }
    }
    
}


#Preview {
    ProjectDetailView(project: Project())
}
