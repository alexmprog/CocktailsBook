//
//  CategoriesListView.swift
//  CocktailsBook
//
//  Created by Alexandr Golovach on 21.11.24.
//

import SwiftUI

struct CategoriesListView: View {
    
    @Environment(AppState.self) private var appState
    
    var body: some View {
        let _ = Self._printChanges()
        NavigationStack {
            List {
                ForEach(appState.categoriesState.categories) { category in
                    NavigationLink {
                        CocktailsListView(cocktailsSource: CocktailsSource.categories, sourceId: category.id)
                    } label: {
                        TextItemView(name: category.name)
                    }
                    .padding([.leading, .trailing], 15)
                }
                .listRowInsets(EdgeInsets())
            }
            .navigationTitle("categories_title")
            .task {
                do {
                    try await appState.categoriesState.fetchAllCategories()
                } catch {
                    print(error.localizedDescription)
                }
            }
        }
    }
}
