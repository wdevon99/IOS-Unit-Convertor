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

    @IBOutlet weak var tf1: UITextField!
    @IBOutlet weak var customKeyboard: CustomKeyboard!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tf1.delegate = self
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        customKeyboard.activeTextField = textField
    }
}
