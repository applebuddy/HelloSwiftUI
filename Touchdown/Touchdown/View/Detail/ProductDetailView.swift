//
//  ProductDetailView.swift
//  Touchdown
//
//  Created by MinKyeongTae on 2023/01/01.
//

import SwiftUI

struct ProductDetailView: View {
  // MARK: - Property
  
  // MARK: - Body
  
  var body: some View {
    VStack(alignment: .leading, spacing: 5) {
      // NaviBar
      NavigationBarDetailView()
        .padding(.horizontal)
        .padding(.top, UIApplication.shared.windows.first?.safeAreaInsets.top)

      // Header
      HeaderDetailView()
        .padding(.horizontal)
      
      // Detail Top Part
      TopPartDetailView()
        .padding(.horizontal)

      // Detail Bottom Part
      // Ratings + Sizes
      // Description
      // Guantity + Favourite
      // Add to cart
      Spacer()
    } //: VStack
    .ignoresSafeArea(.all, edges: .all)
    .background(
      Color(
        red: sampleProduct.red,
        green: sampleProduct.green,
        blue: sampleProduct.blue
      )
      .ignoresSafeArea(.all, edges: .all)
    )
  }
}

struct ProductDetailView_Previews: PreviewProvider {
  static var previews: some View {
    ProductDetailView()
      .previewLayout(.fixed(width: 375, height: 812))
  }
}
