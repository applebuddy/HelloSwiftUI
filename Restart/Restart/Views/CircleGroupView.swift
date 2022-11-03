//
//  CircleGroupView.swift
//  Restart
//
//  Created by MinKyeongTae on 2022/11/03.
//

import SwiftUI

// View가 복잡해질 때는 SubView를 재사용 가능한 별도의 View로 분리해서 활용할 수 있다.
struct CircleGroupView: View {
  // MARK: - Property
  
  @State var ShapeColor: Color
  @State var ShapeOpacity: Double
  
  // MARK: - Body
  var body: some View {
    ZStack {
      // State Propertywrapper 값으로 color, opacity를 적용
      Circle()
        .stroke(ShapeColor.opacity(ShapeOpacity), lineWidth: 40)
        .frame(width: 260, height: 260, alignment: .center)
      Circle()
        .stroke(ShapeColor.opacity(ShapeOpacity), lineWidth: 80)
        .frame(width: 260, height: 260, alignment: .center)
    } //: ZStack
  }
}

struct CircleGroupView_Previews: PreviewProvider {
  static var previews: some View {
    ZStack {
      Color("ColorBlue")
        .ignoresSafeArea(.all, edges: .all)

      CircleGroupView(ShapeColor: .white, ShapeOpacity: 0.2)
    }
  }
}
