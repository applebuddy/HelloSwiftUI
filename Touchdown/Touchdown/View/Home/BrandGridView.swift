//
//  BrandGridView.swift
//  Touchdown
//
//  Created by MinKyeongTae on 2023/01/01.
//

import SwiftUI

struct BrandGridView: View {
  // MARK: - Property
  
  // MARK: - Body
  var body: some View {
    ScrollView(.horizontal, showsIndicators: false) {
      LazyHGrid(rows: gridLayout, spacing: columnSpacing) {
        ForEach(brands) { brand in
          BrandItemView(brand: brand)
        }
      } //: Grid
      .frame(height: 200)
      .padding(15)
    } //: Scroll
  }
}

struct BrandGridView_Previews: PreviewProvider {
  static var previews: some View {
    BrandGridView()
      .previewLayout(.sizeThatFits)
      .background(colorBackground)
  }
}
