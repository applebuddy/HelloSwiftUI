//
//  OnboardingView.swift
//  Fruits
//
//  Created by MinKyeongTae on 2022/11/12.
//

import SwiftUI

struct OnboardingView: View {
  // MARK: - Properties
  
  var fruits: [Fruit] = fruitsData
  
  // MARK: - Body

  var body: some View {
    TabView {
      ForEach(fruits[0...5]) { item in
        FruitCardView(fruit: item)
      } //: Loop
    } //: Tab
    .tabViewStyle(PageTabViewStyle()) // PageTabViewStyle을 사용하여 페이지뷰를 쉽게 구현할 수 있다. (iOS 14+)
    .padding(.vertical, 20)
  }
}

// MARK: - Preview

struct OnboardingView_Previews: PreviewProvider {
  static var previews: some View {
    OnboardingView(fruits: fruitsData)
  }
}
