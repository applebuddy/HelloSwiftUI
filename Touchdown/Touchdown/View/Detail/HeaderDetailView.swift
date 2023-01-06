//
//  HeaderDetailView.swift
//  Touchdown
//
//  Created by MinKyeongTae on 2023/01/01.
//

import SwiftUI

struct HeaderDetailView: View {
  // MARK: - Property
  
  @EnvironmentObject var shop: Shop

  // MARK: - UI

  var body: some View {
    VStack(alignment: .leading, spacing: 6) {
      Text(shop.selectedProduct?.name ?? sampleProduct.name)
        .font(.largeTitle)
        .fontWeight(.black)
    } //: VStack
    .foregroundColor(.white)
  }
}

struct HeaderDetailView_Previews: PreviewProvider {
  static var previews: some View {
    HeaderDetailView()
      .environmentObject(Shop())
      .previewLayout(.sizeThatFits)
      .padding()
      .background(.gray)
  }
}
