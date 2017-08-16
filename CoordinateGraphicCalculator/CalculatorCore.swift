//
//  CalculatorCore.swift
//  CoordinateGraphicCalculator
//
//  Created by JiaYanwei on 8/10/17.
//  Copyright © 2017 JiaYanwei. All rights reserved.
//

import Foundation

struct CalcultorCore {
    
    var accumulator: Double = 0
    var result: Double?
    var resultIsPending: Bool = true
    var description: String = "0"
    
    enum funcType {
        case unary((Double)->Double)
        case binary((Double, Double)->Double)
    }
    
    struct functionElements {
        var latestOperand: Double
        var didCalc: funcType
    }
    
    let funcMap: Dictionary<String, funcType> = [
        "+" : .binary({$0 + $1}),
        "√" : .unary(sqrt),
        ]
    
    
    mutating func doMath(_ calSymbol: String, num: Double)->Bool {
        let calFunc = funcMap[calSymbol]!
        switch calFunc {
        case let .binary(binaryFunc):
            if calSymbol == "÷" && num == 0 {
            return false
            }
            result = binaryFunc(accumulator, num)
        case .unary(let unaryFunc):
            if calSymbol == "√" && accumulator < 0 {
                return false
            }
            result = unaryFunc(accumulator)
        default:
            break
        }
        
        return true
    }
    
}
