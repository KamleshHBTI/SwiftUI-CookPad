//
//  ContentView.swift
//  CookPad
//
//  Created by Kamalesh Kumar on 26/02/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(alignment: .center, spacing: 20) {

                // MARK: Header
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(alignment: .top, spacing: 0, content: {
                        ForEach(headerData) { header in
                            HeaderView(header: header)
                        }
                    })
                }
                Text("Avocados Dishes")
                    .fontWeight(.bold)
                    .modifier(TitleModifier())

                // MARK: Dishes
                DishesView()
                    .frame(maxWidth: 640)

                // MARK: Facts
                
                Text("Avocados Facts")
                    .fontWeight(.bold)
                    .modifier(TitleModifier())
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(alignment: .top) {
                        ForEach(factsData) { item in
                            FactsView(fact: item)
                        }
                    }
                }
                .padding(.leading, 20)
                .padding(.trailing, 20)

                //

                Text("Avocados Recipe")
                    .fontWeight(.bold)
                    .modifier(TitleModifier())
                ForEach(recipesData) { item in
                    RecipeCardView(recipe: item)
                }
                .padding(.leading, 20)
                .padding(.trailing, 20)

                // MARK: Footer
                VStack(alignment: .center, spacing: 20) {
                    Text("All About Avocados")
                        .fontWeight(.bold)
                        .modifier(TitleModifier())
                    Text("Everything ypu wanted to know about avocados but were too afraid to ask.")
                        .font(.system(.body, design: .serif))
                        .multilineTextAlignment(.center)
                        .foregroundStyle(Color.gray)
                        .frame(minHeight: 60)
                }
                .frame(maxWidth: 640)
                .padding()
                .padding(.bottom, 85)
            }//: Vstack
        }//: ScrollView
        .ignoresSafeArea(.all)
        .padding(0)
    }
}

struct TitleModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.system(.title, design: .serif))
            .foregroundStyle(Color("ColorGreenAdaptive"))
            .padding(8)
    }
}
#Preview {
    ContentView()
}
