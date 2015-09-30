//
//  DrawView.swift
//  DrawSomething
//
//  Created by Mac Bellingrath on 9/29/15.
//  Copyright © 2015 Mac Bellingrath. All rights reserved.
//

import UIKit

class DrawView: UIView {
    

    

    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        for touch in touches {
            print(touch.locationInView(self))
        }
    }
    
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        
        let context = UIGraphicsGetCurrentContext()
       
        
        //oval
        let path = UIBezierPath(ovalInRect: rect)
        UIColor.blueColor().setFill()
        path.fill()
        
        
        //square
        let squarePath = UIBezierPath(rect: rect)
        UIColor.redColor().setStroke()
        CGContextSetStrokeColorWithColor(context, UIColor.redColor().CGColor)
        CGContextSetLineWidth(context, 10)
        squarePath.stroke()
        
        
        //triangle
        
        CGContextSetFillColorWithColor(context, UIColor.greenColor().CGColor)
        CGContextBeginPath(context)
        CGContextMoveToPoint(context, 80, 200)
 
        
        CGContextAddLineToPoint(context, 20, 300)
        
        CGContextAddLineToPoint(context, 140, 300)
        
        CGContextClosePath(context)
        CGContextDrawPath(context, .EOFillStroke)
        
    }
    
    

}
