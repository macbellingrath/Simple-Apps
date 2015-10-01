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
    
    @IBInspectable var color: UIColor = UIColor.blackColor()
    
    let colors: [UIColor] = [UIColor.blackColor(),UIColor.whiteColor(), UIColor.orangeColor(),UIColor.cyanColor()]
    
    var size: CGFloat = 44
    
 
    override func drawRect(rect: CGRect) {
        
        // Drawing code
        
        let origin = self.bounds.origin
        let height = size
        let width = size
        let context = UIGraphicsGetCurrentContext()
        
        for color in colors {
           
            let colorSquare = CGRect(x: origin.x + (size * CGFloat(color.hashValue)) , y: origin.y, width: height, height: width)
            print(color)
            color.set()

            
            CGContextFillRect(context, colorSquare)
            
            
        }
        
        
        
        CGContextAddRect(context, rect)
        
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        
    }
    
    override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?) {
        
    }

}
