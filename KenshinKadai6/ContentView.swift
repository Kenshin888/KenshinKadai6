//
//  ContentView.swift
//  KenshinKadai6
//
//  Created by Kenshin on 2024/03/27.
//

import SwiftUI

struct ContentView: View {
    @State var num:Double = 50
    @State var rand = arc4random_uniform(101)
    @State var judgement = "あたり"
    @State private var showAlert = false
    var body: some View {

        VStack{
            Spacer()
            Text("\(rand)")
            Slider(value:$num,in:1...100,step:1).frame(width:300)
            Button(action: {
                showAlert = true
                if rand == Int(num){
                    judgement = "あたり"
                }else {
                    judgement = "はずれ"
                    }
            }) {
                Text("判定")
            }
            .alert(isPresented: $showAlert) {
                        Alert(
                            title: Text("結果"),
                            message: Text("\(judgement)\nあなたの値：\(Int(num))"),
                            dismissButton: .default(Text("再挑戦")){
                                self.rand = arc4random_uniform(101)
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
