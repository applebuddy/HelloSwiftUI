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
  @State private var imageOffset: CGSize = .zero
  @State private var indicatorOpacity: Double = 1.0
  @State private var textTitle: String = "Share."
  
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
          Text(textTitle)
            .font(.system(size: 60))
            .fontWeight(.heavy)
            .foregroundColor(.white)
            .transition(.opacity) // text transition animation setting
            .id(textTitle) // * id를 통해 지정된 값이 변경되면 해당 뷰가 변경되었으므로, 업데이트가 필요함을 알릴 수 있다. -> id를 지정하니, textTitle 변경에 따라 opacity animation이 동작한다.
          
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
          // Horizontal Parallax Effect (수평 평행 효과 적용)
          CircleGroupView(ShapeColor: .white, ShapeOpacity: 0.2)
            .offset(x: imageOffset.width * -1) // 아재 x좌표 이동방향 반대로 링이 이동
            .blur(radius: abs(imageOffset.width / 5)) // 드래그 이동한 것의 0.2배 정도로 blur radius 처리
            .animation(.easeOut(duration: 1), value: imageOffset)

          // * rotationEffect : angle, anchor parameter를 설정할 수 있다. (아래에서는 angle만 설정, anchor는 미설정 시, .center로 설정됨)
          Image("character-1")
            .resizable()
            .scaledToFit()
            .opacity(isAnimating ? 1 : 0) // 아재가 서서히 보여짐
            .animation(.easeOut(duration: 0.5), value: isAnimating)
            .offset(x: imageOffset.width * 1.2, y: 0) // drag offset 1.2배 정도의 움직임
            .rotationEffect(.degrees(Double(imageOffset.width / 20)))
            .gesture(
              DragGesture()
                .onChanged { gesture in
                  if abs(imageOffset.width) <= 150 {
                    imageOffset = gesture.translation
                    // 제스쳐를 할때에는 인디케이터가 사라짐
                    withAnimation(.linear(duration: 0.25)) {
                      indicatorOpacity = 0.0
                      textTitle = "Give." // text transition
                    }
                  }
                }
                .onEnded { _ in
                  imageOffset = .zero
                  
                  withAnimation(.linear(duration: 0.25)) {
                    // 제스쳐를 마칠때, 안할때는 인디케이터가 보여짐
                    indicatorOpacity = 1.0
                    textTitle = "Share." // text transition
                  }
                }
              //: Gesture
            )
            .animation(.easeOut(duration: 1), value: imageOffset)
        } //: Center
        .overlay( // Center View에 대한 overlay View 적용
          Image(systemName: "arrow.left.and.right.circle")
            .font(.system(size: 44, weight: .ultraLight))
            .foregroundColor(.white)
            .offset(y: 20)
            .opacity(isAnimating ? 1 : 0)
            .animation(.easeOut(duration: 1).delay(2), value: isAnimating)
            .opacity(indicatorOpacity)
          , alignment: .bottom
        )
        
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
