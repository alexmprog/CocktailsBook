//
//  CocktailsViewModel.swift
//  CocktailsBook
//
//  Created by Alexandr Golovach on 22.11.24.
//

import Foundation
import SwiftUI

@MainActor
class CocktailsViewModel: ObservableObject {
    
    @Published var cocktails: [Cocktail] = []
    
    func fetchCocktailsBySource(source: CocktailsSource, sourceId: String) async throws {
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
}
