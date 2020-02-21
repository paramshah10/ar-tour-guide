//
//  InfoPageViewController.swift
//  AR Tour Guide
//
//  Created by Adithya Nair on 2/16/20.
//  Copyright © 2020 Creative Labs. All rights reserved.
//

import UIKit
import CoreLocation

class InfoPageViewController: UIViewController {
    
    var location: String?
    
    let locationTextInfo = LocationTextInfo()
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var infoTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleLabel.text = location
        infoTextView.text = locationTextInfo.getInfo(for: location!)
        
    }
    
}
