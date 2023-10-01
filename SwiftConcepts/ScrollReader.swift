//
//  ScrollViewReader.swift
//  SwiftConcepts
//
//  Created by Nathan Leach on 9/30/23.
//

import SwiftUI

struct ScrollReader: View {
    
    @State private var index: Int = 0
    @State private var search: String = ""
    
    var body: some View {
        VStack {
            
            TextField("Skip to: ", text: $search)
                .frame(height: 55)
                .shadow(radius: 10)
                .textFieldStyle(.roundedBorder)
                .padding()
                .padding(.horizontal)
                .keyboardType(.numberPad)
            
            Button("Search"){
                withAnimation(.spring){
                    if let toIndex = Int(search) {
                        index = toIndex
                    }
                }
            }
            
            ScrollViewReader{ proxy in
                ScrollView{
                    ForEach(0..<50) { index in
                        Text("This is item \(index)")
                            .font(.headline)
                            .frame(height: 200)
                            .frame(maxWidth: .infinity)
                            .background(.white)
                            .clipShape(.rect(cornerRadius: CGFloat(10)))
                            .shadow(radius: 10)
                            .padding()
                            .id(index)
                    }
                    .onChange(of: index){
                        proxy.scrollTo(index)
                    }
                }
            }
        }
    }
}

#Preview {
    ScrollReader()
}
