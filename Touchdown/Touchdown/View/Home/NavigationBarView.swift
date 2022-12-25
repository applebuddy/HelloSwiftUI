//
//  NavigationBarView.swift
//  Touchdown
//
//  Created by MinKyeongTae on 2022/12/25.
//

import SwiftUI

struct NavigationBarView: View {
  // MARK: - Properties
  
  @State private var isAnimated: Bool = false
  
  // MARK: - Body

  var body: some View {
    HStack {
      Button(action: {}, label: {
        Image(systemName: "magnifyingglass")
          .font(.title)
          .foregroundColor(.black)
      }) //: Button

      Spacer()
      
      LogoView()
        .opacity(isAnimated ? 1 : 0) // 서서히 보여짐
        .offset(x: 0, y: isAnimated ? 0 : -25) // 위로 올라옴
        .onAppear(perform: {
          withAnimation(.easeOut(duration: 0.5)) {
            isAnimated.toggle()
          }
        })
      
      Spacer()
      
      Button(action: {}, label: {
        ZStack {
          Image(systemName: "cart")
            .font(.title)
          .foregroundColor(.black)
          
          Circle()
            .fill(.red)
            .frame(width: 14, height: 14, alignment: .center)
            .offset(x: 13, y: -10)
        }
      }) //: Button
    } //: HStack
  }
}

// MARK: - Preview

struct NavigationBarView_Previews: PreviewProvider {
  static var previews: some View {
    NavigationBarView()
      .previewLayout(.sizeThatFits)
      .padding()
  }
}
