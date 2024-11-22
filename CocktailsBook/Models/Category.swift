//
//  Category.swift
//  CocktailsBook
//
//  Created by Alexandr Golovach on 21.11.24.
//

import Foundation

struct Category: Hashable, Codable, Identifiable {
    
    var name: String
    
    var id: String { name }
    
    enum CodingKeys: String, CodingKey {
        case name = "strCategory"
    }
}

struct CategoriesResponse: Codable {
    var categories: [Category]
    
    enum CodingKeys: String, CodingKey {
        case categories = "drinks"
    }
}
