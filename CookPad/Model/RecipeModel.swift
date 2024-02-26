//
//  RecipeModel.swift
//  CookPad
//
//  Created by Kamalesh Kumar on 26/02/24.
//

import Foundation
struct Recipe: Identifiable {
    var id = UUID()
    var title: String
    var headline: String
    var image: String
    var rating: Int
    var serves: Int
    var preparation: Int
    var cooking: Int
    var instructions: [String]
    var ingredients: [String]
}
