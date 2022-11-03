//
//  OnboardingView.swift
//  Restart
//
//  Created by MinKyeongTae on 2022/11/03.
//

import SwiftUI

struct OnboardingView: View {
  // MARK: - Property
  // * 만약 프로그램이 onboarding key의 값을 찾게 되면, true setting은 무시되고, 실제 찾은 값으로 설정 된다.
  @AppStorage("onboarding") var isOnboardingViewActive: Bool = true
  
  @State private var buttonWidth: Double = UIScreen.main.bounds.width - 80
  @State private var buttonOffset: CGFloat = 0.0
  @State private var isAnimating: Bool = false
  
  // MARK: - Body
  
  var body: some View {
    ZStack {
      Color("ColorBlue")
        .ignoresSafeArea(.all, edges: .all)
      VStack(spacing: 20) {
        // MARK: - Header
        
        Spacer()
        // * Tip: brace 뒤에 커서를 두고, option + commend + <- 화살표를 누르면 해당 블럭 코드를 감출 수 있다. ({...}), -> 누르면 다시 펴짐
        VStack(spacing: 0) {
          Text("Share.")
            .font(.system(size: 60))
            .fontWeight(.heavy)
            .foregroundColor(.white)
          
          Text("""
          It's not how much we give but
          how much love we put into giving.
          """)
          .font(.title3)
          .fontWeight(.light)
          .foregroundColor(.white)
          .multilineTextAlignment(.center)
          .padding(.horizontal, 10)
        } //: Header
        .opacity(isAnimating ? 1 : 0) // 서서히 보여짐
        .offset(y: isAnimating ? 0 : -40) // 서서히 내려옴
        .animation(.easeOut(duration: 1), value: isAnimating) // easeOut animation 적용
        
        // MARK: - Center
        
        ZStack {
          CircleGroupView(ShapeColor: .white, ShapeOpacity: 0.2)

          Image("character-1")
            .resizable()
            .scaledToFit()
            .opacity(isAnimating ? 1 : 0) // 아재가 서서히 보여짐
            .animation(.easeOut(duration: 0.5), value: isAnimating)
        } //: Center
        
        Spacer()
        
        // MARK: - Footer
        
        ZStack {
          // Parts of the custom button (footer custom button 구성 요소)
          // 1. Background (Static)
          // * Capsule : capsule 모양의 View (Capsule : Shape / Shape : Animatable, View)
          Capsule()
            .fill(Color.white.opacity(0.2))
          Capsule()
            .fill(Color.white.opacity(0.2))
            .padding(8)

          // 2. Call-to-action (Static)
          // 하단 드래그 영역 설명 문구
          
          Text("Get Started")
            .font(.system(.title3, design: .rounded))
            .fontWeight(.bold)
            .foregroundColor(.white)
            .offset(x: 20)
          
          // 3. Capsule (Dynamic width)
          // drag 버튼 뒷 배경

          HStack {
            // 드래깅을 하면, 드래깅 offset 만큼, 뒷 배경색이 ColorRed로 채워짐.
            Capsule()
              .fill(Color("ColorRed"))
              .frame(width: buttonOffset + 80)
            
            Spacer()
          }
          
          // 4. Circle (Draggable)
          // drag 버튼 앞 디자인
          
          HStack {
            ZStack {
              Circle()
                .fill(Color("ColorRed"))
              Circle()
                .fill(.black.opacity(0.15))
                .padding(8)
              Image(systemName: "chevron.right.2")
                .font(.system(size: 24, weight: .bold))
            }
            .foregroundColor(.white)
            .frame(width: 80, height: 80, alignment: .center)
            .offset(x: buttonOffset) // offset x 변화에 따라 화살표 버튼이 좌우로 이동함
            .gesture(
              DragGesture()
                .onChanged { gesture in
                  // 드래그가 가능하되, 일정 범위 내에서만 드래깅이 되도록 설정
                  if gesture.translation.width > 0 && buttonOffset <= buttonWidth - 80 {
                    buttonOffset = gesture.translation.width
                  }
                }
                .onEnded { _ in
                  withAnimation(Animation.easeOut(duration: 0.4)) {
                    // * 아래 buttonOffset 설정으로 인한 변화에 대해 animation 적용
                    // 1) 드래깅이 화면 중앙 기준, 우측으로 갔다가 놓여지면, HomeView 이동
                    // 2) 드래깅이 화면 중앙 기준, 좌측으로 갔다가 놓여지면, 화면 유지
                    if buttonOffset > buttonWidth / 2 {
                      buttonOffset = buttonWidth - 80
                      isOnboardingViewActive = false
                    } else {
                      // 초기 좌측위치에 버튼이 배치되도록 설정
                      buttonOffset = 0
                    }
                  }
                }
            ) //: Gesture
            
            Spacer()
          } //: HStack
        } //: Footer
        .frame(width: buttonWidth, height: 80, alignment: .center)
        .padding()
        .opacity(isAnimating ? 1 : 0)
        .offset(y: isAnimating ? 0 : 40) // 40 -> 0 으로 footer가 올라옴
        .animation(.easeOut(duration: 1.0), value: isAnimating)
      } //: VStack
    } //: ZStack
    .onAppear {
      isAnimating = true
    }
  }
}

// MARK: - Preview

struct OnboardingView_Previews: PreviewProvider {
  static var previews: some View {
    OnboardingView()
  }
}
