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

class ARViewController: UIViewController {
    
    // IBOutlets
    @IBOutlet weak var arView: ARView!
    @IBOutlet weak var playButton: UIButton!
    @IBOutlet weak var infoButtonView: UIButton!
    @IBOutlet weak var locationLabel: UILabel!
    
    // Variables and Constants.
    let locationManager = CLLocationManager()
    var locationList = LocationList()
    var errorShown = false
    var didRender = false
    var currentLocation = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Location initialization.
        locationManager.requestAlwaysAuthorization()
        locationManager.startUpdatingLocation()
        locationManager.startUpdatingHeading()
        locationManager.delegate = self as CLLocationManagerDelegate
        
        // Defining new locations.
//        let sproulCourt = Location(
//            coord1: CLLocationCoordinate2D(
//                latitude: 34.072377,
//                longitude: -118.450842),
//            coord2: CLLocationCoordinate2D(
//                latitude: 34.072170,
//                longitude: -118.450540),
//            name: "Sproul Court")
//
        let sproulHall = Location(
            coord1: CLLocationCoordinate2D(
                latitude: 34.072656,
                longitude: -118.450640),
            coord2: CLLocationCoordinate2D(
                latitude: 34.071729,
                longitude: -118.449758),
            name: "Sproul Hall")
//
//        let courtside = Location(
//            coord1: CLLocationCoordinate2D(
//                latitude: 34.073864,
//                longitude: -118.450351),
//            coord2: CLLocationCoordinate2D(
//                latitude: 34.073467,
//                longitude: -118.449333),
//            name: "Courtside")
//
//        let mooreHall = Location(
//            coord1: CLLocationCoordinate2D(
//                latitude: 34.070777,
//                longitude: -118.443064),
//            coord2: CLLocationCoordinate2D(
//                latitude: 34.070055,
//                longitude: -118.442479),
//            name: "Moore Hall")
        
        let covelCommons = Location(
            coord1: CLLocationCoordinate2D(
                latitude: 34.073248,
                longitude: -118.450548),
            coord2: CLLocationCoordinate2D(
                latitude: 34.072746,
                longitude: -118.449628),
            name: "Covel Commons")
        
//        let powellLibrary = Location(
//            coord1: CLLocationCoordinate2D(
//                latitude: 34.072190,
//                longitude: -118.442662),
//            coord2: CLLocationCoordinate2D(
//                latitude: 34.071922,
//                longitude:  -118.441635),
//            name: "Powell Library")
        
        // Adding new locations.
//        locationList.addLocation(location: sproulCourt)
        locationList.addLocation(location: sproulHall)
//        locationList.addLocation(location: courtside)
//        locationList.addLocation(location: mooreHall)
        locationList.addLocation(location: covelCommons)
//        locationList.addLocation(location: powellLibrary)
        
    }
    
    @IBAction func showBearButton(_ sender: UIButton) {
        let bearAnchor = try! Bear.loadScene()
        
        if !arView.scene.anchors.isEmpty {
            arView.scene.anchors.removeAll()
        }
        
        arView.scene.anchors.append(bearAnchor)
        didRender = true
        
    }
    
    @IBAction func infoButtonPressed(_ sender: UIButton) {
        
        self.performSegue(withIdentifier: "arToInfoPage", sender: self)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "arToInfoPage" {
            let destinationVC = segue.destination as! InfoPageViewController
            destinationVC.location = self.currentLocation
        }
        
    }
    
    //Side Panel
//    var sidePanel: UIViewController!
//    var centerController: UIViewController!
//    var isExpanded = false
//    var delegate: ARViewControllerDelegate?
//
//    @objc func handleMenuToggle() {
//
//        delegate?.handleMenuToggle()
//
//    }
//
//    func configureSidePanel() {
//        if sidePanel == nil {
//            sidePanel = SidePanel ()
//            view.insertSubview(sidePanel.view, at: 0)
//            addChild(sidePanel)
//            sidePanel.didMove(toParent: self)
//        }
//    }
//
//    func showSidePanel(shouldExpand: Bool) {
//        if shouldExpand {
//            //show menu
//            UIView.animate(withDuration: 0.3, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .curveEaseInOut, animations: {
//
//            }, completion: nil)
//        }
//        else {
//            //hide menu
//        }
//    }


}

// MARK: - ViewController extensions.

extension ARViewController: CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        let lastLocation = locations.last
        
        currentLocation = locationList.isInAnyLocation(user: lastLocation!.coordinate)
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
                playButton.isHidden = false
                infoButtonView.isHidden = false
                locationLabel.isHidden = false
                locationLabel.text = currentLocation
                
            }
            
        default:
            if !errorShown {
                errorShown = true
                didRender = false
                navigationItem.title = "Invalid location!"
                playButton.isHidden = true
                infoButtonView.isHidden = true
                locationLabel.isHidden = true
                locationLabel.text = nil
                let alert = UIAlertController(title: "An error occured!", message: "This is not a valid location!", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Got it!", style: .default, handler: nil))
                self.present(alert, animated: true)
            }
            
        }
        
    }
}

////Side Panel
//extension ARViewController: ARViewControllerDelegate {
//
//    func handleMenuToggle() {
//
//        if (!isExpanded){
//            configureSidePanel()
//        }
//        isExpanded = !isExpanded
//        showSidePanel(shouldExpand: isExpanded)
//    }
//}
