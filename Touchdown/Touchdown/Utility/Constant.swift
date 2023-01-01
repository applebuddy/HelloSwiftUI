//
//  Constant.swift
//  Touchdown
//
//  Created by MinKyeongTae on 2022/12/25.
//

import SwiftUI

// 앱에 사용되는 전역 상수, getter 선언

// DATA

let players: [Player] = Bundle.main.decode("player.json")
let categories: [Category] = Bundle.main.decode("category.json")
let products: [Product] = Bundle.main.decode("product.json")
let brands: [Brand] = Bundle.main.decode("brand.json")

// COLOR

let colorBackground: Color = .init("ColorBackground")
let colorGray: Color = .init(UIColor.systemGray4)

// LAYOUT

let columnSpacing: CGFloat = 10
let rowSpacing: CGFloat = 10
var gridLayout: [GridItem] {
  return Array(repeating: GridItem(.flexible(), spacing: rowSpacing), count: 2)
}

// API

// IMAGE
// FONT
// STRING
// MISC
