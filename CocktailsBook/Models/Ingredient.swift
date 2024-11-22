//
//  Ingredient.swift
//  CocktailsBook
//
//  Created by Alexandr Golovach on 21.11.24.
//

import Foundation

struct Ingredient: Hashable, Codable, Identifiable {
    var name: String
    
    var id: String { name }
    
    enum CodingKeys: String, CodingKey {
        case name = "strIngredient1"
    }
}

struct IngredientsResponse: Codable {
    var ingredients: [Ingredient]
    
    enum CodingKeys: String, CodingKey {
        case ingredients = "drinks"
    }
}
