//
//  MainView.swift
//  Africa
//
//  Created by MinKyeongTae on 2022/11/19.
//

// * Bundle : iOS, macOS에서 앱, 프레임워크, 플러그인, 실행가능한 코드, 관련 자원들(이미지, 사운드, 비디오 드응)을 사용하기 위해 Bundle을 사용한다.

import SwiftUI

struct MainView: View {
  var body: some View {
    TabView {
      ContentView()
        .tabItem {
          Image(systemName: "square.grid.2x2")
          Text("Browse")
        }
      
      VideoListView()
        .tabItem {
          Image(systemName: "play.rectangle")
          Text("watch")
        }
      
      MapView()
        .tabItem {
          Image(systemName: "map")
          Text("Locations")
        }
      
      GalleryView()
        .tabItem {
          Image(systemName: "photo")
          Text("Gallery")
        }
    } //: Tab
  }
}

struct MainView_Previews: PreviewProvider {
  static var previews: some View {
    MainView()
  }
}
