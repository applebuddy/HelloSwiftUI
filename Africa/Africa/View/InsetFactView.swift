//
//  InsetFactView.swift
//  Africa
//
//  Created by MinKyeongTae on 2022/11/20.
//

import SwiftUI

struct InsetFactView: View {
  // MARK: - Properties
  
  let animal: Animal
  
  // MARK: - Body
  
  var body: some View {
    GroupBox {
      TabView {
        ForEach(animal.fact, id: \.self) { item in
          Text(item)
        }
      } //: Tabs
      .tabViewStyle(PageTabViewStyle())
      .frame(minHeight: 148, idealHeight: 168, maxHeight: 180)
    } //: Box
  }
}

struct InsetFactView_Previews: PreviewProvider {
  static let animals: [Animal] = Bundle.main.decode("animals.json")

  static var previews: some View {
    InsetFactView(animal: animals[0])
      .previewLayout(.sizeThatFits)
      .padding()
  }
}
