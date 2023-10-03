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
                Text("Scroll Search")
            }
            NavigationLink{
                GeoReader()
            } label: {
                Text("Panning animation")
            }
            NavigationLink{
                MultiSheets()
            } label: {
                Text("Multiple Sheet method")
            }
        }
    }
}

#Preview {
    ContentView()
}

