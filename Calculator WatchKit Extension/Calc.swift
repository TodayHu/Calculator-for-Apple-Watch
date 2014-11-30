//
//  Calc.swift
//  Calculator
//
//  Created by Guanshan Liu on 30/11/2014.
//  Copyright (c) 2014 guanshanliu. All rights reserved.
//

import Foundation

enum Operation {
    case Unknown, Sum, Subtraction, Multiplication, Division
}

class Calc {

    var operation: Operation = .Unknown
    var result: Float = 0

    class var shared : Calc {

        struct Static {
            static let instance = Calc()
        }

        return Static.instance
    }

    func calculate(input: Float) {
        switch operation {
        case .Sum:
            result = result + input
        case .Subtraction:
            result = result - input
        case .Multiplication:
            result = result * input
        case .Division:
            result = result / input
        case _: break
        }
    }

    func clear() {
        result = 0
        operation = .Unknown
    }
    
}
