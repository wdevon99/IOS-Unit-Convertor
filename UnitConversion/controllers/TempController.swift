//
//  TempController.swift
//  UnitConversion
//
//  Created by Devon Wijesinghe on 2/13/20.
//  Copyright © 2020 Devon Wijesinghe. All rights reserved.
//

import Foundation
import UIKit

enum TemperatureUnits: Int {
    case celsius, farenheit, kelvin
}

class TempController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var celsiusTf: UITextField!
    @IBOutlet weak var farenheitTf: UITextField!
    @IBOutlet weak var kelvinTf: UITextField!
    @IBOutlet weak var keyboard: Keyboard!
    
    var temperature : Temperature = Temperature(celsius: 0.0, farenheit: 0.0, kelvin: 0.0)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.assignDelegates()
        self.loadDefaultsData("TemparatureHistory")
    }
    
    func loadDefaultsData(_ historyKey :String) {
        let defaults = UserDefaults.standard
        temperature.historyStringArray = defaults.object(forKey: historyKey) as? [String] ?? [String]()
    }
    
    func assignDelegates() {
        celsiusTf.delegate = self
        farenheitTf.delegate = self
        kelvinTf.delegate = self
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        keyboard.activeTextField = textField
    }
    
    @IBAction func onTfValueChanged(_ sender: UITextField) {
        guard let textFieldValue = sender.text else { return }
        guard let doubleTextFieldValue = Double(textFieldValue) else { return }
        
    
        switch TemperatureUnits(rawValue: sender.tag)! {
            
        case .celsius:
            temperature.celsius = doubleTextFieldValue
            temperature.farenheit = (doubleTextFieldValue * 9/5 + 32)
            temperature.kelvin = doubleTextFieldValue + 273.15
            
            farenheitTf.text = "\(temperature.farenheit)"
            kelvinTf.text = "\(temperature.kelvin)"
        case .farenheit:
            temperature.celsius = (doubleTextFieldValue - 32) * 5/9
            temperature.farenheit = doubleTextFieldValue
            temperature.kelvin = (doubleTextFieldValue - 32) * 5/9 + 273.15
            
            celsiusTf.text = "\(temperature.celsius)"
            kelvinTf.text = "\(temperature.kelvin)"
            
        case .kelvin:
            temperature.celsius = doubleTextFieldValue - 273.15
            temperature.farenheit = (doubleTextFieldValue - 273.15) * 9/5 + 32
            temperature.kelvin = doubleTextFieldValue
            
            celsiusTf.text = "\(temperature.celsius)"
            farenheitTf.text = "\(temperature.farenheit)"
        }
        
    }
    
    @IBAction func onSave(_ sender: UIBarButtonItem) {
        let defaults = UserDefaults.standard
        let historyString = "\(temperature.celsius) celsius | \(temperature.farenheit) farenheit | \(temperature.kelvin) kelvin"
        
        temperature.historyStringArray.append(historyString)
        defaults.set(temperature.historyStringArray, forKey: "TemparatureHistory")
    }
    
}

