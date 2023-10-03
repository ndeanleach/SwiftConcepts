//
//  HapticsView.swift
//  SwiftConcepts
//
//  Created by Nathan Leach on 10/3/23.
//

import SwiftUI

class HapticManager {
    static let instance = HapticManager()
    
    func notification(type: UINotificationFeedbackGenerator.FeedbackType) {
        let generator = UINotificationFeedbackGenerator()
        generator.notificationOccurred(type)
    }
    
    func impact(style: UIImpactFeedbackGenerator.FeedbackStyle) {
        let generator = UIImpactFeedbackGenerator(style: style)
        generator.impactOccurred()
    }
}

struct HapticsView: View {
    var body: some View {
        VStack(spacing: 20) {
            Button("Success") { HapticManager.instance.notification(type: .success) }
            Button("Error") { HapticManager.instance.notification(type: .error) }
            Button("Warning") { HapticManager.instance.notification(type: .warning) }
            Divider()
            Button("Light") { HapticManager.instance.impact(style: .light) }
            Button("Medium") { HapticManager.instance.impact(style: .medium) }
            Button("Heavy") { HapticManager.instance.impact(style: .heavy) }
            Button("Soft") { HapticManager.instance.impact(style: .soft) }
            Button("Rigid") { HapticManager.instance.impact(style: .rigid) }
        }
    }
}

#Preview {
    HapticsView()
}
