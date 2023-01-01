//
//  HeaderDetailView.swift
//  Touchdown
//
//  Created by MinKyeongTae on 2023/01/01.
//

import SwiftUI

struct HeaderDetailView: View {
  var body: some View {
    VStack(alignment: .leading, spacing: 6) {
      Text("Protective Gear")
        .font(.largeTitle)
        .fontWeight(.black)
    } //: VStack
    .foregroundColor(.white)
  }
}

struct HeaderDetailView_Previews: PreviewProvider {
  static var previews: some View {
    HeaderDetailView()
      .previewLayout(.sizeThatFits)
      .padding()
      .background(.gray)
  }
}
