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
    
    @IBAction func enter() {
        userIsEnteringANumber = false
        operandStack.append(1.0)
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
    
}

