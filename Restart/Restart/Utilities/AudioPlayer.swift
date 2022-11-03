//
//  AudioPlayer.swift
//  Restart
//
//  Created by MinKyeongTae on 2022/11/04.
//

import Foundation
import AVFoundation

var audioPlayer: AVAudioPlayer?

func play(sound: String, type: String) {
  guard let path = Bundle.main.path(forResource: sound, ofType: type) else {
    return
  }
  
  do {
    audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
    audioPlayer?.play()
  } catch {
    print("Could not play the sound file.")
  }
}
