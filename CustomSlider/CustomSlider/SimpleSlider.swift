//
//  SimpleSlider.swift
//  CustomSlider
//
//  Created by Mac Bellingrath on 10/1/15.
//  Copyright © 2015 Mac Bellingrath. All rights reserved.
//

import UIKit
import CoreGraphics


@IBDesignable
class SimpleSlider: UIView {
    
    
    @IBInspectable var color: UIColor = UIColor.blueColor()
    
    @IBInspectable var cornerRadius = 20
  
    
 
    override func drawRect(rect: CGRect) {
       let context = UIGraphicsGetCurrentContext()
     
        CGContextFillRect(context, rect)
        
        
        color.set()
    
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        
    }
    
    override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?) {
        
    }

}
