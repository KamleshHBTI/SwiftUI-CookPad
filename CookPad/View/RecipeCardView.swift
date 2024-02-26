//
//  RecipeCardView.swift
//  CookPad
//
//  Created by Kamalesh Kumar on 26/02/24.
//

import SwiftUI

struct RecipeCardView: View {
    // MARK: - Properties
    var recipe: Recipe
    var hapticImpact = UIImpactFeedbackGenerator()
    @State private var showModel: Bool = false

    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Image(recipe.image)
                .resizable()
                .scaledToFit()
                .overlay {
                    HStack {
                        Spacer()
                        VStack {
                            Image(systemName: "bookmark")
                                .font(Font.title.weight(.light))
                                .foregroundStyle(Color.white)
                                .imageScale(.small)
                                .shadow(color: Color("ColorblackTransparentLight"), radius: 2, x: 0, y: 0)
                                .padding(.trailing, 20)
                                .padding(.top, 22)
                            Spacer()
                        }
                    }
                }

            VStack(alignment: .leading, spacing: 12) {
                Text(recipe.title)
                    .font(.system(.title, design: .serif))
                    .fontWeight(.bold)
                    .foregroundStyle(Color("ColorGreenMedium"))
                    .lineLimit(1)

                Text(recipe.headline)
                    .font(.system(.body, design: .serif))
                    .foregroundStyle(Color.gray)
                    .italic()

                // Rates
                RecipeRatingView(recipe: recipe)

                // Cooking
                RecipeCookingView(recipe: recipe)
                .font(.footnote)
                .foregroundStyle(Color.gray)

            }// VStack
            .padding()
            .padding(.bottom, 12)

        }//: VStack
        .background(Color.white)
        .cornerRadius(12)
        .shadow(color: Color("ColorBlackTransparentLight"), radius: 8, x: 0, y: 0)
        .onTapGesture {
            self.hapticImpact.impactOccurred()
            self.showModel = true
        }
        .sheet(isPresented: $showModel, content: {
            RecipeDetailsView(recipe: recipe)
        })

    }
}

#Preview {
    RecipeCardView(recipe: recipesData.first!)
}
