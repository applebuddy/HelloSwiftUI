//
//  ContentView.swift
//  GridViewPractice
//
//  Created by MinKyeongTae on 2022/10/23.
//

import SwiftUI

struct ContentView: View {
  let data = Array(1...1000).map { "목록 \($0)" }
  // 화면을 그리드 형식으로 채워줌
  let columns = [
//    GridItem(.adaptive(minimum: 150)) // 최소크기에 맞게 적절하게 맞춰 뿌려짐, 크기 지정하면 그거에 맞게 벽돌쌓기 처럼 적재함
    GridItem(.flexible()),
    GridItem(.flexible()),
    GridItem(.flexible()) // flexible은 갯수를 명시해주면 그거에 맞게 알아서 사이즈를 조절함
//    GridItem(.fixed(200)) // 고정된 크기
  ]
  
  var body: some View {
    ScrollView {
      LazyVGrid(columns: columns) {
        ForEach(data, id: \.self) { value in
          Text(value)
            .frame(height: 100)
        }
      }
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
