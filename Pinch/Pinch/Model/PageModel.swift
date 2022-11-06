//
//  PageModel.swift
//  Pinch
//
//  Created by MinKyeongTae on 2022/11/06.
//

import Foundation

struct Page: Identifiable {
  let id: Int
  let imageName: String
}

extension Page {
  var thumbnailName: String {
    return "thumb-" + imageName
  }
}
