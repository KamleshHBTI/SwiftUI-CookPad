//
//  RecipeCookingView.swift
//  CookPad
//
//  Created by Kamalesh Kumar on 26/02/24.
//

import SwiftUI

struct RecipeCookingView: View {
    // MARK: - Properties
    var recipe: Recipe

    var body: some View {
        HStack(alignment: .center, spacing: 12) {

            HStack(alignment: .center, spacing: 2) {
                Image(systemName: "person.2")
                Text("Serves: \(recipe.serves)")
            }
            HStack(alignment: .center, spacing: 2) {
                Image(systemName: "clock")
                Text("Prep: \(recipe.preparation)")
            }
            HStack(alignment: .center, spacing: 2) {
                Image(systemName: "flame")
                Text("Cooking: \(recipe.cooking)")
            }
        }
    }
}

#Preview {
    RecipeCookingView(recipe: recipesData.first!)
}
