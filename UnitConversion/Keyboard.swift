//
//  Keyboard.swift
//  UnitConversion
//
//  Created by Devon Wijesinghe on 2/13/20.
//  Copyright © 2020 Devon Wijesinghe. All rights reserved.
//

import UIKit

class Keyboard: UIView {
    let nibName = "Keyboard"
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
    
    
    @IBAction func onBtnPressed(_ sender: UIButton) {
        print("Value = " + String(sender.tag))
        
        switch sender.tag {
            case 10:
                print(10)
            case 11:
                print(11)
            case 12:
                print(12)
            default:
             print(sender.tag)
        }
    }
    
    
    
    
}
