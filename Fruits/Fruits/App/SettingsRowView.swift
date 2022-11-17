//
//  SettingsRowView.swift
//  Fruits
//
//  Created by MinKyeongTae on 2022/11/18.
//

import SwiftUI

struct SettingsRowView: View {
  // MARK: - Properties
  
  var name: String
  var content: String? = nil
  var linkLabel: String? = nil
  var linkDestination: String? = nil
  
  // MARK: - Body

  var body: some View {
    VStack {
      Divider().padding(.vertical, 4)

      HStack {
        Text(name).foregroundColor(.gray)
        Spacer()
        if let content = self.content {
          Text(content)
        } else if let linkLabel = self.linkLabel, let destination = self.linkDestination {
          Link(linkLabel, destination: URL(string: "https://\(destination)")!)
          Image(systemName: "arrow.up.right.square").foregroundColor(.pink)
        } else {
          EmptyView()
        }
      }
    }
  }
}

struct SettingsRowView_Previews: PreviewProvider {
  static var previews: some View {
    // 다수의 View를 Preview에 띄울 수도 있습니다.
    SettingsRowView(name: "Developer", content: "John / Jane")
      .previewLayout(.fixed(width: 375, height: 60))
      .padding()
    SettingsRowView(name: "Website", content: "SwiftUI Masterclass", linkDestination: "swiftuimasterclass.com")
      .preferredColorScheme(.dark)
      .previewLayout(.fixed(width: 375, height: 60))
      .padding()
  }
}
