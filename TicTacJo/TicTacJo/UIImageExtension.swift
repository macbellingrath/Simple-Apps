//
//  UIImageExtension.swift
//  TicTacJo
//
//  Created by Mac Bellingrath on 9/27/15.
//  Copyright © 2015 Mac Bellingrath. All rights reserved.
//

import UIKit

//An approach to a non-optional UIImage
extension UIImage {
    
    enum AssetIdentifier: String {
        
        case Swifty, Jo
    }
    
    convenience init!(assetIdentifier: AssetIdentifier) {
        
        self.init(named: assetIdentifier.rawValue)
        
        
    }
}