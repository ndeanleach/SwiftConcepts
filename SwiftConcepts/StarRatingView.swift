//
//  StarRatingView.swift
//  SwiftConcepts
//
//  Created by Nathan Leach on 10/3/23.
//

import SwiftUI

struct StarRatingView: View {
    
    @State private var rating: Int = 0
    
    var body: some View {
        ZStack {
            StarsView
                .overlay { OverlayView.mask(StarsView) }
        }
    }
    
    private var OverlayView: some View {
        GeometryReader{ geo in
            ZStack(alignment: .leading) {
                Rectangle()
                    .fill(LinearGradient(gradient: Gradient(colors: [Color.yellow, Color.orange]), startPoint: .leading, endPoint: .trailing))
                    .frame(width: CGFloat(rating) / 5 * geo.size.width)
            }
        }
        .allowsHitTesting(false)
    }
    
    private var StarsView: some View {
        HStack{
            ForEach(1..<6) { index in
                Image(systemName: "star.fill")
                    .font(.largeTitle)
                    .foregroundStyle(Color.gray)
                    .onTapGesture {
                        withAnimation(.easeInOut(duration: 0.15)){
                            rating = index
                        }
                    }
            }
        }
    }
}

#Preview {
    StarRatingView()
}
