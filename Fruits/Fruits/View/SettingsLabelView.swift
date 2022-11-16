//
//  SettingsLabelView.swift
//  Fruits
//
//  Created by MinKyeongTae on 2022/11/17.
//

import SwiftUI

struct SettingsLabelView: View {
  // MARK: - Properties
  
  var labelText: String
  var labelImage: String
  
  // MARK: - Body

  var body: some View {
    HStack {
      Text(labelText.uppercased()).fontWeight(.bold)
      Spacer()
      Image(systemName: labelImage)
    }
  }
}

struct SettingsLabel_Previews: PreviewProvider {
  static var previews: some View {
    SettingsLabelView(labelText: "Fruits", labelImage: "info.circle")
      .previewLayout(.sizeThatFits)
      .padding()
  }
}
