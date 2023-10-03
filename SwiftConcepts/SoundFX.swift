//
//  SoundFX.swift
//  SwiftConcepts
//
//  Created by Nathan Leach on 10/3/23.
//

import SwiftUI
import AVKit


class SoundManager {
    static let instance = SoundManager() //Singleton
    
    var player: AVAudioPlayer?
    
    func playSound() {
        guard let url = URL(string: "") else { return }
        
        do {
            player = try AVAudioPlayer(contentsOf: url)
            player?.play()
        } catch let error {
            print("Error playing sound. \(error.localizedDescription)")
        }
    }
}

struct SoundFX: View {
    var body: some View {
        Button("Sound 1"){
            
        }
        Button("Sound 2"){
            
        }
    }
}

#Preview {
    SoundFX()
}
