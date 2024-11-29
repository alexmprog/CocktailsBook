//
//  CocktailsState.swift
//  CocktailsBook
//
//  Created by Alexandr Golovach on 29.11.24.
//

import Foundation
import SwiftUI

class CocktailsState {
    
    private let networkService: NetworkService
    
    init(networkService: NetworkService){
        self.networkService = networkService
    }
    
    func fetchCocktailsBySource(source: CocktailsSource, sourceId: String) async throws -> [Cocktail] {
        return switch(source){
            case .categories:
                try await networkService.getCocktailsByCategory(categoryId: sourceId)
            case .ingredients:
                try await networkService.getCocktailsByIngredient(ingredientId: sourceId)
            case .glasses:
                try await networkService.getCocktailsByGlass(glassId: sourceId)
        }
    }
    
    func fetchCocktailDetails(cocktailId: String) async throws -> CocktailDetails {
        return try await networkService.getCocktailDetails(coctailId: cocktailId)
    }
}
