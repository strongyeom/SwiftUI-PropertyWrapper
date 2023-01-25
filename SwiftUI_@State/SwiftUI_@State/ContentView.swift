//
//  ContentView.swift
//  SwiftUI_@State
//
//  Created by 염성필 on 2023/01/25.
//

import SwiftUI

struct ContentView: View {
    // 1씩 증가되는 것이 number이기 때문에 버튼을 눌렀을때 상태가 변하므로 @State로 설정
    @State private var number: Int = 0
    // Bool값으로 바텀 시트를 올릴수 있도록 버튼을 눌렀을때 false, true값으로 변해야하기 때문에
    // @State로 설정
    @State private var isShowing: Bool = false
    var body: some View {
        VStack {
            
            Text("\(number)")
                .font(.largeTitle)
            
            Button {
                number += 1
            } label: {
                Text("+1씩 증가시키기 ")
                    .font(.largeTitle)
            }
            .padding(.vertical, 20)
            
            Button {
                isShowing.toggle()
            } label: {
                Text("시트뷰")
                    .font(.largeTitle)
            }
            .padding(.vertical, 20)
            .sheet(isPresented: $isShowing) {
                SheetView(number: $number)
            }
            
            
            Button {
                number = 0
            } label: {
                Text("리셋")
                    .font(.largeTitle)
            }
            .padding(.vertical, 20)

        }
    }
}
struct SheetView: View {
    @Binding var number: Int
    var body: some View {
        Text("\(number)")
    }
}
