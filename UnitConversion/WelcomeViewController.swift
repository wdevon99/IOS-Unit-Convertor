//
//  WelcomeViewController.swift
//  NavigationProject
//
//  Created by Devon Wijesinghe on 2/6/20.
//  Copyright © 2020 Devon Wijesinghe. All rights reserved.
//

import UIKit

class WelcomeViewController: UIViewController {
     override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func loginPressed(_ sender: Any) {
        let mainTabController = storyboard?.instantiateViewController(withIdentifier : "MainTabController") as! MainTabController
        mainTabController.selectedViewController = mainTabController.viewControllers?[0]
        present(mainTabController, animated: true, completion: nil) 
    }
    
}

