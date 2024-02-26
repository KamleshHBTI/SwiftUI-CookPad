//
//  RecipeRatingView.swift
//  CookPad
//
//  Created by Kamalesh Kumar on 26/02/24.
//

import SwiftUI

struct RecipeRatingView: View {
    var recipe: Recipe
    var body: some View {
        HStack(alignment: .center, spacing: 5) {
            ForEach(1..<recipe.rating, id: \.self) { index in
                Image(systemName: "star.fill")
                    .font(.body)
                    .foregroundColor(.yellow)
            }
        }
    }
}

#Preview {
    RecipeRatingView(recipe: recipesData.first!)
}
