//
//  CocktailsState.swift
//  CocktailsBook
//
//  Created by Alexandr Golovach on 29.11.24.
//

import Foundation
import SwiftUI

@Observable class CocktailsState {
    
    private(set) var cocktails: [Cocktail] = []
    private(set) var cocktailDetails: CocktailDetails? = nil
    
    func fetchCocktailsBySource(source: CocktailsSource, sourceId: String) async throws {
        self.cocktails = []
        let service = NetworkService.shared
        self.cocktails = switch(source){
            case .categories:
                try await service.getCocktailsByCategory(categoryId: sourceId)
            case .ingredients:
                try await service.getCocktailsByIngredient(ingredientId: sourceId)
            case .glasses:
                try await service.getCocktailsByGlass(glassId: sourceId)
        }
    }
    
    func fetchCocktailDetails(cocktailId: String) async throws {
        self.cocktailDetails = nil
        self.cocktailDetails = try await NetworkService.shared.getCocktailDetails(coctailId: cocktailId)
    }
}
