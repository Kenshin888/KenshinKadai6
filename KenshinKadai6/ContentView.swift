//
//  ContentView.swift
//  KenshinKadai6
//
//  Created by Kenshin on 2024/03/27.
//

import SwiftUI

struct ContentView: View {
    @State var num: Double = 50
    @State var rand = Int.random(in: 1...100)
    @State private var showAlert = false

    var body: some View {

        VStack {
            Spacer()
            Text("\(rand)")
            Slider(value: $num, in: 1...100, step: 1).frame(width: 300)
            Button(action: {
                showAlert = true
            }) {
                Text("判定")
            }
            .alert(isPresented: $showAlert) {
                Alert(
                    title: Text("結果"),
                    message: Text("\(rand == Int(num) ? "あたり" : "はずれ")\nあなたの値：\(Int(num))"),
                    dismissButton: .default(Text("再挑戦")) {
                        self.rand = Int.random(in: 1...100)
                    }
                )
            }
            Spacer()
            Spacer()
        }
    }
}

#Preview {
    ContentView()
}
