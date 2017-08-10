//
//  CalculatorCore.swift
//  CoordinateGraphicCalculator
//
//  Created by JiaYanwei on 8/10/17.
//  Copyright © 2017 JiaYanwei. All rights reserved.
//

import Foundation

struct calcultorCore {
    
    var accumulator: Double = 0
    
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
    
    
    func doMath(_ cal: funcType, num: Double) {
        switch cal {
        case let .binary(binaryFunc):
            <#code#>
        case .unary(let unaryFunc):
        default:
            <#code#>
        }
    }
    
}
