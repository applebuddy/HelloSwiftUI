//
//  GalleryView.swift
//  Africa
//
//  Created by MinKyeongTae on 2022/11/19.
//

import SwiftUI

struct GalleryView: View {
  // MARK: - Properties
  
  @State private var selectedAnimal: String = "lion"
  
  let animals: [Animal] = Bundle.main.decode("animals.json")
  let haptics = UIImpactFeedbackGenerator(style: .medium)
  
  // Simple Grid Definition
  // 1) let gridLayout: [GridItem] = [
  //   GridItem(.flexible()),
  //   GridItem(.flexible()),
  //   GridItem(.flexible())
  // ]
  
  // 2) Efficient Grid Definition
  // let gridLayout: [GridItem] = Array(repeating: GridItem(.flexible()), count: 3)
  
  // 3) Dynamic Grid Layout
  
  @State private var gridLayout: [GridItem] = [GridItem(.flexible())]
  @State private var gridColumn: Double = 3.0
  
  func gridSwitch() {
    gridLayout = Array(repeating: .init(.flexible()), count: Int(gridColumn))
  }
  
  // MARK: - Body

  var body: some View {
    ScrollView(.vertical, showsIndicators: false) {
      VStack(alignment: .center, spacing: 30) {
        // MARK: - Image
        
        Image(selectedAnimal)
          .resizable()
          .scaledToFit()
          .clipShape(Circle())
          .overlay(Circle().stroke(Color.white, lineWidth: 8))
        
        // MARK: - Slider
        
        Slider(value: $gridColumn, in: 2...4, step: 1)
          .padding(.horizontal)
          .onChange(of: gridColumn, perform: { value in
            gridSwitch()
          })
        
        // MARK: - Grid

        LazyVGrid(columns: gridLayout, alignment: .center, spacing: 10) {
          ForEach(animals) { item in
            Image(item.image)
              .resizable()
              .scaledToFit()
              .clipShape(Circle())
              .overlay(Circle().stroke(Color.white, lineWidth: 1))
              .onTapGesture {
                selectedAnimal = item.image
                haptics.impactOccurred()
              }
          } //: Loop
        } //: Grid
        .animation(.easeIn)
        .onAppear(perform: {
          gridSwitch()
        })
      } //: VStack
      .padding(.horizontal, 10)
      .padding(.vertical, 50)
    } //: Scroll
    .frame(maxWidth: .infinity, maxHeight: .infinity)
    .background(MotionAnimationView())
  }
}

struct GalleryView_Previews: PreviewProvider {
  static var previews: some View {
    GalleryView()
  }
}
