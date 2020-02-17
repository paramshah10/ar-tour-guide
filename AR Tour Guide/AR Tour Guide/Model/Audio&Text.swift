//
//  Audio&Text.swift
//  AR Tour Guide
//
//  Created by Isha G on 2/16/20.
//  Copyright © 2020 Creative Labs. All rights reserved.
//

import Foundation
import AVFoundation

public struct Audio {
    
    func playAudio(name: String, type: String) -> Int
    {
        var audioPlayer = AVAudioPlayer()
        
        let sound = Bundle.main.path(forResource: name, ofType: type)
        
        do
        {
            audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: sound!))
            //audioPlayer.prepareToPlay()
            audioPlayer.play()
        }
        catch
        {
            print(error)
            return -1
        }
        
        return 0
    }
}


public struct Text {
    
}
