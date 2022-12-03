//
//  MotionAnimationView.swift
//  Africa
//
//  Created by MinKyeongTae on 2022/12/03.
//

import SwiftUI

struct MotionAnimationView: View {
  // MARK: - Properties
  
  @State private var randomCircle = Int.random(in: 12...16)
  @State private var isAnimating = false
  
  // MARK: - Functions
  
  // 1. Random Coordinate
  func randomCoordinate(max: CGFloat) -> CGFloat {
    return CGFloat.random(in: 0...max)
  }
  // 2. Random Size
  func randomSize() -> CGFloat {
    return .init(Int.random(in: 10...300))
  }
  // 3. Random Scale
  func randomScale() -> CGFloat {
    return .init(Double.random(in: 0.1...2.0))
  }
  // 4. Random Speed
  func randomSpeed() -> Double {
    return Double.random(in: 0.025...1.0)
  }
  // 5. Random Delay
  func randomDelay() -> Double {
    return Double.random(in: 0...2)
  }

  // MARK: - Body
  
  var body: some View {
    GeometryReader { geometry in
      ZStack {
        ForEach(0 ... randomCircle, id: \.self) { item in
          Circle()
            .foregroundColor(.gray)
            .opacity(0.15)
            .frame(width: randomSize(), height: randomSize(), alignment: .center)
            .scaleEffect(isAnimating ? randomScale() : 1)
            .position(
              x: randomCoordinate(max: geometry.size.width),
              y: randomCoordinate(max: geometry.size.height)
          )
            .animation(
              // delay, speed를 설정하여 spring 효과와 함께 반복 애니메이션을 설정
              // stiffness, damping spring 강성, 제동 효과
              Animation.interpolatingSpring(stiffness: 0.5, damping: 0.5)
                .repeatForever()
                .speed(randomSpeed())
                .delay(randomDelay())
            )
            .onAppear(perform: {
              isAnimating = true
            })
        } //: Loop

        Text("Width: \(Int(geometry.size.width)) Height: \(Int(geometry.size.height))")
      } //: ZStack
    } //: Geometry
  }
}

struct MotionAnimationView_Previews: PreviewProvider {
  static var previews: some View {
    MotionAnimationView()
  }
}
