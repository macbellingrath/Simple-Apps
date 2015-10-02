//
//  SimpleSlider.swift
//  CustomSlider
//
//  Created by Mac Bellingrath on 10/1/15.
//  Copyright © 2015 Mac Bellingrath. All rights reserved.
//

//import UIKit
//import CoreGraphics
//
//
//@IBDesignable
//class SimpleSlider: UIView {
//
//    
//    var swatches = [Swatch]()
//    
//   
//    
// 
//    override func drawRect(rect: CGRect) {
//        ///Drawing Code
//        
//        
//        //1 get current context
//        let context = UIGraphicsGetCurrentContext()
//        
//        
//        
//        
//        for swatch in swatches {
//            
//        }
//        
//        
//        // 2 Build Slider
//        CGContextAddRect(context, rect)
//        
//        
//        CGContextMoveToPoint(context, 0, 0)
//        
//        
//        
//        CGContextAddRect(context, <#T##rect: CGRect##CGRect#>)
//        
//        
//        
//        
//        //2 split the slider rectangle into smaller sub rectangles
//        _ = self.frame.size
//        
//        
//    
//        
//        
//        //Set 5 colors
//        
//        //3 set the color of the smaller sub rectangles
//        
//        //4 stroke/fill color of sub-rectangles
//        
//        //4 register them for touch events
//        
//        //5 pass color to view controller class
//        
//   
//     
//        CGContextFillRect(context, rect)
//        
//        
//
//        
//        setNeedsDisplay()
//    
//    }
//    
//    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
//        
//    }
//    
//    override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?) {
//        
//    }
//
//}
//
//
//
//
//
//class Square {
//    
//    var origin: CGPoint?
//    var size: CGSize?
//    var fillColor: Color?
//
//    
//    init(color: Color, origin: CGPoint, size: CGSize) {
//       
//        self.fillColor = color
//      
//        self.origin = origin
//        
//        self.size = size
//        
//    }
//    
//    
//}
//
//enum Color {
//    case redColor, Green, Blue, Black
//    
//}
