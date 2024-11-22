//
//  CategoriesListView.swift
//  CocktailsBook
//
//  Created by Alexandr Golovach on 21.11.24.
//

import SwiftUI

struct CategoriesListView: View {
    
    @StateObject private var viewModel: CategoriesViewModel = CategoriesViewModel()
    
    var body: some View {
        let _ = Self._printChanges()
        NavigationStack {
            List {
                ForEach(viewModel.categories) { category in
                    NavigationLink {
                        CocktailsListView(cocktailsSource: CocktailsSource.categories, sourceId: category.id)
                    } label: {
                        CategoryItem(category: category)
                    }
                    .padding([.leading, .trailing], 15)
                }
                .listRowInsets(EdgeInsets())
            }
            .navigationTitle("Categories")
            .task {
                do {
                     try await viewModel.fetchAllCategories()
                } catch {
                    print(error.localizedDescription)
                }
            }
        } 
    }
}
