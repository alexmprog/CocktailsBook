//
//  ContentView.swift
//  CocktailsBook
//
//  Created by Alexandr Golovach on 21.11.24.
//

import SwiftUI

struct ContentView: View {
    
    @State private var selection: Tab = .categories

    enum Tab {
        case categories
        case ingredients
        case glasses
    }

    var body: some View {
        TabView(selection: $selection) {
            
            CategoriesListView()
                .tabItem {
                    Label("categories_title", systemImage: "list.bullet")
                }
                .tag(Tab.categories)
            
            IngredientsListView()
                .tabItem {
                    Label("ingredients_title", systemImage: "list.bullet")
                }
                .tag(Tab.ingredients)
            
            GlassesListView()
                .tabItem {
                    Label("glasses_title", systemImage: "list.bullet")
                }
                .tag(Tab.glasses)
        }
    }
}

#Preview {
     let appState = AppState()
     return ContentView()
        .environment(appState)
}
