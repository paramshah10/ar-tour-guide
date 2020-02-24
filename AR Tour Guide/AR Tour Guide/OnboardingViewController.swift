//
//  OnboardingViewController.swift
//  AR Tour Guide
//
//  Created by Daniel on 2/6/20.
//  Copyright © 2020 Creative Labs. All rights reserved.
//

import UIKit

class OnboardingViewController: UIViewController {
    @IBOutlet var backgroundImage: UIImageView! {
        didSet {
            let blurEffect = UIBlurEffect(style: UIBlurEffect.Style.dark)
            let blurEffectView = UIVisualEffectView(effect: blurEffect)
            blurEffectView.frame = view.bounds
            blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
            view.addSubview(blurEffectView)
        }
    }
    @IBAction func doneButtonTapped(sender: UIButton) {
        UserDefaults.standard.set(true, forKey: "onboarded")
        dismiss(animated: true, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
