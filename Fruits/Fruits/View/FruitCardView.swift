//
//  FruitCardView.swift
//  Fruits
//
//  Created by MinKyeongTae on 2022/11/12.
//

import SwiftUI

struct FruitCardView: View {
  // MARK: - Properties
  
  @State private var isAnimating: Bool = false

  // MARK: - Body
  
  var body: some View {
    ZStack {
      VStack(spacing: 20) {
        // Fruit: Image
        Image("blueberry")
          .resizable()
          .scaledToFit()
          .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.15), radius: 8, x: 6, y: 8)
          .scaleEffect(isAnimating ? 1.0 : 0.6) // 0.6 -> 1.0 scale로 확대되어 보여짐 with animation
        // Fruit: Title
        Text("Blueberry")
          .foregroundColor(.white)
          .font(.largeTitle)
          .fontWeight(.heavy)
          .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.15), radius: 2, x: 2, y: 2)
        // Fruit: HeadLine
        Text("Blueberries are sweet, nutritious and wildly popular fruit all over the world.")
          .foregroundColor(.white)
          .multilineTextAlignment(.center)
          .padding(.horizontal, 16)
          .frame(maxWidth: 480)
        // Button: Start
        StartButtonView()
      } //: VStack
    } //: ZStack
    .onAppear {
      withAnimation(.easeOut(duration: 0.5)) {
        isAnimating = true
      }
    }
    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .center)
    .background(
      LinearGradient(
        gradient: Gradient(
          colors: [Color("ColorBlueberryLight"), Color("ColorBlueberryDark")]),
        startPoint: .top,
        endPoint: .bottom
      )
    )
    .cornerRadius(20)
    .padding(.horizontal, 20)
  }
}

// MARK: - Preview

struct FruitCardView_Previews: PreviewProvider {
  static var previews: some View {
    FruitCardView()
      .previewLayout(.fixed(width: 320, height: 640))
  }
}
