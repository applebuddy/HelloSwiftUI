//
//  ContentView.swift
//  Fruits
//
//  Created by MinKyeongTae on 2022/11/12.
//

import SwiftUI

struct ContentView: View {
  // MARK: - Properties
  
  var fruits: [Fruit] = fruitsData

  // MARK: - Body

  var body: some View {
    NavigationView {
      List {
        ForEach(fruits.shuffled()) { item in
          NavigationLink(destination: FruitDetailView(fruit: item)) {
            FruitRowView(fruit: item)
              .padding(.vertical, 4)
          }
        }
      }
      .navigationTitle("Fruits")
    } //: NavigationView
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView(fruits: fruitsData)
      .preferredColorScheme(.dark)
  }
}
