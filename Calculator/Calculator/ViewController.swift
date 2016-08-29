//
//  ViewController.swift
//  Calculator
//
//  Created by test on 29/08/2016.
//  Copyright © 2016 test. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
//MARK: Properties
    var userIsEnteringANumber = false
    var operandStack: Array<Double> = Array<Double>()
    
    
//MARK: Outlets
    
    @IBOutlet weak var display: UILabel!
    
    
    
    
//MARK: Actions
    
    @IBAction func performOperation(sender: UIButton) {
        let operation = sender.currentTitle!
        if userIsEnteringANumber
        {
        enter()
        }
        
        switch  operation{
        case "×": doOperation{$0 * $1}
        case "÷": doOperation{$1 / $0}
        case "+": doOperation{$0 + $1}
        case "−": doOperation{$1 - $0}
        case "√": doOperation2{sqrt($0)}

        default:
            break
        }
        
    }
    @IBAction func enter() {
        userIsEnteringANumber = false
        operandStack.append(displayValue)
    }
    @IBAction func addDigitToDisplay(sender: UIButton) {
        let digit = sender.currentTitle!
        if userIsEnteringANumber
        {
            display.text = display.text! + digit
            
        }
        else {
            userIsEnteringANumber = true
            display.text = digit
        }
        
            }
    
    //MARK: Computed Properties
    var displayValue: Double {
        get {
            let nnn: NSNumberFormatter = NSNumberFormatter()
            let num: NSNumber = nnn.numberFromString(display.text!)!
            return num.doubleValue
//            return NSNumberFormatter.numberFromString(NSNumberFormatter().display.text!)!.doubleValue
            
        }
        set {
            userIsEnteringANumber = false
            display.text = "\(newValue)"
        }
    }

//MARK: Other Methods
    //arg for doOperation is a function. This function must have 2 args that are doubles 
    //and must return a double
    func doOperation(operation: (Double,Double) -> Double) {
        if operandStack.count >= 2 {
            displayValue = operation(operandStack.removeLast(),operandStack.removeLast())
        }
    }
    //In the lecture, he didn't have to use a different name, just accepted a different signature
    //just like it would in Java.
    //I got an error so just amended the name to make it unique
    func doOperation2(operation: Double -> Double) {
        if operandStack.count >= 1 {
            displayValue = operation(operandStack.removeLast())
        }
    }
    
}

