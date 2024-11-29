//
//  IngredientsState.swift
//  CocktailsBook
//
//  Created by Alexandr Golovach on 29.11.24.
//

import Foundation
import SwiftUI

@Observable class IngredientsState {
    
    private(set) var ingredients: [Ingredient] = []
    
    func fetchAllIngredients() async throws {
        if(!self.ingredients.isEmpty) {
            return
        }
        self.ingredients = try await NetworkService.shared.getAllIngredients()
    }

}
