//
//  DrawView.swift
//  DrawSomething
//
//  Created by Mac Bellingrath on 9/29/15.
//  Copyright © 2015 Mac Bellingrath. All rights reserved.
//

import UIKit

class DrawView: UIView {
    
    
    
    var lines = [Line]() {
        didSet {
            self.setNeedsDisplay()
        }
    }
    
    
    @IBAction func resetButtonPressed(sender: UIButton) {
        
        imageView.image = nil
    }
    @IBOutlet weak var imageView: UIImageView!
    
    var lastPoint = CGPoint.zero
    var swiped = false
    

    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
       
        swiped = false
       
        if let touch = touches.first {
            
        

            lastPoint = touch.locationInView(self)
            print(lastPoint)
        }
        
        for touch in touches {
            print(touch.locationInView(self))
        }
        
    }
    
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        
        //1 Get Current Context
         let context = UIGraphicsGetCurrentContext()
        
        //2 Set stroke and Fill color
        UIColor.magentaColor().set()
       
        //3 loop through lines and draw
        for line in lines {
            if let start = line.start, let end = line.end {
                
                if let fillColor = line.fillColor {
                    fillColor.set()
                    
                }
                if let strokeColor = line.strokeColor {
                    
                    strokeColor.set()
                    
                    CGContextSetLineWidth(context, line.strokeWidth)
                    
                    CGContextSetLineCap(context, .Round)
                    CGContextSetLineJoin(context, .Round)
                    
                    CGContextMoveToPoint(context, start.x, start.y)
                    CGContextAddLineToPoint(context, end.x, end.y)
                    CGContextStrokePath(context)
                   
                    // if line is a scribble
                    
                    if line is Scribble {
                        
                    }
                    
                    if let scribble = line as? Scribble {
                        CGContextAddLines(context, scribble.points, scribble.points.count)
                        
                    } else {
                        
                        CGContextAddLineToPoint(context, end.x, end.y)
                    }
                    
                    CGContextStrokePath(context)
                    
                    
                }

                
            }
           
                    }
        
        let box = CGRectMake(70, 270, 250, 250)
       
        
        
        let tag = self.tag
        
       
       
        if tag == 1{
            
            //oval
            let path = UIBezierPath(ovalInRect: box)
            UIColor.blueColor().setFill()
            path.fill()
        } else if tag == 2 {
            //square
            let squarePath = UIBezierPath(rect: box)
            UIColor.redColor().setStroke()
            CGContextSetStrokeColorWithColor(context, UIColor.redColor().CGColor)
            CGContextSetLineWidth(context, 10)
            squarePath.stroke()
            

            
        } else if tag == 3 {
            
            //triangle
            
            CGContextSetFillColorWithColor(context, UIColor.greenColor().CGColor)
            CGContextBeginPath(context)
            CGContextMoveToPoint(context, 80, 200)
            
            
            CGContextAddLineToPoint(context, 20, 300)
            
            CGContextAddLineToPoint(context, 140, 300)
            
            CGContextClosePath(context)
            CGContextDrawPath(context, .EOFillStroke)
            
        } else if tag == 4 {
            
            
            
        }
        
        
        
        
        
        
  
    }
    
    func drawLineFrom(fromPoint: CGPoint, toPoint: CGPoint) {
        
        // 1
        UIGraphicsBeginImageContext(self.imageView.frame.size)
        let context = UIGraphicsGetCurrentContext()
            imageView.image?.drawInRect(CGRect(x: 0, y: 0, width: self.imageView.frame.size.width, height: self.imageView.frame.size.height))
        
        // 2
        CGContextMoveToPoint(context, fromPoint.x, fromPoint.y)
        CGContextAddLineToPoint(context, toPoint.x, toPoint.y)
        
        // 3
        CGContextSetLineCap(context, .Round)
        CGContextSetLineWidth(context, 10)
        CGContextSetStrokeColorWithColor(context, UIColor.blackColor().CGColor)
        CGContextSetBlendMode(context, .Normal)
        
        // 4
        CGContextStrokePath(context)
        
        // 5
        imageView?.image = UIGraphicsGetImageFromCurrentImageContext()
        
        UIGraphicsEndImageContext()
        
    }
    
    override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?) {
        if let touch = touches.first {
            let currentPoint = touch.locationInView(imageView)
            drawLineFrom(lastPoint, toPoint: currentPoint)
            
       
            lastPoint = currentPoint
        }

    }
    

}



class Line {
    
    var start: CGPoint?
    var end: CGPoint?
    
    var strokeColor: UIColor?
    var fillColor: UIColor?
    
    var strokeWidth: CGFloat = 0
    
    
    
}

class Scribble: Line {
    
    var points = [CGPoint]() {
        didSet {
           
            start = points.first
            end = points.last
            
        }
    }
}
