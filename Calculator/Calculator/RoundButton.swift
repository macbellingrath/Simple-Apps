//
//  RoundButton.swift
//  Calculator
//
//  Created by Mac Bellingrath on 9/21/15.
//  Copyright © 2015 Mac Bellingrath. All rights reserved.
//

import UIKit

class RoundButton: UIButton {    
    
    override func drawRect(rect: CGRect) {
        
        let height = frame.height
        
        layer.cornerRadius = height/2
    
        layer.masksToBounds = true
        
        
    }

}
