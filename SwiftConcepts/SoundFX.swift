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
    
    enum SoundOption: String {
        case tada = "Tada-sound"
        case ding = "Ding-sound-effect"
    }
    
    func playSound(_ sound: SoundOption) {
        
        guard let url = Bundle.main.url(forResource: sound.rawValue, withExtension: ".mp3") else { return }
        
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
        VStack(spacing: 40){
            Button("Sound 1"){
                SoundManager.instance.playSound(.ding)
            }
            Button("Sound 2"){
                SoundManager.instance.playSound(.tada)
            }
        }
    }
}

#Preview {
    SoundFX()
}
