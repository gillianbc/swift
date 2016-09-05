//
//  CalculatorBrain.swift
//  Calculator
//
//  Created by test on 04/09/2016.
//  Copyright © 2016 test. All rights reserved.
//  To delete a line, Ctrl-A, Ctrl-K, Ctrl-K
//  To go to beginning of line Ctrl-A
//  To go to end of line Ctrl-E

import Foundation

class CalculatorBrain{
    //MARK: Properties
    private var accumulator = 0.0  //the total so far
    private var historyDesc = " "
    
    //public but cannot be set only got
    var result: Double {
        get{
            return accumulator
        }
    }
    var history: String {
        get {
            if (isPartialResult)
            {
                return historyDesc + "..."
            }
            else
            {
                return historyDesc + " = "
            }
        }
    }
    
    var isPartialResult = false
    
    private var operationDictionary: Dictionary<String,OperationType> = [
        "∏" : OperationType.Constant(M_PI),  //type is Constant with associated value M_PI which is a Double
        "e" : OperationType.Constant(M_E),
        "√" : OperationType.UnaryOperation(sqrt),
        "cos" : OperationType.UnaryOperation(cos),
        "sin" : OperationType.UnaryOperation(sin),
        "tan" : OperationType.UnaryOperation(tan),
        "sin'" : OperationType.UnaryOperation(asin),
        "cos'" : OperationType.UnaryOperation(acos),
        "tan'" : OperationType.UnaryOperation(atan),
        "±" : OperationType.UnaryOperation({-$0}),
        "=" : OperationType.Equals,
        "C" : OperationType.Clear,
        "×": OperationType.BinaryOperation({$0 * $1}),
        "÷": OperationType.BinaryOperation({$0 / $1}),
        "+": OperationType.BinaryOperation({$1 + $0}),
        "−": OperationType.BinaryOperation({$0 - $1})
    ]
    
    private struct PendingBinaryOperationInfo {
        var binaryFunction : ((Double, Double) -> Double)
        var firstOperand: Double
    }
    private enum OperationType {
        case Constant(Double)  //associated value for type Constant is a Double
        case UnaryOperation((Double)->Double) //associated value for type UnaryOperation is a function that takes a Double and returns a Double
        case BinaryOperation((Double, Double)->Double)
        case Equals
        case Clear
    }
    
    private var pending : PendingBinaryOperationInfo?
    
    //MARK: Public Methods
    //sets the accumulator to the number being operated on
    //I dispute his choice of method name (setOperand) - it is setting the accumulator to
    //the operand passed in; not the other way around, so I have changed the name
    func setAccumulator(operand: Double){
        accumulator = operand
        historyDesc = historyDesc + "\(operand)"
    }
    
    func performOperation(symbol: String){
        if let operation = operationDictionary[symbol] {
            
            switch operation {
            //create a PendingBinaryOperationInfo struct consisting of the function and the accumulator value
            case .BinaryOperation(let associatedFunction) :
                isPartialResult = true
                historyDesc = historyDesc + " \(symbol) "
                calcTotalSoFar()
                pending = PendingBinaryOperationInfo(binaryFunction: associatedFunction, firstOperand: accumulator)
            case .Constant(let associatedDouble) :
                historyDesc = historyDesc + " \(symbol) "
                accumulator = associatedDouble  //we can call the var anything
            case .Equals :
                //	historyDesc = historyDesc + " \(symbol) "
                calcTotalSoFar()
            case .Clear :
                clearAll()
            case .UnaryOperation(let associatedFunction) :
                historyDesc = " \(symbol) (" + historyDesc + ")"
                accumulator = associatedFunction(accumulator)
            }
        }
        
    }
    
    //MARK: Internal Utility Methods
    private func calcTotalSoFar(){
        if pending != nil {
            accumulator = pending!.binaryFunction(pending!.firstOperand, accumulator)
            clearOp()
        }
    }
    private func clearAll(){
        accumulator = 0.0
        historyDesc = " "
        clearOp()
    }
    private func clearOp(){
        pending = nil
        isPartialResult = false
        
    }
    
    
}
