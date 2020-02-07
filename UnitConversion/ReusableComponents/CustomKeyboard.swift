//
//  CustomKeyboard.swift
//  UnitConversion
//
//  Created by Devon Wijesinghe on 2/7/20.
//  Copyright © 2020 Devon Wijesinghe. All rights reserved.
//

import UIKit

class CustomKeyboard: UIView {
    
    // ======================== Loading to the view =================================
    
    let nibName = "CustomKeyboard"
    var contentView:UIView?
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        guard let view = loadViewFromNib() else { return }
        view.frame = self.bounds
        self.addSubview(view)
        contentView = view
    }
    
    func loadViewFromNib() -> UIView? {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: nibName, bundle: bundle)
        return nib.instantiate(withOwner: self, options: nil).first as? UIView
    }
    
    // ======================== Event handler for keyboard buttons =================================
    
    var activeTextField = UITextField()
    
    @IBAction func keyboardButtonPressed(_ sender: UIButton) {
        activeTextField.insertText("1")
    }
}
