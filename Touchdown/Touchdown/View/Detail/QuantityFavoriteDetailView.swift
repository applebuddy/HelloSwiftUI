//
//  QuantityFavoriteDetailView.swift
//  Touchdown
//
//  Created by MinKyeongTae on 2023/01/01.
//

import SwiftUI

struct QuantityFavoriteDetailView: View {
  // MARK: - Property

  @State private var counter: Int = 0
  
  // MARK: - Body

  var body: some View {
    HStack(alignment: .center, spacing: 6) {
      Button {
        if counter > 0 {
          feedback.impactOccurred()
          counter -= 1
        }
      } label: {
        Image(systemName: "minus.circle")
      }
      
      Text("\(counter)")
        .fontWeight(.semibold)
        .frame(minWidth: 36)
      
      Button {
        if counter < 100 {
          feedback.impactOccurred()
          counter += 1
        }
      } label: {
        Image(systemName: "plus.circle")
      }
      
      Spacer()
      
      Button {
        feedback.impactOccurred()
      } label: {
        Image(systemName: "heart.circle")
          .foregroundColor(.pink)
      }
    } //: HStack
    .font(.system(.title, design: .rounded))
    .foregroundColor(.black)
    .imageScale(.large)
  }
}

struct QuantityFavoriteDetailView_Previews: PreviewProvider {
  static var previews: some View {
    QuantityFavoriteDetailView()
      .previewLayout(.sizeThatFits)
      .padding()
  }
}
