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
        
        // MARK: - Center
        
        ZStack {
          CircleGroupView(ShapeColor: .white, ShapeOpacity: 0.2)

          Image("character-1")
            .resizable()
            .scaledToFit()
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
            Capsule()
              .fill(Color("ColorRed"))
              .frame(width: 80)
            
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
            .onTapGesture {
              // drag 버튼을 탭 하면, isOnboardingViewActive = false로 셋팅
              // -> View 재 랜더링, HomeView로 이동 됨.
              isOnboardingViewActive = false
            }
            
            Spacer()
          } //: HStack
        } //: Footer
        .frame(height: 80, alignment: .center)
        .padding()
      } //: VStack
    } //: ZStack
  }
}

struct OnboardingView_Previews: PreviewProvider {
  static var previews: some View {
    OnboardingView()
  }
}
