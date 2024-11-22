//
//  Cocktail.swift
//  CocktailsBook
//
//  Created by Alexandr Golovach on 21.11.24.
//

import Foundation

struct Cocktail: Hashable, Codable, Identifiable {
    
    var id: String
    var name: String
    var thumb: String
    
    enum CodingKeys: String, CodingKey {
        case id = "idDrink"
        case name = "strDrink"
        case thumb = "strDrinkThumb"
    }
}

struct CocktailsResponse: Codable {
    var cocktails: [Cocktail]
    
    enum CodingKeys: String, CodingKey {
        case cocktails = "drinks"
    }
}

struct CocktailDetails: Hashable, Codable, Identifiable {
    
    var id: String
    var category: String
    var glass: String
    var description: String
    
    enum CodingKeys: String, CodingKey {
        case id = "idDrink"
        case category = "strCategory"
        case glass = "strGlass"
        case description = "strInstructions"
    }
}

struct CocktailDetailsResponse: Codable {
    var details: [CocktailDetails]
    
    enum CodingKeys: String, CodingKey {
        case details = "drinks"
    }
}

enum CocktailsSource {
    case categories
    case ingredients
    case glasses
}
