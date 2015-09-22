//
//  ViewController.swift
//  Calculator
//
//  Created by Mac Bellingrath on 9/21/15.
//  Copyright © 2015 Mac Bellingrath. All rights reserved.
//

import UIKit




//make decimal button work


extension String {
    
    static func emptyString() -> String {
        return ""
    }
}


var number1 = String.emptyString()
var number2 = String.emptyString()
var operation: OperationType?



class ViewController: UIViewController {


    @IBOutlet weak var displayLabel: SpringLabel!
    
    @IBOutlet weak var currentOperationLabel: UILabel!
    
    @IBAction func digitPressed(button: UIButton) {
        
        let digit = button.titleLabel!.text!
        
       
       
        if operation == nil {
            if (displayLabel.text!.rangeOfString(".") != nil) {
                let current = displayLabel.text
                number1 += current!
                displayLabel.text = number1
                
            }

            number1 += digit
            displayLabel.text = number1
            
            
            
        } else {
            
            number2 += digit
            displayLabel.text = number2
        }
        
    }
    
    
    //append decimal to display label text 
    
    @IBAction func decimalButtonPressed(button: UIButton) {
   
            displayLabel.text! += "."
        
        
    }
    
    @IBAction func clear(){
    
        if displayLabel.text == "0" {
          
            return
            
        } else {
            
            displayLabel.animation = "slideDown"
            displayLabel.animate()

        
        displayLabel.text = "0"
        number1 = String.emptyString()
        number2 = String.emptyString()
        operation = nil
        
            
        currentOperationLabel.text = String.emptyString()

        }
    }
    
    
    @IBAction func changeSign() {
        
        if displayLabel.text == "0" {
            return
        } else {
            
        
        
        
        var value = 0.0
        
        if operation == nil {
            
            value = Double(number1)! * -1
            number1 = "\(formatNumbers(value))"
            
        } else {
           
                value = Double(number2)! * -1
                number2 = "\(formatNumbers(value))"
  
        }
        
    
        displayLabel.text = "\(formatNumbers(value))"
        }
        
        

    }
    
    
    @IBAction func setOperation(button: UIButton) {
    
        let opSign = button.titleLabel!.text!
        operation = OperationType(rawValue: opSign)
        
        currentOperationLabel.text = "\(opSign)"
        
        if number2 != String.emptyString() {
            
            number1 = number2
            number2 = String.emptyString()
            
        }
    }
    
    
    @IBAction func performOperation(button: UIButton) {
        
        
    
       

        
        if operation != nil {
    
            if let num1 =  Double(number1) {
                if let num2 = Double(number2){
                    let total = calculateNumbers(num1, y: num2, operation: operation!)
                    displayLabel.text = "\(formatNumbers(total))"
                    animateLabel()
                    number1 = number2
                    number2 = "\(total)"
                    
                }
            }

        }
    
    }
    
    func animateLabel() {
        displayLabel.animation = "slideLeft"
        displayLabel.animate()
    }
    
    func formatNumbers(number: Double) -> String {
       
        let tempNumber = String(format: "%g", number)
        return tempNumber
    
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        currentOperationLabel.text = String.emptyString()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(true)
   
    }
    
    
    
    
}



