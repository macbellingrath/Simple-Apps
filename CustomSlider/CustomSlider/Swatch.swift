//
//  Swatch.swift
//  CustomSlider
//
//  Created by Mac Bellingrath on 10/2/15.
//  Copyright © 2015 Mac Bellingrath. All rights reserved.
//

import Foundation
import UIKit

class Swatch {
    
    var color: UIColor!
    var size: CGSize!
    var isSelected = false
    
    init(color: UIColor, size: CGSize) {
        self.color = color
        self.size  = size
        
    }
}