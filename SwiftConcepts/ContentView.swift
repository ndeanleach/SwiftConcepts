//
//  ContentView.swift
//  SwiftConcepts
//
//  Created by Nathan Leach on 9/30/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack{
            DragGestureView()
            NavigationLink{
                ScrollReader()
            } label: {
                Text("ScrollViewReader")
            }
        }
    }
}

#Preview {
    ContentView()
}

