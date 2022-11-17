//
//  FruitDetailView.swift
//  Fruits
//
//  Created by MinKyeongTae on 2022/11/12.
//

import SwiftUI

struct FruitDetailView: View {
  // MARK: - Properties
  
  var fruit: Fruit

  // MARK: - Body

  var body: some View {
    NavigationView {
      ScrollView(.vertical, showsIndicators: false) {
        VStack(alignment: .center, spacing: 20) {
          // Header
          FruitHeaderView(fruit: fruit)
          
          VStack(alignment: .leading, spacing: 20) {
            // Title
            Text(fruit.title)
              .font(.largeTitle)
              .fontWeight(.heavy)
              .foregroundColor(fruit.gradientColors[1])
            
            // HeadLine
            Text(fruit.headline)
              .font(.headline)
              .multilineTextAlignment(.center)
            
            // Nutrients
            FruitNutrientsView(fruit: fruit)
            
            // SubHeadLine
            Text("Learn more about \(fruit.title)".uppercased())
              .fontWeight(.bold)
              .foregroundColor(fruit.gradientColors[1])
            
            // Description
            Text(fruit.description)
              .multilineTextAlignment(.leading)
            
            // Link
            SourceLinkView()
              .padding(.top, 10)
              .padding(.bottom, 40)
          } //: VStack
          .padding(.horizontal, 20)
          .frame(maxWidth: 640, alignment: .center)
        } //: VStack
        .navigationBarTitle(fruit.title, displayMode: .inline)
        .navigationBarHidden(true)
      } //: Scroll
      .edgesIgnoringSafeArea(.top)
    } //: Navigation
    // iPad는 iPhone과 sheetView, navigationView의 기본 표출 방식이 다르기 때문에 이를 고려하며 개발을 해야 한다.
    // StackNavigationViewStyle을 적용하면, iPad에서도 한 화면에 하나의 View가 가득차 보이게 할 수 있다. (적용 안하면 좌측 사이드 뷰로 보이게 됨)
    .navigationViewStyle(StackNavigationViewStyle())
  }
}

// MARK: - Preview

struct FruitDetailView_Previews: PreviewProvider {
  static var previews: some View {
    FruitDetailView(fruit: fruitsData[0])
  }
}
