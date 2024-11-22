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
                    Label("Categories", systemImage: "list.bullet")
                }
                .tag(Tab.categories)

            IngredientsListView()
                .tabItem {
                    Label("Ingredients", systemImage: "list.bullet")
                }
                .tag(Tab.ingredients)
            
            GlassesListView()
                .tabItem {
                    Label("Glasses", systemImage: "list.bullet")
                }
                .tag(Tab.glasses)
        }
    }
}

#Preview {
    ContentView()
}

