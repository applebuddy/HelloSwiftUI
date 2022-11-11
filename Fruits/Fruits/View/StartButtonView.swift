//
//  StartButtonView.swift
//  Fruits
//
//  Created by MinKyeongTae on 2022/11/12.
//

import SwiftUI

struct StartButtonView: View {
  // MARK: - Properties
  
  // MARK: - Body
  var body: some View {
    Button {
      print("Exit the onboarding")
    } label: {
      HStack(spacing: 8) {
        Text("Start")
        
        Image(systemName: "arrow.right.circle")
          .imageScale(.large)
      }
      .padding(.horizontal, 16)
      .padding(.vertical, 10)
      .background(
        Capsule().strokeBorder(.white, lineWidth: 1.25)
      )
    } //: Button
    .accentColor(.white)
  }
}

// MARK: - Preview

struct StartButtonView_Previews: PreviewProvider {
  static var previews: some View {
    StartButtonView()
      .preferredColorScheme(.dark)
      .previewLayout(.sizeThatFits)
  }
}
