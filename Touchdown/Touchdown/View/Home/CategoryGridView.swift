//
//  CategoryGridView.swift
//  Touchdown
//
//  Created by MinKyeongTae on 2022/12/31.
//

import SwiftUI

struct CategoryGridView: View {
  var body: some View {
    // 좌우로 Scroll되는 GridView 구성
    // spacing, gridLayout은 전역적으로 선언된 값에 맞게 설정
    ScrollView(
      .horizontal,
      showsIndicators: false,
      content: {
        LazyHGrid(rows: gridLayout, alignment: .center, spacing: columnSpacing, pinnedViews: [], content: {
          Section(
            header: SectionView(rotateClockwise: false),
            footer: SectionView(rotateClockwise: true)
          ) {
            ForEach(categories) { category in
              CategoryItemView(category: category)
            }
          }
        }) //: Grid
        .frame(height: 140)
        .padding(.horizontal, 15)
        .padding(.vertical, 10)
      }
    )
  }
}

struct CategoryGridView_Previews: PreviewProvider {
  static var previews: some View {
    CategoryGridView()
      .previewLayout(.sizeThatFits)
      .padding()
      .background(colorBackground)
  }
}
