//
//  VideoModel.swift
//  Africa
//
//  Created by MinKyeongTae on 2022/11/25.
//

import Foundation

struct Video: Codable, Identifiable {
  let id: String
  let name: String
  let headline: String
  
  // Computed Property
  var thumbnail: String {
    "video-\(id)"
  }
}
