//
//  MyView.swift
//  WorkoutTracker
//
//  Created by Mac Bellingrath on 1/31/16.
//  Copyright © 2016 Mac Bellingrath. All rights reserved.
//

import UIKit
import Material

@IBDesignable
class MyView: MaterialView {

    
    @IBInspectable override var image: UIImage? {
        didSet {
            visualLayer.contents = image?.CGImage
        }
    }
    
    /**
     A property that sets the shadowOffset, shadowOpacity, and shadowRadius
     for the backing layer. This is the preferred method of setting depth
     in order to maintain consitency across UI objects.
     */
    @IBInspectable override var depth: MaterialDepth {
        didSet {
            let value: MaterialDepthType = MaterialDepthToValue(depth)
            shadowOffset = value.offset
            shadowOpacity = value.opacity
            shadowRadius = value.radius
        }
    }
    

    
    /**
     A property that manages the overall shape for the object. If either the
     width or height property is set, the other will be automatically adjusted
     to maintain the shape of the object.
     */
    @IBInspectable override var shape: MaterialShape {
        didSet {
            if .None != shape {
                if width < height {
                    frame.size.width = height
                } else {
                    frame.size.height = width
                }
            }
        }
    }
    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */

}
