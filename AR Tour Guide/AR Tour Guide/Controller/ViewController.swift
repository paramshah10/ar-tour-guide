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

class ViewController: UIViewController {
    
    // IBOutlets
    @IBOutlet weak var arView: ARView!
    @IBOutlet weak var buttonView: UIButton!
    
    // Variables and Constants.
    let locationManager = CLLocationManager()
    var locationList = LocationList()
    var errorShown = false
    var didRender = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // View initialization.
        buttonView.isHidden = true;
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            title: "Refresh"
            ,
            style: .plain,
            target: self,
            action: #selector(refreshPressed))
        
        // Location initialization.
        locationManager.requestAlwaysAuthorization()
        locationManager.startUpdatingLocation()
        locationManager.startUpdatingHeading()
        locationManager.delegate = self as CLLocationManagerDelegate
        
        // Defining new locations.
        let sproulCourt = Location(
            coord1: CLLocationCoordinate2D(
                latitude: 34.072377,
                longitude: -118.450842),
            coord2: CLLocationCoordinate2D(
                latitude: 34.072170,
                longitude: -118.450540),
            name: "Sproul Court")
        
        let sproulHall = Location(
            coord1: CLLocationCoordinate2D(
                latitude: 34.072656,
                longitude: -118.450640),
            coord2: CLLocationCoordinate2D(
                latitude: 34.071729,
                longitude: -118.449758),
            name: "Sproul Hall")
        
        let courtside = Location(
            coord1: CLLocationCoordinate2D(
                latitude: 34.073864,
                longitude: -118.450351),
            coord2: CLLocationCoordinate2D(
                latitude: 34.073467,
                longitude: -118.449333),
            name: "Courtside")
        
        let mooreHall = Location(
            coord1: CLLocationCoordinate2D(
                latitude: 34.070777,
                longitude: -118.443064),
            coord2: CLLocationCoordinate2D(
                latitude: 34.070055,
                longitude: -118.442479),
            name: "Moore Hall")
        
        let covelCommons = Location(
            coord1: CLLocationCoordinate2D(
                latitude: 34.073248,
                longitude: -118.450548),
            coord2: CLLocationCoordinate2D(
                latitude: 34.072746,
                longitude: -118.449628),
            name: "Covel Commons")
        
        let powellLibrary = Location(
            coord1: CLLocationCoordinate2D(
                latitude: 34.072190,
                longitude: -118.442662),
            coord2: CLLocationCoordinate2D(
                latitude: 34.071922,
                longitude:  -118.441635),
            name: "Powell Library")
        
        // Adding new locations.
        locationList.addLocation(location: sproulCourt)
        locationList.addLocation(location: sproulHall)
        locationList.addLocation(location: courtside)
        locationList.addLocation(location: mooreHall)
        locationList.addLocation(location: covelCommons)
        locationList.addLocation(location: powellLibrary)
        
    }
    
    @objc func refreshPressed() {
        
        errorShown = false
        didRender = false
        arView.scene.anchors.removeAll()
        
    }
    
    @IBAction func showBearButton(_ sender: UIButton) {
        // Load the scene from the Reality File.
        let bearAnchor = try! Bear.loadScene()
        // Add the box anchor to the scene.
        arView.scene.anchors.append(bearAnchor)
        buttonView.isHidden = true;
        didRender = true
    }
    
    
}

// MARK: - ViewController extensions.

extension ViewController: CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        let lastLocation = locations.last
        
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
            
        case "Powell Library":
            fallthrough
            
        case "Moore Hall":
            errorShown = false
            if !didRender {
                navigationItem.title = currentLocation
                buttonView.isHidden = false
            }
            
        default:
            if !errorShown {
                errorShown = true
                didRender = false
                navigationItem.title = "Invalid location!"
                buttonView.isHidden = true
                let alert = UIAlertController(title: "An error occured!", message: "This is not a valid location!", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Got it!", style: .default, handler: nil))
                self.present(alert, animated: true)
            }
            
        }
        
    }
}
