//
//  ViewController.swift
//  AR Tour Guide
//
//  Created by iosDev on 1/26/20.
//  Copyright © 2020 Creative Labs. All rights reserved.
//

import UIKit
import RealityKit

class ViewController: UIViewController, UIScrollViewDelegate {
    @IBOutlet var arView: ARView!
    @IBOutlet var scrollView: UIScrollView!
    var blurEffectView: UIVisualEffectView!
    let pageControl = UIPageControl(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
    var pageControlView: UIView!
    var frameVal = CGRect(x: 0, y: 0, width: 0, height: 0)
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
    override func viewDidLoad() {
        super.viewDidLoad()
        //MARK: Onboarding
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
        if !UserDefaults.standard.bool(forKey: "onboarded") {
            view.addSubview(blurEffectView)
            view.addSubview(scrollView)
            view.addSubview(pageControlView)
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
            imageView.image = UIImage(named: "onboarding4")
            view3.addSubview(imageView)
            self.scrollView.addSubview(view3)
            x = view3.frame.origin.x + scrollView.frame.size.width
            scrollView.contentSize = CGSize(width: x, height: scrollView.frame.size.height)
            //fourthview
            let view4 = UIView(frame: CGRect(x: x, y: 0, width: scrollView.frame.size.width, height: scrollView.frame.size.height))
            let getStartedButton = UIButton(frame: CGRect(x: scrollView.frame.size.width*0.5-75, y: scrollView.frame.size.height*0.5-50, width: 150, height: 50))
            getStartedButton.titleLabel?.textColor = .white
            getStartedButton.setTitle("Get Started", for: .normal)
            getStartedButton.backgroundColor = .systemBlue
            getStartedButton.layer.cornerRadius = getStartedButton.frame.size.height/2
            getStartedButton.layer.masksToBounds = true
            getStartedButton.addTarget(self, action: #selector(onBoardingDone(sender:)), for: .touchUpInside)
            view4.addSubview(getStartedButton)
            self.scrollView.addSubview(view4)
            x = view4.frame.origin.x + scrollView.frame.size.width
            scrollView.contentSize = CGSize(width: x, height: scrollView.frame.size.height)
            scrollView.delegate = self
        }
        
        
        // Load the "Box" scene from the "Experience" Reality File
        let boxAnchor = try! Experience.loadBox()
        // Add the box anchor to the scene
        arView.scene.anchors.append(boxAnchor)
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let pageNumber = scrollView.contentOffset.x / scrollView.frame.size.width
        pageControl.currentPage = Int(pageNumber)
    }
    
    override func viewDidAppear(_ animated: Bool) {
//        if !UserDefaults.standard.bool(forKey: "Onboarded") {
//            let storyboard = UIStoryboard(name: "Onboarding", bundle: nil)
//            if let onboardingViewController = storyboard.instantiateViewController(identifier: "WelcomeViewController") as? WelcomeViewController {
//           present(onboardingViewController, animated: true, completion: nil)
//            }
//        }
    }
}
