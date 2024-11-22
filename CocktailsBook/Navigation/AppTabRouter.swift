//
//  AppTabRouter.swift
//  CocktailsBook
//
//  Created by Alexandr Golovach on 22.11.24.
//

import Foundation

enum CategoriesRoute: Hashable {
    case home
    case cocktails(CocktailsSource, String)
    case detail(Cocktail)
}

enum IngredientsRoute: Hashable {
    case home
    case cocktails(CocktailsSource, String)
    case detail(Cocktail)
}

enum GlassesRoute: Hashable {
    case home
    case cocktails(CocktailsSource, String)
    case detail(Cocktail)
}

@Observable
class AppTabRouter {
    var categoriesRoutes: [CategoriesRoute] = []
    var ingredientsRoutes: [IngredientsRoute] = []
    var glassesRoute: [GlassesRoute] = []
}
