//
//  CategoriesListView.swift
//  CocktailsBook
//
//  Created by Alexandr Golovach on 21.11.24.
//

import SwiftUI

struct CategoriesListView: View {
    
    @Environment(CategoriesState.self) private var categoriesState
    
    var body: some View {
        let _ = Self._printChanges()
        NavigationStack {
            List {
                ForEach(categoriesState.categories) { category in
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
                     try await categoriesState.fetchAllCategories()
                } catch {
                    print(error.localizedDescription)
                }
            }
        }
    }
}
