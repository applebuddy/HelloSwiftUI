//
//  ProductDetailView.swift
//  Touchdown
//
//  Created by MinKyeongTae on 2023/01/01.
//

import SwiftUI

struct ProductDetailView: View {
  // MARK: - Property
  
  @EnvironmentObject var shop: Shop
  
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
        .zIndex(1)

      // Detail Bottom Part
      VStack(alignment: .center, spacing: 0) {
        // Ratings + Sizes
        RatingsSizesDetailView()
          .padding(.top, -20)
          .padding(.bottom, 10)
        
        // Description
        ScrollView(.vertical, showsIndicators: false) {
          Text(shop.selectedProduct?.description ?? sampleProduct.description)
            .font(.system(.body, design: .rounded))
            .foregroundColor(.gray)
            .multilineTextAlignment(.leading)
        }
        
        // Guantity + Favourite
        QuantityFavoriteDetailView()
          .padding(.vertical, 10)
        
        // Add to Cart
        AddToCartDetailView()
          .padding(.bottom, 20)
      } //: VStack
      .padding(.horizontal)
      .background(
        Color.white
          .clipShape(CustomShape())
          .padding(.top, -105)
      )
    } //: VStack
    .zIndex(0)
    .ignoresSafeArea(.all, edges: .all)
    .background(
      Color(
        red: shop.selectedProduct?.red ?? sampleProduct.red,
        green: shop.selectedProduct?.green ?? sampleProduct.green,
        blue: shop.selectedProduct?.blue ?? sampleProduct.blue
      )
      .ignoresSafeArea(.all, edges: .all)
    )
  }
}

struct ProductDetailView_Previews: PreviewProvider {
  static var previews: some View {
    ProductDetailView()
      .environmentObject(Shop())
      .previewLayout(.fixed(width: 375, height: 812))
  }
}
