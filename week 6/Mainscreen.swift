

import SwiftUI

struct Mainscreen: View {
    let vocabularies: [Vocabulary]
    var body: some View {
        TabView{
            Group{
                ContentView(vocabularies: vocabularies).tabItem {
                    Label("單字", systemImage: "book")
                }
                Text("測驗畫面")
                    .font(.largeTitle.bold())
                    .tabItem {
                        Label("測驗", systemImage: "lightbulb.min")
                    }
            }
            .toolbarBackground(.visible, for: .tabBar)
            .toolbarBackground(.accent.quinary, for: .tabBar)
        }
        
    }
}

#Preview {
    Mainscreen(vocabularies: .stub)
}
