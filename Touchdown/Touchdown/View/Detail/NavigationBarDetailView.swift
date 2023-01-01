//
//  NavigationBarDetailView.swift
//  Touchdown
//
//  Created by MinKyeongTae on 2023/01/01.
//

import SwiftUI

struct NavigationBarDetailView: View {
  // MARK: - Property
  
  // MARK: - Body
  var body: some View {
    HStack {
      Button {
        
      } label: {
        Image(systemName: "chevron.left")
          .font(.title)
          .foregroundColor(.white)
      }
      
      Spacer()
      
      Button {
        
      } label: {
        Image(systemName: "cart")
          .font(.title)
          .foregroundColor(.white)
      }
    }
  } //: HStack
}

struct NavigationBarDetailView_Previews: PreviewProvider {
  static var previews: some View {
    NavigationBarDetailView()
      .previewLayout(.sizeThatFits)
      .padding()
      .background(.gray)
  }
}
