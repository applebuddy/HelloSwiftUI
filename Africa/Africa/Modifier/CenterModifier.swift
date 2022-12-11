//
//  CenterModifier.swift
//  Africa
//
//  Created by MinKyeongTae on 2022/12/11.
//

import SwiftUI

struct CenterModifier: ViewModifier {
  func body(content: Content) -> some View {
    HStack {
      Spacer()
      content
      Spacer()
    }
  }
}


