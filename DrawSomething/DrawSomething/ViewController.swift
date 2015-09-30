//
//  ViewController.swift
//  DrawSomething
//
//  Created by Mac Bellingrath on 9/29/15.
//  Copyright © 2015 Mac Bellingrath. All rights reserved.
//

import UIKit


//// Normal
//
//- Create a New App "DrawSomething"
//    - Create a New File "DrawView" based on "UIView"
//        - Using "CGContextRef"
//            - draw a blue circle on the view
//                - draw a square with a red outline that is 10 pt thick
//
//// Hard
//
//- Add "BeginTouches" Function
//- Print "CGPoint" from location of touch
//- Using "CGContextRef"
//- draw a green triangle
//
//// Nightmare
//
//- Using "CGContextRef"
//- draw a scribble using arcs
//
//jo [4:45 PM]


class ViewController: UIViewController {



    override func viewDidLoad() {
        super.viewDidLoad()
        

        
        
      
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        
        for _ in touches {
        
            if let touch = touches.first {
                
//                let newLine = Line()
//                
//                newLine.start = touch.locationInView(view)
//                newLine.strokeColor = UIColor.blackColor()
//                newLine.strokeWidth = 10
//                
//                (view as? DrawView)?.lines.append(newLine)
                
                let newScribble = Scribble()
                
                newScribble.points.append(touch.locationInView(view))
                
                newScribble.strokeWidth = 10
                newScribble.strokeColor = UIColor.blackColor()
                
                (view as? DrawView)?.lines.append(newScribble)
                
            }
        }
    }
    
    
    override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?) {
      
        if let touch = touches.first {
            
            let currentline = (view as? DrawView)?.lines.last

            currentline?.end = touch.locationInView(view)
            view.setNeedsDisplay()
            
            
            if let currentScribble = (view as? DrawView)?.lines.last as? Scribble {
                currentScribble.points.append(touch.locationInView(view))
                view.setNeedsDisplay()
                
            }
            
        }
    }
    




}
