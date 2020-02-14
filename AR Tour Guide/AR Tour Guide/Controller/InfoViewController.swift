//
//  InfoViewController.swift
//  AR Tour Guide
//
//  Created by Rachel Li on 2/13/20.
//  Copyright © 2020 Creative Labs. All rights reserved.
//

import UIKit

class InfoViewController: UIViewController {
    @IBOutlet var label: UILabel!
    var text: String!
    override func viewDidLoad() {
        super.viewDidLoad()
        label.text = text
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
