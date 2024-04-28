//
//  vocabulary.swift
//  week 6
//
//  Created by Keyuhan on 2024/4/25.
//

import Foundation

struct Vocabulary : Identifiable, Hashable{
    var id: UUID
    var english: String
    var chinese: String
    var learningState: LearningState
    
    init(id: UUID = UUID(), english: String, chinese: String, learningState: LearningState = .new) {
        self.id = id;
        self.english = english
        self.chinese = chinese
        self.learningState = learningState
    }
}

extension Vocabulary {
    static let stub = Vocabulary(english: "apple", chinese: "蘋果")
}

extension [Vocabulary] {
    static let stub = [
        Vocabulary(english: "carrot", chinese: "胡蘿蔔", learningState: .learned),
        Vocabulary(english: "broccoli", chinese: "花椰菜", learningState: .forgotten),
        Vocabulary(english: "tomato", chinese: "番茄", learningState: .learned),
        Vocabulary(english: "green pepper", chinese: "青椒"),
        Vocabulary(english: "rice", chinese: "米"),
        Vocabulary(english: "wheat", chinese: "小麥"),
        Vocabulary(english: "corn", chinese: "玉米"),
        Vocabulary(english: "oats", chinese: "燕麥"),
        Vocabulary(english: "beef", chinese: "牛肉"),
        Vocabulary(english: "chicken", chinese: "雞肉"),
        Vocabulary(english: "pork", chinese: "豬肉")
    ]
}
