//
//  ViewController.swift
//  Calculator
//
//  Created by Mac Bellingrath on 9/21/15.
//  Copyright © 2015 Mac Bellingrath. All rights reserved.
//

import UIKit

//change sign
//remove decimal if .0
// add label to display current operation

//make decimal button work


var number1: String = ""
var number2: String = ""
var operation: OperationType?


class ViewController: UIViewController {

    @IBOutlet weak var displayLabel: SpringLabel!
    
    @IBAction func digitPressed(button: UIButton) {
        
        let num = button.titleLabel!.text!
       
        if operation == nil {
          
            number1 += num
            displayLabel.text = number1
            
            
            
        } else {
            number2 += num
            displayLabel.text = number2
        }
        
    }
    
    @IBAction func clear(){
        
        displayLabel.text = "0"
        number1 = ""
        number2 = ""
        operation = nil
        animateLabel()
    }
    
    @IBAction func changeSign() {
        
        
    }
    
    @IBAction func setOperation(button: UIButton) {
    
        let opSign = button.titleLabel!.text!
        operation = OperationType(rawValue: opSign)
        
    }
    
    
    @IBAction func performOperation(button: UIButton) {
        
       
        
        if operation != nil {
            if  let num1 =  Double(number1) {
                if let num2 = Double(number2){
                    let total = calculateNumbers(num1, y: num2, operation: operation!)
                    number1 = "\(total)"
                    displayLabel.text = "\(total)"
                    animateLabel()
                }
            }
            number2 = ""
        }
        
        


       
       
        
        
    
    }
    
    func animateLabel() {
        displayLabel.animation = "slideLeft"
        displayLabel.animate()
    }
    
    
    
    
}

