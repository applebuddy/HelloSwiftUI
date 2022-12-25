//
//  ContentView.swift
//  Touchdown
//
//  Created by MinKyeongTae on 2022/12/25.
//

import SwiftUI

struct ContentView: View {
  // MARK: - Properties
  
  // MARK: - Body
  
  var body: some View {
    FooterView()
      .padding(.horizontal)
  }
}

// MARK: - Preview

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
