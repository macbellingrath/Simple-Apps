//
//  Constants.swift
//  CoreNotes
//
//  Created by Mac Bellingrath on 11/18/15.
//  Copyright © 2015 Mac Bellingrath. All rights reserved.
//


import UIKit

extension UIColor {

    class func capeCodColor() -> UIColor {
    return UIColor(hue:0, saturation:0, brightness:0.19, alpha:1)
    }
    
    class func mandyColor() -> UIColor {
        return UIColor(hue:0.99, saturation:0.64, brightness:0.93, alpha:1)
    }
    class func mantisColor() -> UIColor {
        return UIColor(hue:0.27, saturation:0.62, brightness:0.83, alpha:1)
    }
}

extension UIViewController: UITextFieldDelegate {
    
    public func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
