//
//  TouchSlider.swift
//  CustomSlider
//
//  Created by Mac Bellingrath on 10/2/15.
//  Copyright © 2015 Mac Bellingrath. All rights reserved.
//

import UIKit

@IBDesignable
class TouchSlider: UIView {

    //Colors
    @IBInspectable var barColor: UIColor = UIColor.blackColor()
    @IBInspectable var circleColor: UIColor = UIColor.redColor()
    
    //Values
    @IBInspectable var value: CGFloat = 0 {
        didSet {
            if value < minValue { value = minValue }
            if value > maxValue { value = maxValue }
            
            handle?.value = value
            
            print(handle?.value = value)
            
            setNeedsDisplay()
        }
    }
    @IBInspectable var minValue: CGFloat = 0
    @IBInspectable var maxValue: CGFloat = 100
   
    @IBInspectable var handle: Handle!
    
    var isTouchingHandle = false
    
    
    
    
    override func drawRect(rect: CGRect) {
        // Drawing code
        
    
    //Get Current Context
        
    let context =   UIGraphicsGetCurrentContext()

    //Bar Drawing Code
   
    barColor.set()
        
    CGContextMoveToPoint(context, 0, rect.height / 2)
    
    CGContextAddLineToPoint(context, rect.width, rect.height / 2 )
        
    CGContextStrokePath(context)
        
        
        
    //Handle Drawing Code
    handle = handle ?? Handle(rect: rect)
    handle.handleColor.set()
   
    CGContextFillEllipseInRect(context, CGRectInset(handle.oval, 10, 10))
//       
//        CGContextSetBlendMode(context, .Normal)
//        CGContextFillPath(context)

        
    }
    
       
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        
        if let touch = touches.first {
            
            let locPoint = touch.locationInView(self)
            
            isTouchingHandle = CGRectContainsPoint(handle.oval, locPoint)
            
            print(isTouchingHandle)
            
            
        }
        
    }
    
    
    override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?) {
        
        if isTouchingHandle {
            if let touch = touches.first {
                
                let touchX = touch.locationInView(self).x
            
                //touchX - radius = value 
                let removeRadius = touchX - bounds.height / 2
                
                let fullDistance = bounds.width - bounds.height
                
                let percent = removeRadius / fullDistance
                
                value = percent * maxValue
                
                
                
            }
        }
        
    }
    
    

}

class Handle {
    
    var rect: CGRect!
  
    var oval: CGRect {
        let handleX = (rect.width - rect.height) * (value / maxValue)
        return CGRect(x: handleX, y: 0, width: rect.height, height: rect.height)
    }
    var value: CGFloat = 0
    var minValue: CGFloat = 0
    var maxValue: CGFloat = 100
    var handleColor: UIColor = UIColor.redColor()
    var handleWidth: CGFloat {
        return rect.width
    }
    var handleHeight: CGFloat {
        return rect.height
    }
    
    init(rect: CGRect) {
        self.rect = rect
    }
    
    
    var handleX: CGFloat  {
        return (rect.width - rect.height) * (value / maxValue)
    }
}


/*
width - height * (value/max)

*/