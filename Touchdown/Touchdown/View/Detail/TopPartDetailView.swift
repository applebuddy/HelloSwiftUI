//
//  TopPartDetailView.swift
//  Touchdown
//
//  Created by MinKyeongTae on 2023/01/01.
//

import SwiftUI

struct TopPartDetailView: View {
  // MARK: - Property
  
  @State private var isAnimating: Bool = false
  
  // MARK: - Body

  var body: some View {
    HStack(alignment: .center, spacing: 6) {
      // Price
      VStack(alignment: .leading, spacing: 6) {
        Text("Price")
          .fontWeight(.semibold)
        Text(sampleProduct.formattedPrice)
          .font(.largeTitle)
          .fontWeight(.black)
          .scaleEffect(1.35, anchor: .leading)
      }
      .offset(y: isAnimating ? -50 : -75)
      
      Spacer()

      // Photo
      Image(sampleProduct.image)
        .resizable()
        .scaledToFit()
        .offset(y: isAnimating ? 0 : -35) // decending animation effect
    } //: HStack
    .onAppear {
      withAnimation(.easeOut(duration: 0.75)) {
        isAnimating.toggle()
      }
    }
  }
}

struct TopPartDetailView_Previews: PreviewProvider {
  static var previews: some View {
    TopPartDetailView()
      .previewLayout(.sizeThatFits)
      .padding()
  }
}
