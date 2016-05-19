//
//  Calculator.swift
//  StanfordCalc
//
//  Created by Micaela Neus on 5/18/16.
//  Copyright © 2016 Micaela Neus. All rights reserved.
//

import Foundation

class Calculator {

    private var accumulator = 0.0

    var result : Double {
        get {
            return accumulator
        }
    }

    private var operations : Dictionary<String, Operation> = [
        // Constants
        "π"     : Operation.Constant(M_PI),
        "e"     : Operation.Constant(M_E),
        // Unary Operations
        "q"     : Operation.UnaryOperation(sqrt),
        "cos"   : Operation.UnaryOperation(cos),
        // Binary Operations
        "x"     : Operation.BinaryOperation( { $0 * $1 }),
        "+"     : Operation.BinaryOperation( { $0 + $1 }),
        "-"     : Operation.BinaryOperation({ $0 - $1 }),
        "/"     : Operation.BinaryOperation({ $0 / $1 }),
        // Equality
        "="     : Operation.Equality,
    ]

    private enum Operation {
        case Constant(Double)
        case UnaryOperation((Double) -> Double)
        case BinaryOperation((Double, Double) -> Double)
        case Equality
    }

    private struct PendingBinaryOperationInfo {
        var binaryFunction: (Double, Double)-> Double
        var firstOperand : Double
    }

    private var pending : PendingBinaryOperationInfo?
    func setOperand(operand: Double) {
        accumulator = operand
    }

    private func executePendingBinaryOperation() {
        if pending != nil {
            accumulator = pending!.binaryFunction((pending!.firstOperand), accumulator)
            pending = nil
        }
    }

    func performOperation(symbol: String) {
        if let operation = operations[symbol] {
            switch operation {
            case .Constant(let constantValue) :
                accumulator = constantValue
            case .UnaryOperation(let function) :
                function(accumulator)
            case .BinaryOperation(let function) :
                executePendingBinaryOperation()
                pending = PendingBinaryOperationInfo(binaryFunction: function, firstOperand: accumulator)
            case .Equality :
                executePendingBinaryOperation()

            default : break
            }
        }
    }
}