//
//  InsetMapView.swift
//  Africa
//
//  Created by MinKyeongTae on 2022/11/20.
//

import SwiftUI
import MapKit

struct InsetMapView: View {
  // MARK: - Properties
  
  @State private var region = MKCoordinateRegion(
    // Map's Coordinator Index
    center: CLLocationCoordinate2D(
      latitude: 6.600286, longitude: 16.4377599
    ),
    // Map's Zoom Level
    span: MKCoordinateSpan(
      latitudeDelta: 60.0, longitudeDelta: 60.0
    )
  )
  
  // MARK: - Body

  var body: some View {
    // Map 으로 쉽게 MapView 지도를 보여줄 수 있다.
    // Map(mapRect: .constant(.world))
    Map(coordinateRegion: $region)
      .overlay(
        NavigationLink(destination: MapView()) {
          HStack {
            Image(systemName: "mappin.circle")
              .foregroundColor(.white)
              .imageScale(.large)
            
            Text("Locations")
              .foregroundColor(.accentColor)
              .fontWeight(.bold)
          } //: HStack
          .padding(.vertical, 10)
          .padding(.horizontal, 14)
          .background(
            Color.black
              .opacity(0.4)
              .cornerRadius(8)
          )
        } //: Navigation
          .padding(12)
        // set overlay view's layout position from superView relatively
        ,alignment: .topTrailing
      )
      .frame(height: 256)
      .cornerRadius(12)
  }
}

struct InsetMapView_Previews: PreviewProvider {
  static var previews: some View {
    InsetMapView()
      .previewLayout(.sizeThatFits)
      .padding()
  }
}
