//
//  learningState.swift
//  week 6
//
//  Created by Keyuhan on 2024/4/25.
//

import SwiftUI

enum LearningState : CaseIterable{ // 可以跑全部
    case new
    case forgotten
    case learned
    
    var color: Color {
        switch self {
            case .new: .green
            case .forgotten: .red
            case .learned: .blue
        }
    }
    
    var description: String {
        switch self {
            case .new: "新單字"
            case .forgotten: "忘記了"
            case .learned: "已學會"
        }
    }
}
