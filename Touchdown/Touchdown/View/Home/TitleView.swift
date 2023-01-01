//
//  TitleView.swift
//  Touchdown
//
//  Created by MinKyeongTae on 2023/01/01.
//

import SwiftUI

struct TitleView: View {
  // MARK: - Preview
  
  var title: String
  
  // MARK: - Body

  var body: some View {
    HStack {
      Text(title)
        .font(.largeTitle)
        .fontWeight(.heavy)
      
      Spacer()
    } //: HStack
    .padding(.horizontal)
    .padding(.top, 15)
    .padding(.bottom, 10)
  }
}

// MARK: - Preview

struct TitleView_Previews: PreviewProvider {
  static var previews: some View {
    TitleView(title: "Helmet")
      .previewLayout(.sizeThatFits)
      .padding()
  }
}
