//
//  AppTabNavigationStack.swift
//  CocktailsBook
//
//  Created by Alexandr Golovach on 22.11.24.
//

import Foundation
import SwiftUI

struct CategoriesNavigationStack: View {
    
    @Environment(AppTabRouter.self) private var router
    
    var body: some View {
        
        @Bindable var router = router
        
        NavigationStack(path: $router.categoriesRoutes) {
            navigationDestination(for: CategoriesRoute.self) { route in
                switch route {
                    case .home:
                        CategoriesListView()
                    case .cocktails(let cocktailSource, let sourceId):
                        CocktailsListView(cocktailsSource: cocktailSource, sourceId: sourceId)
                    case .detail(let cocktail):
                        CocktailDetailsView(cocktail: cocktail)
                }
            }
        }
    }
}

//struct IngredientsNavigationStack: View {
//    
//    @Environment(AppTabRouter.self) private var router
//    
//    var body: some View {
//        
//        @Bindable var router = router
//        
//        NavigationStack(path: $router.ingredients) {
//            navigationDestination(for: CategoriesRoute.self) { route in
//                switch route {
//                    case .home:
//                        CategoriesListView()
//                    case .cocktails(let cocktailSource, sourceId):
//                        CocktailsListView(cocktailsSource: cocktailSource, sourceId: sourceId)
//                    case .detail(let cocktail):
//                        CocktailDetailsView(cocktail: cocktail)
//                }
//            }
//        }
//    }
//}
