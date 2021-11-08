//
//  AudioManagerViewModel.swift
//  uikit1
//
//  Created by Apple user on 08/11/21.
//

import Foundation
import AVKit

class AudioManagerViewModel {
    
    private var chantAudioPlay: AVAudioPlayer?
    
    func playback (_ team: Team) {
        if team.isPlaying {
            chantAudioPlay?.stop()
        }else{
            guard let path = Bundle.main.path(forResource: "\(team.id.chantFile).mp3", ofType: nil) else { return }
            let url = URL(fileURLWithPath: path)
            do {
                chantAudioPlay = try AVAudioPlayer(contentsOf: url)
                chantAudioPlay?.numberOfLoops = -1
                chantAudioPlay?.play()
            }catch{
               print(error)
            }
            
            
    }
    }
}
