//
//  CalculatorBrain.swift
//  Calculator
//
//  Created by Mac Bellingrath on 9/22/15.
//  Copyright © 2015 Mac Bellingrath. All rights reserved.
//

import Foundation



func calculateNumbers(x: Double,  y: Double, operation: OperationType)  -> Double {
    
    switch operation {
        
    case .Addition:
        return x + y
        
    case .Subtraction:
        return x - y
    case .Multiplication:
        return x * y
    case .Division:
        return x / y
    case .Modulo:
        return x % y
    }
    
    
    
}



enum OperationType: String {
    case Addition = "+"
    case Subtraction = "-"
    case Multiplication = "X"
    case Division = "/"
    case Modulo = "%"
}
