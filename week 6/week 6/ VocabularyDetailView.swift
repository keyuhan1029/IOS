//
//   VocabularyDetailView.swift
//  week 6
//
//  Created by Keyuhan on 2024/4/25.
//


import SwiftUI
struct VocabularyDetailView: View{
    let vocabulary: Vocabulary
    
    var body: some View{
        VStack{
            Text(vocabulary.english)
                .font(.largeTitle.weight(.heavy))
            Text(vocabulary.chinese)
                .font(.title)
                .bold()
            Text(vocabulary.learningState.description)
                .bold()
                .padding(.horizontal, 16)
                .padding(.vertical, 8)
                .foregroundColor(vocabulary.learningState.color)
                .background(vocabulary.learningState.color.quinary, in: .capsule)
        }
    }
}

#Preview {
    VStack{
        VocabularyDetailView(vocabulary: .stub)
        VocabularyDetailView(vocabulary: .init(english: "Banana",chinese:"香蕉", learningState: .forgotten))
    }
}
