//
//  SettingsView.swift
//  Fruits
//
//  Created by MinKyeongTae on 2022/11/16.
//

import SwiftUI

struct SettingsView: View {
  // MARK: - Properties
  
  @Environment(\.presentationMode) var presentationMode
  @AppStorage("isOnboarding") var isOnboarding = false
  
  // MARK: - Body

  var body: some View {
    NavigationView {
      ScrollView(.vertical, showsIndicators: false) {
        VStack(spacing: 20) {
          // MARK: - Section 1
          
          GroupBox(
            label:
              SettingsLabelView(labelText: "Fruits", labelImage: "info.circle")
          ) {
            Divider().padding(.vertical, 4)
            HStack(alignment: .center, spacing: 10) {
              Image("logo")
                .resizable()
                .scaledToFit()
                .frame(width: 80, height: 80)
                .cornerRadius(9)
              Text("Most fruits are naturally low in fat, sodium, and calories. None have cholesterol. Fruits are sources of many essential nutrients, including potassium, dietary fiber, vitamins, and much more.")
                .font(.footnote)
            }
          }
          
          // MARK: - Section 2
          
          GroupBox(
            label: SettingsLabelView(labelText: "Customization", labelImage: "painbrush")
          ) {
            Divider().padding(.vertical,  4)
            Text("If you wish, you can restart the application by  toggle the  switch ini this box. That way it  starts the onboarding process and you will see the welcome screen again.")
              .padding(.vertical, 8)
              .frame(minHeight: 60)
              .layoutPriority(1) // layoutPriority로 우선순위를 설정하면 컨텐츠에 대한 truncation 발생 View를 지정할 수 있다.
              .multilineTextAlignment(.leading)
            
            Toggle(isOn: $isOnboarding) {
              if isOnboarding {
                Text("Restarted".uppercased())
                  .fontWeight(.bold)
                  .foregroundColor(.green)
              } else {
                Text("Restart".uppercased())
                  .fontWeight(.bold)
                  .foregroundColor(.secondary)
              }
            }
            .padding()
            .background(
              Color(UIColor.tertiarySystemBackground)
                .clipShape(RoundedRectangle(cornerRadius: 8, style: .continuous))
            )
          }
          
          // MARK: - Section 3
          
          GroupBox(
            label: SettingsLabelView(labelText: "Application", labelImage: "apps.iphone")
          ) {
            SettingsRowView(name: "Developer", content: "John / Jane")
            SettingsRowView(name: "Designer", content: "Robert Petras")
            SettingsRowView(name: "Compatibility", content: "iOS 14")
            SettingsRowView(name: "Website", linkLabel: "SwiftUI Masterclass", linkDestination: "swiftuimasterclass.com")
            SettingsRowView(name: "Twitter", linkLabel: "@RobertPetras", linkDestination: "twitter.com/robertpetras")
            SettingsRowView(name: "SwiftUI", content: "2.0")
            SettingsRowView(name: "Version", content: "1.1.0")
          }
        } //: VStack
        .navigationBarTitle(Text("Settings"), displayMode: .large)
        .navigationBarItems(trailing: Button {
          presentationMode.wrappedValue.dismiss()
        } label: {
          Image(systemName: "xmark")
        })
        .padding()
      } //: Scroll
    } //: Navigation
  }
}

struct SettingsView_Previews: PreviewProvider {
  static var previews: some View {
    SettingsView()
      .preferredColorScheme(.dark)
  }
}
