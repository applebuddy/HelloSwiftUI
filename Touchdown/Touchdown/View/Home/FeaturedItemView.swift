//
//  FeaturedItemView.swift
//  Touchdown
//
//  Created by MinKyeongTae on 2022/12/30.
//

import SwiftUI

struct FeaturedItemView: View {
  // MARK: - Property
    
  let player: Player

  // MARK: - Body

  var body: some View {
    Image(player.image)
      .resizable()
      .scaledToFit()
      .cornerRadius(12)
  }
}

struct FeaturedItemView_Previews: PreviewProvider {
  static var previews: some View {
    FeaturedItemView(player: players[0])
      .previewLayout(.sizeThatFits)
      .padding()
      .background(colorBackground)
  }
}
