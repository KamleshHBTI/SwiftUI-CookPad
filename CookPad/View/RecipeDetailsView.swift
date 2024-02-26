//
//  RecipeDetailsView.swift
//  CookPad
//
//  Created by Kamalesh Kumar on 26/02/24.
//

import SwiftUI

struct RecipeDetailsView: View {
    // MARK: - Properties
    var recipe: Recipe
    @State private var pulsate: Bool = false
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(alignment: .center, spacing: 0) {
                Image(recipe.image)
                    .resizable()
                    .scaledToFit()

                Group {
                    // Title
                    Text(recipe.title)
                        .font(.system(.largeTitle, design: .serif))
                        .fontWeight(.bold)
                        .multilineTextAlignment(.center)
                        .foregroundStyle(Color("ColorGreenAdaptive"))
                        .padding(.top, 10)

                    // Rating
                    RecipeRatingView(recipe: recipe)

                    // Cooking
                    RecipeCookingView(recipe: recipe)

                    // Ingredients
                    Text("Ingredients")
                        .fontWeight(.bold)
                        .modifier(TitleModifier())

                    VStack(alignment: .leading, spacing: 5) {
                        ForEach(recipe.ingredients, id: \.self) { item in
                            Text(item)
                                .font(.footnote)
                                .multilineTextAlignment(.leading)
                        }
                    }

                    // Instructions
                    Text("Instructions")
                        .fontWeight(.bold)
                        .modifier(TitleModifier())

                    ForEach(recipe.instructions, id: \.self) { item in
                        VStack {

                            Image(systemName: "chevron.down.circle")
                                .resizable()
                                .frame(width: 42, height: 42, alignment: .center)
                                .imageScale(.large)
                                .font(Font.title.weight(.ultraLight))
                                .foregroundStyle(Color("ColorGreenAdaptive"))
                            Text(item)
                                .lineLimit(nil)
                                .multilineTextAlignment(.center)
                                .font(.system(.body, design: .serif))
                                .frame(minHeight: 100)
                        }

                    }
                }// Group
                .padding(.vertical, 12)
                .padding(.horizontal, 24)
            }// VSTack
        }// ScrollView
        .ignoresSafeArea()
        .overlay {
            HStack {
                Spacer()
                VStack {
                    Button(action: {
                      // ACTION
                        self.presentationMode.wrappedValue.dismiss()
                    }, label: {
                      Image(systemName: "chevron.down.circle.fill")
                        .font(.title)
                        .foregroundColor(Color.white)
                        .shadow(radius: 4)
                        .opacity(self.pulsate ? 1 : 0.6)
                        .scaleEffect(self.pulsate ? 1.2 : 0.8, anchor: .center)
                        .animation(Animation.easeInOut(duration: 1.5).repeatForever(autoreverses: true), value: pulsate)
                    })
                      .padding(.trailing, 20)
                      .padding(.top, 24)
                    Spacer()
                  }
            }
            .onAppear() {
                self.pulsate.toggle()
            }
        }
    }
}

#Preview {
    RecipeDetailsView(recipe: recipesData.first!)
}
