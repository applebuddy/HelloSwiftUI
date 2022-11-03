//
//  HomeView.swift
//  Restart
//
//  Created by MinKyeongTae on 2022/11/03.
//

import SwiftUI

struct HomeView: View {
  // MARK: - Property
  
  @AppStorage("onboarding") var isOnboardingViewActive: Bool = false
  
  // MARK: - Body
  
  var body: some View {
    VStack(spacing: 20) {
      // MARK: - Header
      
      Spacer()
      
      ZStack {
        // CircleGroupView를 HomeView, OnboardingView에 재사용
        CircleGroupView(ShapeColor: .gray, ShapeOpacity: 0.1)
        
        Image("character-2")
          .resizable()
          .scaledToFit()
        .padding()
      }
      
      // MARK: - Center
      
      Text("The time that leads to mastery is dependent on the intensity of our focus.")
        .font(.title3)
        .fontWeight(.light)
        .foregroundColor(.secondary)
        .multilineTextAlignment(.center)
        .padding()
      
      // MARK: - Footer
      
      Spacer()
      
      Button(action: {
        isOnboardingViewActive = true
      }) {
        // * HStack을 감싸지 않아도, Button Label 내에 두개 이상의 View가 들어가면 알아서 HStack처럼 레이아웃을 배치해준다.
        Image(systemName: "arrow.triangle.2.circlepath.circle.fill")
          .imageScale(.large)
        Text("Restart")
          .font(.system(.title3, design: .rounded))
          .fontWeight(.bold)
      } //: Button
      .buttonStyle(.borderedProminent) // border를 강조하는 버튼 스타일
      .buttonBorderShape(.capsule) // 버튼 테두리를 Capsule 형태로 디자인
      .controlSize(.large)
    } //: VStack
  }
}

struct HomeView_Previews: PreviewProvider {
  static var previews: some View {
    HomeView()
  }
}
