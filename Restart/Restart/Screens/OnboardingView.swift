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
    VStack(spacing: 20) {
      Text("Onboarding")
      
      Button(action: {
        // automatic view change
        // isOnboardingViewActive 프로퍼티 변화가 감지되면 View는 새롭게 랜더링 됩니다.
        isOnboardingViewActive = false
      }) {
        Text("Start")
      }
    }
  }
}

struct OnboardingView_Previews: PreviewProvider {
  static var previews: some View {
    OnboardingView()
  }
}
