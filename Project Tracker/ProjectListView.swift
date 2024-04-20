//
//  ContentView.swift
//  Project Tracker
//
//  Created by Daniel Crompton on 19/04/2024.
//

import SwiftUI

struct ProjectListView: View {
    var body: some View {
        VStack {
            Image("Add")
            Text("Hello, world!")
                .foregroundStyle(Color("Washed blue"))
                .font(Font.prjScreenHeading)
        }
        .padding()
    }
}

#Preview {
    ProjectListView()
}
