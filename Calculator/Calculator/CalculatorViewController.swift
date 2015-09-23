//
//  CalculatorViewController.swift
//  Calculator
//
//  Created by Mac Bellingrath on 9/23/15.
//  Copyright © 2015 Mac Bellingrath. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {
    
    
    var currentlyEnteringNumber = false
    
    var calculator = Calculator()
    
    @IBOutlet weak var display: SpringLabel!
    

    @IBAction func appendDigit(button: UIButton) {
        let digit = button.currentTitle!
        if currentlyEnteringNumber {
            display.text = display.text! + digit
        } else {
            display.text = digit
            currentlyEnteringNumber = true
        }
    }
    
    @IBAction func operate(button: UIButton) {
        if currentlyEnteringNumber {
            enter()
        }
        if let operation = button.currentTitle {
            if let result = calculator.performOperation(operation) {
                displayValue = result
            } else {
                displayValue = 0
            }
        }
    }
    
    @IBAction func enter() {
        currentlyEnteringNumber = false
        decimalIsPressed = false
        if let result = calculator.pushOperand(displayValue) {
            displayValue = result
        } else {
            displayValue = 0
        }
        
    }
    var decimalIsPressed = false
    
    @IBAction func decimal() {
        currentlyEnteringNumber = true
        if decimalIsPressed == false {
            display.text = display.text! + "."
            decimalIsPressed = true
        }
    }
    
    
    
    @IBAction func clear() {
        currentlyEnteringNumber = false
        display.text = "0.0"
        calculator.performClear()
    }
    
    
    var displayValue: Double {
        get {
            return NSNumberFormatter().numberFromString(display.text!)!.doubleValue
            
        }
        set {
            display.text = "\(newValue)"
            currentlyEnteringNumber = false
        }
        
    }
    

}
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    

