//
//  FirstViewController.swift
//  NavigationProject
//
//  Created by Devon Wijesinghe on 2/6/20.
//  Copyright © 2020 Devon Wijesinghe. All rights reserved.
//

import Foundation
import UIKit

class FirstViewController : UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func logoutPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    
}
