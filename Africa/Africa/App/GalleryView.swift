//
//  GalleryView.swift
//  Africa
//
//  Created by MinKyeongTae on 2022/11/19.
//

import SwiftUI

struct GalleryView: View {
  var body: some View {
    ScrollView(.vertical, showsIndicators: false) {
      Text("Gallery")
    } //: Scroll
    .frame(maxWidth: .infinity, maxHeight: .infinity)
    .background(MotionAnimationView())
  }
}

struct GalleryView_Previews: PreviewProvider {
  static var previews: some View {
    GalleryView()
  }
}
