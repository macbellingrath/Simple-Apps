//
//  Random.swift
//  Bubbles
//
//  Created by Mac Bellingrath on 11/9/15.
//  Copyright © 2015 TeamOne. All rights reserved.
//

import UIKit
import AVFoundation

func randomInt(min: Int, max: Int) -> Int {
    if max < min { return min }
    return Int(arc4random_uniform(UInt32((max - min) + 1))) + min
}

func randomFloat() -> Float {
    return Float(arc4random()) /  Float(UInt32.max)
}

func randomFloat(min: Float, max: Float) -> Float {
    return (Float(arc4random()) / Float(UInt32.max)) * (max - min) + min
}

func randomDouble(min: Double, max: Double) -> Double {
    return (Double(arc4random()) / Double(UInt32.max)) * (max - min) + min
}

func randomCGFloat() -> CGFloat {
    return CGFloat(randomFloat())
}

func randomCGFloat(min: Float, max: Float) -> CGFloat {
    return CGFloat(randomFloat(min, max: max))
}

func randomColor() -> UIColor {
    return UIColor(red: randomCGFloat(), green: randomCGFloat(), blue: randomCGFloat(), alpha: 1)
}


extension AVAudioPlayer {
    
    enum AssetIdentifier: String {
        case Intrigue, Books
        
    }
    
    
    
    
    
    convenience init?(assetIdentifier: AssetIdentifier)  {
        
        guard let file = NSDataAsset(name: assetIdentifier.rawValue) else { return nil }
        
        try? self.init(data: file.data)
        
    }
    
}
