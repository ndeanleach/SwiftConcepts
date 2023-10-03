//
//  MultiSheets.swift
//  SwiftConcepts
//
//  Created by Nathan Leach on 10/2/23.
//

import SwiftUI

struct RandomModel: Identifiable {
    let id = UUID().uuidString
    let title: String
}

// for multiple sheets
///Use a binding
///Use multiple .sheets
///use $item

struct MultiSheets: View {
    
    @State private var selectedModel: RandomModel? = nil
    @State private var showSheet: Bool = false
    
    var body: some View {
        VStack(spacing: 20){
            Button("B1") {
                selectedModel = RandomModel(title: "One")
            }
            Button("B2") {
                selectedModel = RandomModel(title: "Two")
            }
        }
        .sheet(item: $selectedModel) { model in
            ExampleScreen(selectedModel: model)
        }
    }
}

struct ExampleScreen: View {
    var selectedModel: RandomModel
    var body: some View {
        Text(selectedModel.title)
            .font(.largeTitle)
    }
}

#Preview {
    MultiSheets()
}
