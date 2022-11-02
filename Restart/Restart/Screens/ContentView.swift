//
//  ContentView.swift
//  Restart
//
//  Created by MinKyeongTae on 2022/11/03.
//

import SwiftUI

struct ContentView: View {
  // @AppStorage : propertywrapper
  // User Defaults Key : "onboarding"
  @AppStorage("onboarding") var isOnboardingViewActive: Bool = true
  var body: some View {
    ZStack {
      if isOnboardingViewActive {
        OnboardingView()
      } else {
        HomeView()
      }
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
