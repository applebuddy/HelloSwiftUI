//
//  MapView.swift
//  Africa
//
//  Created by MinKyeongTae on 2022/11/19.
//

import SwiftUI
import MapKit

struct MapView: View {
  // MARK: - Properties
  
  @State private var region: MKCoordinateRegion = {
    var mapCoordinates = CLLocationCoordinate2D(latitude: 6.600286, longitude: 16.4377599)
    var mapZoomLevel = MKCoordinateSpan(latitudeDelta: 70.0, longitudeDelta: 70.0)
    // 위도, 경도, Zoom 레벨 수치 정의
    return MKCoordinateRegion(center: mapCoordinates, span: mapZoomLevel)
  }()
  
  let locations: [NationalParkLocation] = Bundle.main.decode("locations.json")
  
  // MARK: - Body

  var body: some View {
    // MARK: - No1 Basic Map
    // Map(coordinateRegion: $region)
    
    // MARK: - No2 Advanced Map
    Map(coordinateRegion: $region, annotationItems: locations, annotationContent: { item in
      // MARK: (A) Pin: Old Style (always static)
      // MapPin을 사용하면 지정한 각 위치에 Pin 표시를 할 수 있다.
      // * iOS14 ~ 16
      // MapPin(coordinate: item.location, tint: .accentColor)
      
      // MARK: (B) Marker: New Style (always static)
      // MapMarker(iOS14+)
      // MapMarker(coordinate: item.location, tint: .accentColor)
      
      // MARK: (C) Custom Basic Annotation (it could be interactive)
      // 각 위치마다 특정 라벨을 표시할 수도 있다.
      // MapAnnotation (iOS14+)
      MapAnnotation(coordinate: item.location) {
        Image("logo")
          .resizable()
          .scaledToFit()
          .frame(width: 32, height: 32, alignment: .center)
      } //: Annotation
    })
  }
}

struct MapView_Previews: PreviewProvider {
  static var previews: some View {
    MapView()
  }
}
