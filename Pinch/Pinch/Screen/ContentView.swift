//
//  ContentView.swift
//  Pinch
//
//  Created by MinKyeongTae on 2022/11/06.
//
// MARK: 29. 2. SwiftUI Double Tap Gesture

import SwiftUI

struct ContentView: View {
  // MARK: - Property
  
  @State private var isAnimating: Bool = false
  @State private var imageScale: CGFloat = 1
  @State private var imageOffset: CGSize = .zero
  
  // MARK: - Function
  
  func resetImageState() {
    return withAnimation(.spring()) {
      imageScale = 1
      imageOffset = .zero
    }
  }
  
  // MARK: - Content

  var body: some View {
    NavigationView {
      ZStack {
        // MARK: - Page Image
        Image("magazine-front-cover")
          .resizable()
          .aspectRatio(contentMode: .fit)
          .cornerRadius(10)
          .padding()
          .shadow(color: .black.opacity(0.2), radius: 12, x: 2, y: 2)
          .opacity(isAnimating ? 1 : 0)
          .offset(x: imageOffset.width, y: imageOffset.height)
          .scaleEffect(imageScale)
        // MARK: - 1.  Tap Gesture
        // tap count가 2번은 되어야 이벤트 발생
        // 더블 탭을 하면 확대 이미지는 원래 이미지로, 원래 이미지는 확대 이미지로 변경
          .onTapGesture(count: 2, perform: {
            if imageScale ==  1 {
              withAnimation(.spring()) {
                // scale up
                imageScale = 5
              }
            } else {
              withAnimation(.spring()) {
                // back to default
                resetImageState()
              }
            }
          })
        // MARK: - 2. Drag Gesture
          .gesture(
            DragGesture()
              .onChanged { value in
                withAnimation(.linear(duration: 1)) {
                  imageOffset  = value.translation
                }
              }
              .onEnded { _ in
                if imageScale <= 1 {
                  withAnimation(.spring()) {
                    resetImageState()
                  }
                }
              }
          )
      } //: ZStack
      .navigationTitle("Pinch & Zoom")
      .navigationBarTitleDisplayMode(.inline)
      .onAppear {
        withAnimation(.linear(duration: 1)) {
          isAnimating = true
        }
      }
    } //: NavigationView
    .navigationViewStyle(.stack)
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
      .preferredColorScheme(.dark)
  }
}
