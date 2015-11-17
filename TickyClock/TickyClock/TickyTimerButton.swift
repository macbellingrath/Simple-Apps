//
//  TickyTimerButton.swift
//  TickyClock
//
//  Created by Mac Bellingrath on 11/10/15.
//  Copyright © 2015 Mac Bellingrath. All rights reserved.
//

import UIKit


@IBDesignable
class TickyTimerButton: UIButton {
    
//    @IBInspectable var cornerRadius: CGFloat = 0

       override func drawRect(rect: CGRect) {
        // Drawing code
        
        let wider = rect.width > rect.height
        
        self.layer.cornerRadius = wider ? (rect.width / 2) : (rect.height / 2)
        self.clipsToBounds = true
        self.layer.masksToBounds = true
    }


}
