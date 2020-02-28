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

class ARViewController: UIViewController, UIScrollViewDelegate {
    
    // IBOutlets
    @IBOutlet weak var arView: ARView!
    @IBOutlet weak var playButton: UIButton!
    @IBOutlet weak var infoButtonView: UIButton!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var scrollView: UIScrollView!
    
    // Variables and Constants.
    let locationManager = CLLocationManager()
    var locationList = LocationList()
    var errorShown = false
    var didRender = false
    var currentLocation = ""
    var blurEffectView: UIVisualEffectView!
    let pageControl = UIPageControl(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
    var pageControlView: UIView!
    var getStartedView: UIView!
    var frameVal = CGRect(x: 0, y: 0, width: 0, height: 0)
    
    // IBActions
    @IBAction func onBoardingDone(sender: UIButton) {
//        blurEffectView.removeFromSuperview()
//        scrollView.removeFromSuperview()
//        pageControlView.removeFromSuperview()
        UIView.animate(withDuration: 0.5, animations: {
            self.blurEffectView.alpha = 0; self.pageControlView.alpha = 0; self.scrollView.alpha = 0
        }) { _ in
            self.blurEffectView.removeFromSuperview()
            self.scrollView.removeFromSuperview()
            self.pageControlView.removeFromSuperview()
        }
        UserDefaults.standard.set(true, forKey: "onboarded")
    }
    
    @IBAction func getStartedPressed(sender: UIButton) {
        UIView.animate(withDuration: 0.5, animations: {
            self.getStartedView.alpha = 0
        }) { _ in
            self.getStartedView.removeFromSuperview()
        }
    }
    
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
        UserDefaults.standard.set(true, forKey: "needOnboarding")
        let blurEffect = UIBlurEffect(style: UIBlurEffect.Style.light)
        blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = view.bounds
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        pageControl.currentPageIndicatorTintColor = .systemYellow
        pageControl.pageIndicatorTintColor = .systemBlue
        pageControlView = UIView(frame: CGRect(x: view.center.x, y: view.frame.size.height - 50, width: 100, height: 100))
        pageControl.numberOfPages = 4
        pageControlView.addSubview(pageControl)
        getStartedView = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: view.frame.size.height))
        if !UserDefaults.standard.bool(forKey: "onboarded") {
            view.addSubview(blurEffectView)
            view.addSubview(scrollView)
            view.addSubview(pageControlView)
            view.addSubview(getStartedView)
            var x = CGFloat(0)
            //firstview
            frameVal.origin.x = scrollView.frame.size.width * CGFloat(0)
            frameVal.size = scrollView.frame.size
            //var view = UIView(frame: CGRect(x: x, y: scrollView.frame.size.height, width: scrollView.frame.size.width, height: scrollView.frame.size.height))
            let view1 = UIView(frame: CGRect(x: x, y: 0, width: scrollView.frame.size.width, height: scrollView.frame.size.height))
            var imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: scrollView.frame.size.width, height: scrollView.frame.size.height))
            imageView.contentMode = .scaleAspectFit
            imageView.clipsToBounds = true
            imageView.image = UIImage(named: "onboarding1")
            view1.addSubview(imageView)
            self.scrollView.addSubview(view1)
            x = view1.frame.origin.x + scrollView.frame.size.width
            scrollView.contentSize = CGSize(width: x, height: scrollView.frame.size.height)
            //secondview
            frameVal.origin.x = scrollView.frame.size.width * CGFloat(1)
            frameVal.size = scrollView.frame.size
            let view2 = UIView(frame: CGRect(x: x, y: 0, width: scrollView.frame.size.width, height: scrollView.frame.size.height))
            imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: scrollView.frame.size.width, height: scrollView.frame.size.height))
            imageView.contentMode = .scaleAspectFit
            imageView.clipsToBounds = true
            imageView.image = UIImage(named: "onboarding2")
            view2.addSubview(imageView)
            self.scrollView.addSubview(view2)
            x = view2.frame.origin.x + scrollView.frame.size.width
            scrollView.contentSize = CGSize(width: x, height: scrollView.frame.size.height)
            //thirdview
            frameVal.origin.x = scrollView.frame.size.width * CGFloat(2)
            frameVal.size = scrollView.frame.size
            let view3 = UIView(frame: CGRect(x: x, y: 30, width: scrollView.frame.size.width, height: scrollView.frame.size.height))
            imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: scrollView.frame.size.width, height: scrollView.frame.size.height))
            imageView.contentMode = .scaleAspectFit
            imageView.clipsToBounds = true
            imageView.image = UIImage(named: "onboarding3")
            view3.addSubview(imageView)
            self.scrollView.addSubview(view3)
            x = view3.frame.origin.x + scrollView.frame.size.width
            scrollView.contentSize = CGSize(width: x, height: scrollView.frame.size.height)
            //fourthview
            let view4 = UIView(frame: CGRect(x: x, y: 0, width: scrollView.frame.size.width, height: scrollView.frame.size.height))
//            let getStartedButton = UIButton(frame: CGRect(x: scrollView.frame.size.width*0.5-75, y: scrollView.frame.size.height*0.5-50, width: 150, height: 50))
//            getStartedButton.titleLabel?.textColor = .white
//            getStartedButton.setTitle("Get Started", for: .normal)
//            getStartedButton.backgroundColor = .systemBlue
//            getStartedButton.layer.cornerRadius = getStartedButton.frame.size.height/2
//            getStartedButton.layer.masksToBounds = true
//            getStartedButton.addTarget(self, action: #selector(onBoardingDone(sender:)), for: .touchUpInside)
//            view4.addSubview(getStartedButton)
            let continueButton = UIButton(frame: CGRect(x: scrollView.frame.size.width*0.1, y: scrollView.frame.size.height*0.7, width: scrollView.frame.size.width*0.8, height: 50))
            continueButton.setTitleColor(.systemBlue, for: .normal)
            continueButton.backgroundColor = .white
            continueButton.setTitle("Continue", for: .normal)
            continueButton.layer.cornerRadius = 10
            continueButton.addTarget(self, action: #selector(onBoardingDone(sender:)), for: .touchUpInside)
            view4.addSubview(continueButton)
            let viewLabel = UILabel(frame: CGRect(x: scrollView.frame.size.width*0.1, y: scrollView.frame.size.height*0.2, width: scrollView.frame.size.width*0.8, height: 50))
            viewLabel.textColor = .white
            viewLabel.text = "AR Tour Guide"
            viewLabel.textAlignment = .center
            viewLabel.adjustsFontSizeToFitWidth = true
            viewLabel.font = UIFont.systemFont(ofSize: 70)
            view4.addSubview(viewLabel)
            let viewImage = UIImageView(frame: CGRect(x: view.center.x-view.frame.size.width*0.3, y: view.center.y-view.frame.size.width*0.3, width: view.frame.size.width*0.6, height: view.frame.size.width*0.6))
            viewImage.backgroundColor = .black
            viewImage.contentMode = .scaleAspectFill
            viewImage.layer.cornerRadius = view.frame.size.width*0.3
            viewImage.clipsToBounds = true
            viewImage.image = UIImage(named: "logo")
            view4.addSubview(viewImage)
            self.scrollView.addSubview(view4)
            x = view4.frame.origin.x + scrollView.frame.size.width
            scrollView.contentSize = CGSize(width: x, height: scrollView.frame.size.height)
            scrollView.delegate = self
            //getStartedView
            let backgroundImage = UIImageView(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: view.frame.size.height))
            backgroundImage.image = UIImage(named: "backgroundBlue")
            getStartedView.addSubview(backgroundImage)
            let headerLabel = UILabel(frame: CGRect(x: view.frame.size.width*0.1, y: view.frame.size.height*0.2, width: view.frame.size.width*0.8, height: 50))
            headerLabel.textColor = .white
            headerLabel.text = "AR Tour Guide"
            headerLabel.textAlignment = .center
            headerLabel.adjustsFontSizeToFitWidth = true
            headerLabel.font = UIFont.systemFont(ofSize: 70)
            getStartedView.addSubview(headerLabel)
            let logoImageView = UIImageView(frame: CGRect(x: view.center.x-view.frame.size.width*0.3, y: view.center.y-view.frame.size.width*0.3, width: view.frame.size.width*0.6, height: view.frame.size.width*0.6))
            logoImageView.backgroundColor = .black
            logoImageView.contentMode = .scaleAspectFill
            logoImageView.layer.cornerRadius = view.frame.size.width*0.3
            logoImageView.clipsToBounds = true
            logoImageView.image = UIImage(named: "logo")
            getStartedView.addSubview(logoImageView)
            let startButton = UIButton(frame: CGRect(x: view.frame.size.width*0.1, y: view.frame.size.height*0.7, width: view.frame.size.width*0.8, height: 50))
            startButton.setTitleColor(.systemBlue, for: .normal)
            startButton.backgroundColor = .white
            startButton.setTitle("Get Started", for: .normal)
            startButton.layer.cornerRadius = 10
            startButton.addTarget(self, action: #selector(getStartedPressed(sender:)), for: .touchUpInside)
            getStartedView.addSubview(startButton)
        }
        
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
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let pageNumber = scrollView.contentOffset.x / scrollView.frame.size.width
        pageControl.currentPage = Int(pageNumber)
    }
    
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
