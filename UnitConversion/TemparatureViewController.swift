//
//  TemparatureViewController.swift
//  UnitConversion
//
//  Created by Devon Wijesinghe on 2/8/20.
//  Copyright © 2020 Devon Wijesinghe. All rights reserved.
//

import Foundation
import UIKit

enum TemperatureUnits: Int {
    case celsius, farenheit, kelvin
}

class TemparatureViewController : UIViewController, UITextFieldDelegate {
    @IBOutlet weak var celciusTf: UITextField!
    @IBOutlet weak var farenheitTf: UITextField!
    @IBOutlet weak var kelvinTf: UITextField!
    @IBOutlet weak var customKeyboard: CustomKeyboard!
    
    var celsius = ""
    var farenheit = ""
    var kelvin = ""
    var historyStringArray = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.assignDelegates()
        self.loadDefaultsData("TemparatureHistory")
    }
    
    func assignDelegates() {
        celciusTf.delegate = self
        farenheitTf.delegate = self
        kelvinTf.delegate = self
    }
    
    func loadDefaultsData(_ historyKey :String) {
        let defaults = UserDefaults.standard
        historyStringArray = defaults.object(forKey: historyKey) as? [String] ?? [String]()
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        customKeyboard.activeTextField = textField
    }
    
    @IBAction func onTfValueChanged(_ sender: UITextField) {
        guard let textFieldValue = sender.text else { return }
        guard let doubleTextFieldValue = Double(textFieldValue) else { return }
        
        switch TemperatureUnits(rawValue: sender.tag)! {
            case .celsius:
                celsius = "\(doubleTextFieldValue)"
                farenheit = "\(doubleTextFieldValue * 9/5 + 32)"
                kelvin = "\(doubleTextFieldValue + 273.15)"
                
                farenheitTf.text = farenheit
                kelvinTf.text = kelvin
            
            case .farenheit:
                celsius = "\((doubleTextFieldValue - 32) * 5/9)"
                farenheit = "\(doubleTextFieldValue)"
                kelvin = "\((doubleTextFieldValue - 32) * 5/9 + 273.15)"
                
                celciusTf.text = celsius
                kelvinTf.text = kelvin
            
            case .kelvin:
                celsius = "\(doubleTextFieldValue - 273.15)"
                farenheit = "\((doubleTextFieldValue - 273.15) * 9/5 + 32)"
                kelvin = "\(doubleTextFieldValue)"
                
                celciusTf.text = celsius
                farenheitTf.text = farenheit
        }
    }
    
    @IBAction func onSave(_ sender: Any) {
        let defaults = UserDefaults.standard
        let historyString = celsius + " celsius | " + farenheit + " farenheit | " + kelvin + " kelvin"

        historyStringArray.append(historyString)
        defaults.set(historyStringArray, forKey: "TemparatureHistory")
    }
    
}
