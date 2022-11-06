//
//  ContentView.swift
//  Pinch
//
//  Created by MinKyeongTae on 2022/11/06.
//
// MARK: 29. 2. SwiftUI Double Tap Gesture
// MARK: 31. 4. SwiftUI Long Press Gesture
// MARK: 32. 5. SwiftUI Control Interface (Scale Down, Scale Up, Reset)
// MARK: 33. 6. SwiftUI Magnification Gesture
// MARK: 34. 7. Drawer User Interface

import SwiftUI

struct ContentView: View {
  // MARK: - Property
  
  @State private var isAnimating: Bool = false
  @State private var imageScale: CGFloat = 1
  @State private var imageOffset: CGSize = .zero
  @State private var isDrawerOpen: Bool = false
  
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
        Color.clear

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
        // MARK: - 3. Magnification
          .gesture(
            MagnificationGesture()
            // pinch로 확대, 축소를 할때 View의 크기에 대한 상세 조절
              .onChanged { value in
                withAnimation(.linear(duration: 1)) {
                  if imageScale >= 1 && imageScale <= 5 {
                    imageScale = value
                  } else if imageScale > 5 {
                    imageScale = 5
                  }
                }
              }
              .onEnded { _ in
                if imageScale > 5 {
                  imageScale = 5
                } else if imageScale <= 1 {
                  resetImageState()
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
      // MARK: - Info Panel
      .overlay(
        InfoPanelView(scale: imageScale, offset: imageOffset)
          .padding(.horizontal)
          .padding(.top, 30)
        , alignment: .top
      )
      // MARK: -  Controls
      .overlay(
        Group {
          HStack {
            // Scale Down
            Button {
              withAnimation(.spring()) {
                // 이미지 크기를 점진적으로 1씩 감속 시키는 액션
                if imageScale > 1 {
                  imageScale -= 1
                  if imageScale <= 1 {
                    resetImageState()
                  }
                }
              }
            } label: {
              ControlImageView(icon: "minus.magnifyingglass")
            }
            // Reset
            Button {
              resetImageState()
            } label: {
              ControlImageView(icon: "arrow.up.left.and.down.right.magnifyingglass")
            }
            // Scale Up
            Button {
              withAnimation(.spring()) {
                // 이미지 크기를 점진적으로 1씩 감속 시키는 액션
                if imageScale < 5 {
                  imageScale += 1
                  if imageScale > 5 {
                    resetImageState()
                  }
                }
              }
            } label: {
              ControlImageView(icon: "plus.magnifyingglass")
            }
          } //: Controls
          .padding(EdgeInsets(top: 12, leading: 20, bottom: 12, trailing: 20))
          .background(.ultraThinMaterial)
          .cornerRadius(12)
          .opacity(isAnimating ? 1 : 0)
        }
          .padding(.bottom, 30),
        alignment: .bottom
      )
      // MARK: - Drawer
      .overlay(
        HStack(spacing: 12) {
          // MARK: - Drawer Handle, drawer 손잡이
          Image(systemName: isDrawerOpen ? "chevron.compact.right" : "chevron.compact.left")
            .resizable()
            .scaledToFit()
            .frame(height: 40)
            .padding(8)
            .foregroundStyle(.secondary)
            .onTapGesture(perform: {
              withAnimation(.easeOut) {
                // drawer 이미지 클릭마다 여닫힘 액션 발생 with animation
                isDrawerOpen.toggle()
              }
            })

          // MARK: - Thumbnails
          Spacer()
        } //: Drawer
          .padding(EdgeInsets(top: 16, leading: 8, bottom: 16, trailing: 8))
          .background(.ultraThinMaterial)
          .cornerRadius(12)
          .opacity(isAnimating ? 1 : 0)
          .frame(width:  260)
          .padding(.top, UIScreen.main.bounds.height / 12)
          .offset(x: isDrawerOpen ? 20 : 215)
        , alignment: .topTrailing
      )
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
