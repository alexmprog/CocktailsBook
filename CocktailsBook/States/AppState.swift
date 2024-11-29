//
//  AppState.swift
//  CocktailsBook
//
//  Created by Alexandr Golovach on 29.11.24.
//

import Foundation
import SwiftUI

@Observable class AppState {
    
    private(set) var categoriesState: CategoriesState
    private(set) var ingredientsState: IngredientsState
    private(set) var glassesState: GlassesState
    private(set) var cocktailsState: CocktailsState
    
    init(){
        let networkService = NetworkService(baseUrl: "https://www.thecocktaildb.com/api/json/v1/1/")
        self.categoriesState = CategoriesState(networkService: networkService)
        self.ingredientsState = IngredientsState(networkService: networkService)
        self.glassesState = GlassesState(networkService: networkService)
        self.cocktailsState = CocktailsState(networkService: networkService)
    }
    
}
