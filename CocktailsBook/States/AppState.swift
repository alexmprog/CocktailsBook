//
//  AppState.swift
//  CocktailsBook
//
//  Created by Alexandr Golovach on 29.11.24.
//

import Foundation
import SwiftUI

@Observable class AppState {
    
    private(set) var categoriesState: CategoriesState = CategoriesState()
    private(set) var ingredientsState: IngredientsState = IngredientsState()
    private(set) var glassesState: GlassesState = GlassesState()
    private(set) var cocktailsState: CocktailsState = CocktailsState()
    
}
