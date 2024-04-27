//
//  ProjectUpdate.swift
//  Project Tracker
//
//  Created by Daniel Crompton on 27/04/2024.
//

import SwiftUI

struct ProjectUpdateView: View {
    
    var update: ProjectUpdate
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
                                        
            ZStack {
                
                Rectangle()
                    .foregroundStyle(LinearGradient(colors: [
                        update.updateType == .log ? Color("Deep purple") : Color("Tiffany teal"),
                        update.updateType == .log ? Color("Orchid") : Color("Turtle green")
                    ], startPoint: .leading, endPoint: .trailing))
                
                HStack {
                    Text(DateHelper.convertDate(update.date))
                    Spacer()
                    if update.updateType == .log {
                        Text("\(String(update.hours)) hours")
                    } else {
                        Image(systemName: "star.fill")
                            .foregroundStyle(.yellow)
                    }
                }
                .font(.prjRegularText)
                .padding(.horizontal, 15)
                .padding(.vertical, 7)

            }
            
            ZStack {
                Rectangle()
                    .foregroundStyle(.black)
                    .opacity(0.7)
                
                HStack {
                    VStack(alignment: .leading, spacing: 10) {
                        Text(update.headline)
                            .bold()
                        Text(update.summary)
                    }
                    .padding(15)
                    .font(.prjFeaturedText)
                    
                    Spacer()
                }
            }

        }
        .clipShape(.rect(cornerRadius: 15))
        .multilineTextAlignment(.leading)
        .shadow(radius: 5, x: 0, y: 4)
        .foregroundStyle(.white)
        
    }
    
}
