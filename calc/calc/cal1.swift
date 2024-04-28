//
//  cal1.swift
//  calc
//
//  Created by Keyuhan on 2024/4/24.
//

import Foundation

struct Calculator {
    var expression = ""
    var display = "0"
    
    mutating func pressNumber(_ number: Int) {
        display += number.description
    }
    
    mutating func pressDot() {
        display += "."
    }
    
    mutating func pressOperator(_ mathOperator: MathOperator) {
        display += mathOperator.mathSymbol
    }
    
    mutating func undo() {
        display = ""
    }
    
    mutating func toggleSign() {
        display = "-" + display
    }
    
    mutating func convertFromPercentage() {
        display += "%"
    }
}
