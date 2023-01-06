//
//  Shop.swift
//  Touchdown
//
//  Created by MinKyeongTae on 2023/01/07.
//

import Foundation

class Shop: ObservableObject {
  @Published var showingProduct: Bool = false
  @Published var selectedProduct: Product? = nil
}
