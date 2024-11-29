//
//  IngredientsListView.swift
//  CocktailsBook
//
//  Created by Alexandr Golovach on 21.11.24.
//

import SwiftUI

struct IngredientsListView: View {
    
    @StateObject private var viewModel: IngredientsViewModel = IngredientsViewModel()
    
    var body: some View {
        let _ = Self._printChanges()
        NavigationStack {
            List {
                ForEach(viewModel.ingredients) { ingredient in
                    NavigationLink {
                        CocktailsListView(cocktailsSource: CocktailsSource.ingredients, sourceId: ingredient.id)
                    } label: {
                        TextItemView(name: ingredient.name)
                    }
                    .padding([.leading, .trailing], 15)
                }
                .listRowInsets(EdgeInsets())
            }
            .navigationTitle("ingredients_title")
            .task {
                do {
                     try await viewModel.fetchAllIngredients()
                } catch {
                    print(error.localizedDescription)
                }
            }
        }
    }
}
