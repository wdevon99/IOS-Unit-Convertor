//
//  SpeedViewController.swift
//  UnitConversion
//
//  Created by Devon Wijesinghe on 2/7/20.
//  Copyright © 2020 Devon Wijesinghe. All rights reserved.
//

import Foundation
import UIKit

class SpeedViewController : UIViewController, UITextFieldDelegate {
    var historyStringArray = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.loadDefaultsData("SpeedHistory")
    }
    
    func loadDefaultsData(_ historyKey :String) {
        let defaults = UserDefaults.standard
        historyStringArray = defaults.object(forKey: historyKey) as? [String] ?? [String]()
    }
    
    @IBAction func onSave(_ sender: Any) {
        let defaults = UserDefaults.standard
        let historyString = "Km/h"
        
        historyStringArray.append(historyString)
        defaults.set(historyStringArray, forKey: "SpeedHistory")
    }
    
}
