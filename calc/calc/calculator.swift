//
//  calculator.swift
//  calc
//
//  Created by Keyuhan on 2024/4/24.
//

import Foundation

enum MathOperator: String {
    case add = "+"
    case subtract = "-"
    case divide = "รท"
    case multiply = "ร—"
    case equal = "="
    
    var systemName: String {
        switch self {
            case .add: "plus"
            case .subtract: "minus"
            case .divide: "divide"
            case .multiply: "multiply"
            case .equal: "equal"
        }
    }
    
    var mathSymbol: String {
        rawValue
    }
}
