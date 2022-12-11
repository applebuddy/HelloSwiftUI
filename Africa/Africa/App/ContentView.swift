//
//  ContentView.swift
//  Africa
//
//  Created by MinKyeongTae on 2022/11/19.
//

import SwiftUI

struct ContentView: View {
	// MARK: - Properties
	
	let animals: [Animal] = Bundle.main.decode("animals.json")
	let haptics = UIImpactFeedbackGenerator(style: .medium)
	
	@State private var isGridViewActive: Bool = false
	@State private var gridLayout: [GridItem] = [GridItem(.flexible())]
	@State private var gridColumn: Int = 1
	@State private var toolbarIcon: String = "square.grid.2x2"
	// MARK: - Functions
	
	func gridSwitch() {
		gridLayout = Array(repeating: .init(.flexible()), count: gridLayout.count % 3 + 1)
		gridColumn = gridLayout.count
		print("Grid Number : \(gridColumn)")
		
		// Toolbar Image
		switch gridColumn {
		case 1:
			toolbarIcon = "square.grid.2x2"
		case 2:
			toolbarIcon = "square.grid.3x2"
		case 3:
			toolbarIcon = "rectangle.grid.1x2"
		default:
			toolbarIcon = "square.grid.2x2"
		}
	}
	
	// MARK: - Body

	var body: some View {
		NavigationView {
			Group {
				// MARK: - ListView
				if !isGridViewActive {
					List {
						CoverImageView()
							.frame(height: 300)
							.listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
						
						ForEach(animals) { animal in
							NavigationLink(destination: AnimalDetailView(animal: animal)) {
								AnimalListItemView(animal: animal)
							} //: Link
						} //: Loop
						CreditsView()
							.modifier(CenterModifier()) // how to use viewModifier
					} //: List
				} else {
					// MARK: - GridView
					ScrollView(.vertical, showsIndicators: false) {
						LazyVGrid(columns: gridLayout, alignment: .center, spacing: 10) {
							ForEach(animals) { animal in
								NavigationLink(destination: AnimalDetailView(animal: animal)) {
									// AnimalListItemView를 클릭하면, 클릭한 animal에 맞는 AnimalDetailView로 화면 전환
									AnimalGridItemView(animal: animal)
								} //: Link
							} //: Loop
						} //: Grid
						.padding(10)
						.animation(.easeIn)
					} //: Scroll
				} //: Condition
			} //: Group
			.navigationBarTitle("Africa", displayMode: .large)
			.toolbar {
				ToolbarItem(placement: .navigationBarTrailing) {
					HStack(spacing: 16) {
						// List
						Button {
							print("List view is activated")
							isGridViewActive = false
							haptics.impactOccurred()
						} label: {
							Image(systemName: "square.fill.text.grid.1x2")
								.font(.title2)
								.foregroundColor(isGridViewActive ? .primary : .accentColor)
						}
						
						// Grid
						Button {
							// 우상단 grid option button event
							print("Grid view is activated")
							isGridViewActive = true
							haptics.impactOccurred()
							gridSwitch()
						} label: {
							Image(systemName: toolbarIcon)
								.font(.title2)
								.foregroundColor(isGridViewActive ? .accentColor : .primary)
						}
					} //: HStack
				} //: Buttons
			} //: Toolbar
		} //: Navigation
	}
}

struct ContentView_Previews: PreviewProvider {
	static var previews: some View {
		ContentView()
	}
}
