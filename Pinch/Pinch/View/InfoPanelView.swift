//
//  InfoPanelView.swift
//  Pinch
//
//  Created by MinKyeongTae on 2022/11/06.
//

import SwiftUI

struct InfoPanelView: View {
  var scale: CGFloat
  var offset: CGSize
  
  @State private var isInfoPanelVisible: Bool = false
  
  var body: some View {
    HStack {
      // MARK: - Hot Spot
      Image(systemName: "circle.circle")
        .symbolRenderingMode(.hierarchical)
        .resizable()
        .frame(width: 30, height: 30)
      // 1초 이상 누르고 있어야 long press gesture event가 발생
        .onLongPressGesture(minimumDuration: 1) {
          withAnimation(.easeOut) {
            isInfoPanelVisible.toggle()
          }
        }
      
      Spacer()

      // MARK: - Info Panel
      HStack(spacing: 2) {
        Image(systemName: "arrow.up.left.and.arrow.down.right")
        Text("\(scale)")
        
        Spacer()
        
        Image(systemName: "arrow.left.and.right")
        Text("\(offset.width)")
        
        Spacer()
        
        Image(systemName: "arrow.up.and.down")
        Text("\(offset.height)")
        
        Spacer()
      }
      .font(.footnote)
      .padding(8)
      .background(.ultraThinMaterial)
      .cornerRadius(8)
      .frame(maxWidth: 420)
      .opacity(isInfoPanelVisible ? 1 : 0)
      
      Spacer()
    }
  }
}

struct InfoPanelView_Previews: PreviewProvider {
  static var previews: some View {
    InfoPanelView(scale: 1, offset: .zero)
      .preferredColorScheme(.dark)
      .previewLayout(.sizeThatFits)
      .padding()
  }
}
