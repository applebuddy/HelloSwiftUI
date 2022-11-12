//
//  SourceLinkView.swift
//  Fruits
//
//  Created by MinKyeongTae on 2022/11/12.
//

import SwiftUI

struct SourceLinkView: View {
    var body: some View {
      // GroupBox is available on iOS14+
      GroupBox() {
        HStack {
          Text("Content source")
          Spacer()
          Link("Wikipedia", destination: URL(string: "https://wikipedia.com")!)
          Image(systemName: "arrow.up.right.square")
        }
        .font(.footnote)
      }
    }
}

struct SourceLinkView_Previews: PreviewProvider {
    static var previews: some View {
        SourceLinkView()
        .previewLayout(.sizeThatFits)
        .padding()
    }
}
