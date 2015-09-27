//
//  TTTButton.swift
//  TicTacJo
//
//  Created by Mac Bellingrath on 9/26/15.
//  Copyright © 2015 Mac Bellingrath. All rights reserved.
//

import UIKit

class TTTButton: UIButton {

    var row = 0
    var col = 0
    
    
    
    
    
    var playerNum = 0 {
        
        didSet {
            
            switch playerNum {
                
            case 1: self.setImage(UIImage(assetIdentifier: .Jo), forState: .Normal)
            case 2: self.setImage(UIImage(assetIdentifier: .Swifty), forState: .Normal)
            default: break
                
            }
        }
    }
    
    //override setImage
    override func setImage(image: UIImage?, forState state: UIControlState) {
        super.setImage(image, forState: state)
        self.imageView!.layer.cornerRadius = 50
        self.contentEdgeInsets = UIEdgeInsetsMake(1, 1, 1, 1)
        self.contentHorizontalAlignment = UIControlContentHorizontalAlignment.Fill
        self.contentVerticalAlignment = UIControlContentVerticalAlignment.Fill
        self.contentMode = UIViewContentMode.ScaleAspectFill
    }
    

    
}
