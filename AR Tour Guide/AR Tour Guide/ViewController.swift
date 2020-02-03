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
    
    @IBOutlet var arView: ARView!
    let locationManager = CLLocationManager()
    var locationList = LocationList()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Load the "Box" scene from the "Experience" Reality File
        let boxAnchor = try! Experience.loadBox()
        
        // Add the box anchor to the scene
        arView.scene.anchors.append(boxAnchor)
        
        //Location Stuff
        locationManager.requestAlwaysAuthorization()
        locationManager.startUpdatingLocation()
        locationManager.startUpdatingHeading()
        locationManager.delegate = self as CLLocationManagerDelegate
        locationList.addLocation(location: Location(CLLocationCoordinate2D(latitude: 34.072377, longitude: -118.450842), coord2: CLLocationCoordinate2D(latitude: 34.072170, longitude: -118.450540), name: "Sproul Court"))
    }
}

extension ViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let lastLocation = locations.last
        print(locationList.isInAnyLocation(user: lastLocation!.coordinate))
    }
}
