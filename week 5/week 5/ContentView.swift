//
//  SettingsView.swift
//  Calculator
//
//  Created by Jane Chao on 2024/4/17.
//

import SwiftUI

struct SettingsView: View {
    @State var mainColor = Color.orange
    @State var secondaryColor = Color(.systemGray4)
    @State var numberColor = Color.secondary
    @State var fontStyle = Font.Design.default
    
    var body: some View {
        NavigationStack {
            Form {
                Section("顏色設定") {
                    ColorPicker("主要顏色", selection: $mainColor)
                    ColorPicker("次要顏色", selection: $secondaryColor)
                    ColorPicker("數字顏色", selection: $numberColor)
                }
                
                Section("字體設定") {
                    Picker("字體", selection: $fontStyle) {
                        Text("預設").tag(Font.Design.default)
                        Text("圓體").tag(Font.Design.rounded)
                        Text("襯線體").tag(Font.Design.serif)
                        Text("等寬體").tag(Font.Design.monospaced)
                    }
                }
            }
            .navigationTitle("設定")
            .toolbar {
                ToolbarItem(placement: .primaryAction) {
                    Button("完成") { }
                        .bold()
                }
            }
        }
    }
}

#Preview {
    SettingsView()
}
