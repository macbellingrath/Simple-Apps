//
//  Random.swift
//  Bubbles
//
//  Created by Mac Bellingrath on 11/9/15.
//  Copyright © 2015 TeamOne. All rights reserved.
//

import UIKit


public func random<T: Comparable >(t: T, r: (min: T, max: T)?) -> T {
    
    var _t = t
   
    
    
    switch _t {
        
    case let x where x is Int :
//        guard let _r = r  where _r.max <  _r.min else { return  _t = _r.min }
    case let x where x is Float : break
    case let x where x is Double : break
    case let x where x is UIColor : break
    case let x where x is CGFloat : break
    case let x where x is String : break
    default: return _t

    }
    return _t
}





public func randomInt(min: Int, max: Int) -> Int {
    if max < min { return min }
    return Int(arc4random_uniform(UInt32((max - min) + 1))) + min
}

public func randomFloat() -> Float {
    return Float(arc4random()) /  Float(UInt32.max)
}

 public func randomFloat(min: Float, max: Float) -> Float {
    return (Float(arc4random()) / Float(UInt32.max)) * (max - min) + min
}

 public func randomDouble(min: Double, max: Double) -> Double {
    return (Double(arc4random()) / Double(UInt32.max)) * (max - min) + min
}

 public func randomCGFloat() -> CGFloat {
    return CGFloat(randomFloat())
}

public func randomCGFloat(min: Float, max: Float) -> CGFloat {
    return CGFloat(randomFloat(min, max: max))
}

public func randomColor() -> UIColor {
    return UIColor(red: randomCGFloat(), green: randomCGFloat(), blue: randomCGFloat(), alpha: 1)
    }




