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
	
	// MARK: - Body

	var body: some View {
		NavigationView {
			List {
				CoverImageView()
					.frame(height: 300)
					.listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
				
				ForEach(animals) { animal in
					AnimalListItemView(animal: animal)
				}
			} //: List
			.navigationBarTitle("Africa", displayMode: .large)
		} //: Navigation
	}
}

struct ContentView_Previews: PreviewProvider {
	static var previews: some View {
		ContentView()
	}
}
