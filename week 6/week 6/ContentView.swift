//
//  ContentView.swift
//  week 6
//
//  Created by Keyuhan on 2024/4/25.
//

import SwiftUI

struct ContentView: View {
    @State var vocabularies:[Vocabulary]
    @State var selectedlearningState : LearningState?
    
    var filteredVocabulary: [Vocabulary]{
        guard let selectedlearningState else{
            return vocabularies
        }
        return vocabularies.filter{
            $0.learningState == selectedlearningState
        }
        
    }
    var body: some View {
        NavigationStack {
            List{
                ForEach(vocabularies,content: vocabularyRow)
                    .onDelete(perform: { indexSet in
                        for index in indexSet{
                            vocabularies.remove(at: index)
                        }
                    }).onMove{ indices, newOffset in
                        vocabularies.move(fromOffsets: indices, toOffset: newOffset)
                    }
                    .moveDisabled(selectedlearningState !=  nil)
                    .deleteDisabled(selectedlearningState != nil)
            }
            .animation(.default, value: selectedlearningState)
            .contentMargins(.top, 0)
            .navigationTitle("單字本")
            .navigationBarTitleDisplayMode(.inline)
            .navigationDestination(for: Vocabulary.self){ vocabulary in
                VocabularyDetailView(vocabulary: vocabulary)
                    .navigationTitle(vocabulary.english)
            }
            .toolbar{
                ToolbarItem(placement: .primaryAction){
                    Menu{
                        Picker("篩選條件", selection: $selectedlearningState){
                            Text("所有單字")
                                .tag(nil as LearningState?)
                            ForEach(LearningState.allCases, id: \.self){
                                state in
                                Text(state.description)
                                    .tag(state as LearningState?)
                            }
                        }
                    }label: {
                        Image(systemName: "line.3.horizontal.decrease.circle")
                    }
                }
            }
        }
    }
    func vocabularyRow( _ vocabulary : Vocabulary)->some View{
        NavigationLink(value: vocabulary){
            HStack{
                Circle()
                    .fill(vocabulary.learningState.color)
                    .frame(height:12)
                Text(vocabulary.english)
                    .font(.title2.weight(.medium))
            }
            .padding(.vertical, 8)
            .navigationTitle(vocabulary.english)
        }
    }
}

#Preview {
    ContentView(vocabularies: .stub)
}
