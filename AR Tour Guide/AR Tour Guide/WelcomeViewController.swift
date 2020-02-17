//
//  WelcomeViewController.swift
//  AR Tour Guide
//
//  Created by LiRachel on 2/2/20.
//  Copyright © 2020 Creative Labs. All rights reserved.
//

import UIKit

class WelcomeViewController: UIViewController {
    @IBOutlet var StartButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        //#0F75BC
        StartButton.backgroundColor = UIColor(red: 15.0/255, green: 117.0/255, blue: 188.0/255, alpha: 1.0)
        // Do any additional setup after loading the view.
    }
    @IBAction func startButtonPressed(sender: UIButton) {
        //performSegue(withIdentifier: "showARView", sender: self)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
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
