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
    
    private var brain = CalculatorBrain()
    
//MARK: Outlets
    
    @IBOutlet private weak var display: UILabel!
    
//MARK: Actions
    
    @IBAction private func performOperation(sender: UIButton) {
        if userIsEnteringANumber
        {
            brain.setAccumulator(displayValue)
            userIsEnteringANumber = false
        }
        
        let mathSymbol = sender.currentTitle!
        brain.performOperation(mathSymbol)
        displayValue = brain.result
        
    }
    
    @IBAction private func touchDigit(sender: UIButton) {
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
    //This variable is a double whose value is always synched with the String display.text
    //When we set this variable, display.text gets set
    //When we get this variable, display.text is got
    var displayValue: Double {
        get {
            print("In the getter")
            //display.text is an optional string so we have to unwrap it to get a String
            //Casting this String to Double gives us an Optional<Double> as Strings such as "hello"
            //would not be convertable.  So we have to unwrap it again (as we're sure it will be numeric
            //since we're ony allowing numeric input
            return Double(display.text!)!
          
        }
        set {
            //This is not like a java setter - it does not set the value
            //of this variable.  It's what you want to happen when this
            //var is being set
            print("In the setter")
            userIsEnteringANumber = false
            display.text = "\(newValue)"
        }
    }

//MARK: Other Methods
    
    
    
    
}

