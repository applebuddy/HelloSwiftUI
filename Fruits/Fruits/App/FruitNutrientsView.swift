//
//  FruitNutrientsView.swift
//  Fruits
//
//  Created by MinKyeongTae on 2022/11/12.
//

import SwiftUI

struct FruitNutrientsView: View {
  // MARK: - Properties
  
  var fruit: Fruit
  let nutrients: [String] = ["Energy", "Sugar", "Fat", "Protein", "Vitamins", "Minerals"]
  
  // MARK: - Body
  var body: some View {
    GroupBox {
      DisclosureGroup("Nutritional value per 100g") {
        ForEach(nutrients.indices, id: \.self) { item in
          Divider().padding(.vertical, 2)
          
          HStack {
            Group {
              Image(systemName: "info.circle")
              Text(nutrients[item])
            }
            .foregroundColor(fruit.gradientColors[1])
            .font(.system(.body).bold())

            Spacer(minLength: 25)
            Text(fruit.nutrition[item])
              .multilineTextAlignment(.trailing)
          }
        }
      }
    } //: Box
  }
}

struct FruitNutrientsView_Previews: PreviewProvider {
  static var previews: some View {
    FruitNutrientsView(fruit: fruitsData[0])
      .preferredColorScheme(.dark)
      .previewLayout(.fixed(width: 375, height: 480))
      .padding()
  }
}
