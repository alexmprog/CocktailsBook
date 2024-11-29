//
//  IngredientsListView.swift
//  CocktailsBook
//
//  Created by Alexandr Golovach on 21.11.24.
//

import SwiftUI

struct IngredientsListView: View {
    
    @Environment(IngredientsState.self) private var ingredientsState
    
    var body: some View {
        let _ = Self._printChanges()
        NavigationStack {
            List {
                ForEach(ingredientsState.ingredients) { ingredient in
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
                     try await ingredientsState.fetchAllIngredients()
                } catch {
                    print(error.localizedDescription)
                }
            }
        }
    }
}
