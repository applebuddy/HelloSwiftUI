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
      Text("Home")
        .font(.largeTitle)
      
      Button(action: {
        isOnboardingViewActive = true
      }) {
        Text("Restart")
      }
    }
  }
}

struct HomeView_Previews: PreviewProvider {
  static var previews: some View {
    HomeView()
  }
}
