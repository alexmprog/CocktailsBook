//
//  Glass.swift
//  CocktailsBook
//
//  Created by Alexandr Golovach on 21.11.24.
//

import Foundation

struct Glass: Hashable, Codable, Identifiable {
    
    var name: String
    
    var id: String { name }
    
    enum CodingKeys: String, CodingKey {
        case name = "strGlass"
    }
}

struct GlassesResponse: Codable {
    var glasses: [Glass]
    
    enum CodingKeys: String, CodingKey {
        case glasses = "drinks"
    }
}
