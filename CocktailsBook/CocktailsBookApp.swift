//
//  CocktailsBookApp.swift
//  CocktailsBook
//
//  Created by Alexandr Golovach on 21.11.24.
//

import SwiftUI

@main
struct CocktailsBookApp: App {
   
    @State private var appState: AppState = AppState()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(appState)
                .environment(appState.categoriesState)
                .environment(appState.ingredientsState)
                .environment(appState.glassesState)
                .environment(appState.cocktailsState)
        }
    }
}
