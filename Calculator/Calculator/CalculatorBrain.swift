//
//  CalculatorBrain.swift
//  Calculator
//
//  Created by Mac Bellingrath on 9/22/15.
//  Copyright © 2015 Mac Bellingrath. All rights reserved.
//

import Foundation

class Calculator {
    
    private enum Op: CustomStringConvertible {
        case Operand(Double)
        case UnaryOperation(String, Double -> Double)
        case BinaryOperation(String, (Double, Double) -> Double)
        case ConstantOperation(String, Double)
        var description: String {
            get {
                switch self {
                case .Operand(let operand): return "\(operand)"
                case .UnaryOperation(let symbol, _): return symbol
                case .BinaryOperation(let symbol, _): return symbol
                case .ConstantOperation(let symbol, _):
                    return symbol
                    
                }
            }
        }
    }
    
    private var opStack: [Op] = [Op]()
    
    private var knownOps =  [String: Op]()
    
    init() {
        func learnOp(op: Op) {
            knownOps[op.description] = op
            
            learnOp(Op.BinaryOperation("x", *))
            learnOp(Op.BinaryOperation("/") { $1 / $0})
            learnOp(Op.BinaryOperation("+") {$0 + $1})
            learnOp(Op.BinaryOperation("-") {$1 - $0})
            
        }
    }
    
    private func evaluate(ops: [Op]) -> (result: Double?, remainingOps: [Op])
    {
        if !ops.isEmpty {
            var remainingOps = ops
            let op = remainingOps.removeLast()
            switch op {
            case .Operand(let operand):
                return (operand, remainingOps)
            case .UnaryOperation(_, let operation):
                let operandEvaluation = evaluate(remainingOps)
                if let operand = operandEvaluation.result {
                    return (operation(operand), operandEvaluation.remainingOps)
                }
            case .BinaryOperation(_, let operation):
                let op1Evaluation = evaluate(remainingOps)
                if let operand1 = op1Evaluation.result {
                    let op2Evaluation = evaluate(op1Evaluation.remainingOps)
                    if let operand2 = op2Evaluation.result {
                        return (operation(operand1, operand2), op2Evaluation.remainingOps)
                    }
                }
            case .ConstantOperation(_, let value):
                return (value, remainingOps)
            }
            
        }
        return (nil, ops)
    }
    
    func evaluate() -> Double? {
        let (result, remainder) = evaluate(opStack)
        print("\(opStack) = \(result) with \(remainder) left over")
        return result
    }
    
    
    func pushOperand(operand: Double) -> Double? {
        opStack.append(Op.Operand(operand))
        return evaluate()
    }
    
    func performOperation(symbol: String) -> Double? {
        if let operation = knownOps[symbol] {
            opStack.append(operation)
        }
        return evaluate()
    }
    
    func performClear() {
        opStack.removeAll()
    }

}
    


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
