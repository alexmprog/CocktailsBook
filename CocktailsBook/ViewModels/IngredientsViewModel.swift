//
//  IngredientsViewModel.swift
//  CocktailsBook
//
//  Created by Alexandr Golovach on 22.11.24.
//

import Foundation
import SwiftUI

@Observable class IngredientsViewModel {
    
    private(set) var ingredients: [Ingredient] = []
    
    func fetchAllIngredients() async throws {
        self.ingredients = try await NetworkService.shared.getAllIngredients()
    }

}
