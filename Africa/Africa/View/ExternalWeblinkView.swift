//
//  ExternalWeblinkView.swift
//  Africa
//
//  Created by MinKyeongTae on 2022/11/20.
//

import SwiftUI

struct ExternalWeblinkView: View {
  // MARK: - Properties
  
  let animal: Animal
  
  // MARK: - Body

  var body: some View {
    GroupBox {
      HStack {
        Image(systemName: "globe")
        Text("Wikipedia")
        Spacer()
        
        Group {
          Image(systemName: "arrow.up.right.square")
          if let link = URL(string: animal.link) {
            Link(animal.name, destination: link)
          } else if let defaultLink = URL(string: "https://wikipedia.org") {
            Link(animal.name, destination: defaultLink)
          }
        }
        .foregroundColor(.accentColor)
      } //: HStack
    } //: Box
  }
}

struct ExternalWeblinkView_Previews: PreviewProvider {
  static let animals: [Animal] = Bundle.main.decode("animals.json")

  static var previews: some View {
    ExternalWeblinkView(animal: animals[0])
      .previewLayout(.sizeThatFits)
      .padding()
  }
}
