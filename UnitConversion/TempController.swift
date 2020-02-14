//
//  TempController.swift
//  UnitConversion
//
//  Created by Devon Wijesinghe on 2/13/20.
//  Copyright © 2020 Devon Wijesinghe. All rights reserved.
//

import Foundation
import UIKit

class TempController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var celsiusTf: UITextField!
    @IBOutlet weak var farenheitTf: UITextField!
    @IBOutlet weak var kelvinTf: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        print("WORKING!!!")
    }
}

