//
//  AddField.swift
//  Project Tracker
//
//  Created by Daniel Crompton on 27/04/2024.
//

import SwiftUI

struct AddField: View {
    
    var title: String
    @Binding var value: String
    var expand: Axis?
    var labelColor: Color = .white
    var fieldColor: Color = .black
    
    var body: some View {
        VStack(spacing: 10) {
            Text(title)
                .font(.prjFeaturedText)
                .foregroundStyle(labelColor)
            
            if expand != nil {
                TextField("", text: $value, axis: expand!)
                    .textFieldStyle(.roundedBorder)
                    .frame(width: 278)
                    // height of 50?
                    .foregroundStyle(fieldColor)
            } else {
                TextField("", text: $value)
                    .textFieldStyle(.roundedBorder)
                    .frame(width: 278)
                    .foregroundStyle(fieldColor)
            }
        }
    }
}
