//
//  GeoReader.swift
//  SwiftConcepts
//
//  Created by Nathan Leach on 10/2/23.
//

import SwiftUI

struct GeoReader: View {
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false){
            HStack{
                ForEach(0..<20) { index in
                    GeometryReader{ geo in //geometryproxy value
                        RoundedRectangle(cornerRadius: 20)
                            .rotation3DEffect(
                                Angle(degrees: getPercentage(geo: geo) * 40),
                                axis: /*@START_MENU_TOKEN@*/(x: 0.0, y: 1.0, z: 0.0)/*@END_MENU_TOKEN@*/
                            )
                    }
                    .frame(width: 300, height: 250, alignment: .center)
                    .padding()
                    .shadow(radius: 40)
                }
            }
        }
    }
    func getPercentage(geo: GeometryProxy) -> Double {
        let scenes = UIApplication.shared.connectedScenes
        let windowScene = scenes.first as? UIWindowScene
        let window = windowScene?.windows.first
        let windowWidth = window?.screen.bounds.width ?? 0
        
        let maxDistance = windowWidth / 2
        let currentX = geo.frame(in: .global).midX
        return Double(1 - (currentX / maxDistance))
    }
}

#Preview {
    GeoReader()
}
