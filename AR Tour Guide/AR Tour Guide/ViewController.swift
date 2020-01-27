//
//  ViewController.swift
//  AR Tour Guide
//
//  Created by iosDev on 1/26/20.
//  Copyright © 2020 Creative Labs. All rights reserved.
//

import UIKit
import RealityKit
import AVFoundation

class ViewController: UIViewController {
    
    @IBOutlet var arView: ARView!
    
    var audioPlayer = AVAudioPlayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Load the "Box" scene from the "Experience" Reality File
        //let boxAnchor = try! Experience.loadBox()
        
        let sound = Bundle.main.path(forResource: "sample_audio1", ofType: "mp3")
        
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: sound!))
        }
        catch {
            print(error)
        }

        // Add the box anchor to the scene
        //arView.scene.anchors.append(boxAnchor)
    }
    
    @IBAction func playAudio(_ sender: Any) {
        audioPlayer.play()
    }
}
