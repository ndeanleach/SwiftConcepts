//
//  SwipeCard.swift
//  SwiftConcepts
//
//  Created by Nathan Leach on 9/30/23.
//

import SwiftUI

struct DragGestureView: View {
    
    @State private var isDragging = false
    @State private var offset = CGSize.zero
    
    var drag: some Gesture {
        DragGesture()
            .onChanged { value in
                self.isDragging = true
                withAnimation(.bouncy) {
                    offset = value.translation
                }
            }
            .onEnded { value in
                self.isDragging = false
                withAnimation(.bouncy) {
                    offset = .zero
                }
            }
    }

    var body: some View {
        ZStack{
            
            VStack{
                Text("\(offset.width)")
                Spacer()
            }
            
            RoundedRectangle(cornerRadius: 20)
                .fill(self.isDragging ? Color.gray : Color.black)
                .opacity(self.isDragging ? 0.5 : 1.0)
                .frame(width: 300, height: 500, alignment: .center)
                .offset(offset)
                .scaleEffect(getScaleAmount())
                .rotationEffect(Angle(degrees: getRotationAmount()))
                .gesture(drag)
        }
    }
    func getScaleAmount() -> CGFloat {
        let scenes = UIApplication.shared.connectedScenes
        let windowScene = scenes.first as? UIWindowScene
        let window = windowScene?.windows.first
        let windowWidth = window?.screen.bounds.width ?? 0
        
        let max = windowWidth / 2
        let currentAmount = abs(offset.width)
        let percentage = currentAmount / max
        return 1.0 - min(percentage, 0.5) * 0.5
    }
    
    func getRotationAmount() -> Double {
        let scenes = UIApplication.shared.connectedScenes
        let windowScene = scenes.first as? UIWindowScene
        let window = windowScene?.windows.first
        let windowWidth = window?.screen.bounds.width ?? 0
        
        let max = windowWidth / 2
        let currentAmount = offset.width
        let percentage = currentAmount / max
        let percentageAsDouble = Double(percentage)
        
        let maxAngle: Double = 10
        return percentageAsDouble * maxAngle
    }
}

#Preview {
    DragGestureView()
}
