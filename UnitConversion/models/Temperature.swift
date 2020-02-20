//
//  Temperature.swift
//  UnitConversion
//
//  Created by Devon Wijesinghe on 2/20/20.
//  Copyright © 2020 Devon Wijesinghe. All rights reserved.
//

import Foundation

class Temperature {
    var celsius : Double
    var farenheit : Double
    var kelvin : Double
    var historyStringArray : [String]
    
    init(celsius: Double, farenheit: Double, kelvin: Double) {
        self.celsius = celsius
        self.farenheit = farenheit
        self.kelvin = kelvin
        self.historyStringArray = [String]()
    }
}
