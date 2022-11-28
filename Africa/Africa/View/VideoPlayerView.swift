//
//  VideoPlayerView.swift
//  Africa
//
//  Created by MinKyeongTae on 2022/11/29.
//

import SwiftUI
import AVKit

struct VideoPlayerView: View {
  // MARK: - Properties
  
  var videoSelected: String
  var videoTitle: String
  
  // MARK: - Body

  var body: some View {
    if let videoPlayer = playVideo(fileName: videoSelected, fileFormat: "mp4") {
      VStack {
        VideoPlayer(player: videoPlayer) {
          // Text(videoTitle)
        }
        .overlay(
          Image("logo")
            .resizable()
            .scaledToFit()
            .frame(width: 32, height: 32)
            .padding(.top, 6)
            .padding(.horizontal, 8),
          alignment: .topLeading
        )
      } //: VStack
      .accentColor(.accentColor)
      .navigationBarTitle(videoTitle, displayMode: .inline)
    } else {
      Text("Empty...")
    }
  }
}

struct VideoPlayerView_Previews: PreviewProvider {
  static var previews: some View {
    NavigationView {
      VideoPlayerView(videoSelected: "lion", videoTitle: "Lion")
    }
  }
}
