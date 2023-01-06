//
//  ContentView.swift
//  Touchdown
//
//  Created by MinKyeongTae on 2022/12/25.
//

import SwiftUI

struct ContentView: View {
  // MARK: - Properties
  /// ContentView 하위 뷰 어디서든 광역적으로 shop EnvironmentObject variable을 사용할 수 있다.
  @EnvironmentObject var shop: Shop
  
  // MARK: - Body
  
  var body: some View {
    ZStack {
      if shop.showingProduct == false && shop.selectedProduct == nil {
        VStack(spacing: 0) {
          NavigationBarView()
            .padding(.horizontal, 16)
            .padding(.bottom)
            .padding(.top, UIApplication.shared.windows.first?.safeAreaInsets.top ?? 0.0)
            .background(.white)
            .shadow(color: .black.opacity(0.05), radius: 5, x: 0, y: 5)
          
          ScrollView(.vertical, showsIndicators: false, content: {
            VStack(spacing: 0) {
              FeaturedTabView()
                .frame(height: 250)
                .padding(.vertical, 20)
              
              CategoryGridView()
              
              TitleView(title: "Helmets")
              
              LazyVGrid(columns: gridLayout, spacing: 15, content: {
                ForEach(products) { product in
                  ProductItemView(product: product)
                    .onTapGesture {
                      // haptic event
                      feedback.impactOccurred()

                      withAnimation(.easeOut) {
                        shop.selectedProduct = product
                        shop.showingProduct = true
                      }
                    }
                } //: Loop
              }) //: Grid
              .padding(15)
              
              TitleView(title: "Brands")
              
              BrandGridView()
              
              FooterView()
                .padding(.horizontal)
            } //: VStack
          }) //: Scroll
        } //: VStack
        .background(colorBackground.ignoresSafeArea(.all, edges: .all))
      } else {
        ProductDetailView()
      }
    } //: ZStack
    .ignoresSafeArea(.all, edges: .top)
  }
}

// MARK: - Preview

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
      .previewDevice("iPhone 12 Pro")
      .environmentObject(Shop())
  }
}
