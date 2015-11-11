//
//  Extensions.swift
//  Bubbles
//
//  Created by Mac Bellingrath on 11/10/15.
//  Copyright © 2015 TeamOne. All rights reserved.
//

import UIKit

import AVFoundation
public
extension AVAudioPlayer {
    
   public
    enum AssetIdentifier: String {
        case Intrigue, Books
        
    }
    
    
    public
    convenience init?(assetIdentifier: AssetIdentifier)  {
        
        guard let file = NSDataAsset(name: assetIdentifier.rawValue) else { return nil }
        
        try? self.init(data: file.data)
        
    }
    
}