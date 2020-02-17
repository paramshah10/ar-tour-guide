//
//  ViewController.swift
//  AR Tour Guide
//
//  Created by iosDev on 1/26/20.
//  Copyright © 2020 Creative Labs. All rights reserved.
//

import UIKit
import RealityKit
import CoreLocation
import AVFoundation

class ViewController: UIViewController {
    
    //var audioPlayer = AVAudioPlayer()
    let audio = Audio()

    // IBOutlets
    @IBOutlet weak var arView: ARView!
    @IBOutlet weak var buttonView: UIButton!
    
    // Variables and Constants.
    let locationManager = CLLocationManager()
    var locationList = LocationList()
    var didRender = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //let sound = Bundle.main.path(forResource: "temp", ofType: "mp3")
        
//        let t = audio.playAudio(name: "temp", type: "mp3")

//        if (t != 0)
//        {
//            print("cannot play")
//        }
//        do
//        {
//            audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: sound!))
//            //audioPlayer.prepareToPlay()
//        }
//        catch
//        {
//            print(error)
//        }
        buttonView.isHidden = true;
        
        // Location initialization.
        locationManager.requestAlwaysAuthorization()
        locationManager.startUpdatingLocation()
        locationManager.startUpdatingHeading()
        locationManager.delegate = self as CLLocationManagerDelegate
        
        // Defining new locations.
        let newLocation1 = Location(
            coord1: CLLocationCoordinate2D(
                latitude: 34.072377,
                longitude: -118.450842),
            coord2: CLLocationCoordinate2D(
                latitude: 34.072170,
                longitude: -118.450540),
            name: "Sproul Court")
        
        let newLocation2 = Location(
            coord1: CLLocationCoordinate2D(
                latitude: 34.072656,
                longitude: -118.450640),
            coord2: CLLocationCoordinate2D(
                latitude: 34.071729,
                longitude: -118.449758),
            name: "Sproul Hall")
        
        let newLocation3 = Location(
            coord1: CLLocationCoordinate2D(
                latitude: 34.073864,
                longitude: -118.450351),
            coord2: CLLocationCoordinate2D(
                latitude: 34.073467,
                longitude: -118.449333),
            name: "Courtside")
        
        let newLocation4 = Location(
            coord1: CLLocationCoordinate2D(
                latitude: 34.070777,
                longitude: -118.443064),
            coord2: CLLocationCoordinate2D(
                latitude: 34.070055,
                longitude: -118.442479),
            name: "Moore Hall")
        
        let newLocation5 = Location(
            coord1: CLLocationCoordinate2D(
                latitude: 34.073248,
                longitude: -118.450548),
            coord2: CLLocationCoordinate2D(
                latitude: 34.072746,
                longitude: -118.449628),
            name: "Covel Commons")
        
        // Adding new locations.
        locationList.addLocation(location: newLocation1)
        locationList.addLocation(location: newLocation2)
        locationList.addLocation(location: newLocation3)
        locationList.addLocation(location: newLocation4)
        locationList.addLocation(location: newLocation5)
        
    }
    
    @IBAction func showBearButton(_ sender: UIButton) {
        // Load the "Box" scene from the "Experience" Reality File.
        let bearAnchor = try! Bear1.loadScene()
        // Add the box anchor to the scene.
        arView.scene.anchors.append(bearAnchor)
        buttonView.isHidden = true;
    }
    
    @IBAction func playAudio(_ sender: Any) {
        audio.playAudio(name: "temp", type: "mp3")
    }
    
}

// MARK: - ViewController extensions.

extension ViewController: CLLocationManagerDelegate {

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        let lastLocation = locations.last
        
        // If not already rendered.
        if !didRender {
            
            let currentLocation = locationList.isInAnyLocation(user: lastLocation!.coordinate)
            navigationController?.title = currentLocation
            
            switch currentLocation {
                
            case "Sproul Court":
                fallthrough
    
            case "Sproul Hall":
                fallthrough
                
            case "Courtside":
                fallthrough
                
            case "Covel Commons":
                fallthrough
                
            case "Moore Hall":
                didRender = true;
                buttonView.isHidden = false;
                
            default:
                let alert = UIAlertController(title: "An error occured!", message: "This is not a valid location!", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Got it!", style: .default, handler: nil))
                self.present(alert, animated: true)
                
            }
            
        }
        
    }
}
