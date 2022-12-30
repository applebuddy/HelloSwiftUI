//
//  CategoryModel.swift
//  Touchdown
//
//  Created by MinKyeongTae on 2022/12/31.
//

import Foundation

struct Category: Codable, Identifiable {
  let id: Int
  let name: String
  let image: String
}
