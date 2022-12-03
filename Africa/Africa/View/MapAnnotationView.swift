//
//  MapAnnotationView.swift
//  Africa
//
//  Created by MinKyeongTae on 2022/12/03.
//

import SwiftUI

struct MapAnnotationView: View {
  // MARK: - Properties
  
  var location: NationalParkLocation
  @State private var animation: Double = 0.0
  
  // MARK: - Body
  var body: some View {
    ZStack {
      Circle()
        .fill(Color.accentColor)
        .frame(width: 54, height: 54, alignment: .center)
      Circle()
        .stroke(Color.accentColor, lineWidth: 2)
        .frame(width: 52, height: 52, alignment: .center)
        .scaleEffect(1 + CGFloat(animation)) // 2배 크기로 서서히 커지면서
        .opacity(1 - animation) // 서서이 사라지는 효과
      Image(location.image)
        .resizable()
        .scaledToFit()
        .frame(width: 48, height: 48, alignment: .center)
        .clipShape(Circle())
    } //: ZStack
    .onAppear {
      // 2초마다 반복 애니메이션을 수행
      withAnimation(.easeOut(duration: 2).repeatForever(autoreverses: false)) {
        animation = 1
      }
    }
  }
}

// MARK: - Preview
struct MapAnnotationView_Previews: PreviewProvider {
  static var locations: [NationalParkLocation] = Bundle.main.decode("locations.json")
  static var previews: some View {
    MapAnnotationView(location: locations[0])
      .previewLayout(.sizeThatFits)
      .padding()
  }
}
