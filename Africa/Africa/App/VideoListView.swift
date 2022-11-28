//
//  VideoListView.swift
//  Africa
//
//  Created by MinKyeongTae on 2022/11/19.
//

import SwiftUI

struct VideoListView: View {
  //  MARK: - Properties
  
  @State var videos: [Video] = Bundle.main.decode("videos.json")
  
  let hapticImpact = UIImpactFeedbackGenerator(style: .medium)
  
  //  MARK: - Body

  var body: some View {
    NavigationView {
      List {
        ForEach(videos) { item in
          NavigationLink(
            destination: VideoPlayerView(
              videoSelected: item.id,
              videoTitle: item.name
            )
          ) {
            VideoListItemView(video: item)
              .padding(.vertical, 8)
          }
        } //: Loop
      } //: List
      .listStyle(InsetGroupedListStyle()) // InsetGroupedListStyle : iOS14+
      .navigationBarTitle("Videos", displayMode: .inline)
      .toolbar { // toolbar : iOS14+
        ToolbarItem(placement: .navigationBarTrailing) { // ToolbarItem : iOS14+
          Button {
            // Shuffle videos
            videos.shuffle()
            // Getting haptic feedback (only available in real device, not simulator)
            hapticImpact.impactOccurred()
          } label: {
            Image(systemName: "arrow.2.squarepath")
          }
        }
      }
    } //: Navigation
  }
}

struct VideoListView_Previews: PreviewProvider {
  static var previews: some View {
    VideoListView()
  }
}
