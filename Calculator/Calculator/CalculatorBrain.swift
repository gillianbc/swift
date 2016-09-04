//
//  CalculatorBrain.swift
//  Calculator
//
//  Created by test on 04/09/2016.
//  Copyright © 2016 test. All rights reserved.
//

import Foundation
class CalculatorBrain{
    private var accumulator = 0.0
    
    private var operandStack: Array<Double> = Array<Double>()
    
    private var operations: Dictionary<String,Double> = [
    "∏" : M_PI,
    "e" : M_E
    ]
    
    private enum operations {
        case Constant
        case UnaryOperation
        case BinaryOperation
        case Equals
    }
    
    
    //sets the accumulator to the number being operated on
    //I dispute his choice of method name (setOperand) - it is setting the accumulator to
    //the operand passed in; not the other way around, so I have changed the name
    func setAccumulator(operand: Double){
            accumulator = operand
    }
    func performOperation(symbol: String){
        if let constant = operations[symbol] {
            accumulator = constant
        }
        
        
        
        switch  symbol{
        case "×": doOperation{$0 * $1}
        case "÷": doOperation{$1 / $0}
        case "+": doOperation{$0 + $1}
        case "−": doOperation{$1 - $0}
        case "√": doOperation{sqrt($0)}
        case "∏": accumulator = M_PI
        case "e": accumulator = M_E
        default:
            break
        }
    
    }
    var result: Double {
        get{
            return accumulator
        }
    }
    
    //arg for doOperation is a function. This function must have 2 args that are doubles
    //and must return a double
    func doOperation(operation: (Double,Double) -> Double) {
        if operandStack.count >= 2 {
            accumulator = operation(operandStack.removeLast(),operandStack.removeLast())
        }
    }
    //In the lecture, he didn't have to use a different name, just accepted a different signature
    //just like it would in Java.
    //I got an error when this was in the view controller so just amended the name to make it unique.  
    //This was fine once I moved it out of the view controller.  The view controller inherits from UIViewController so some objective C
    // compilation is going on.  Method overloading is not supported in objective C
    func doOperation(operation: Double -> Double) {
        if operandStack.count >= 1 {
            accumulator = operation(operandStack.removeLast())
        }
    }

}
