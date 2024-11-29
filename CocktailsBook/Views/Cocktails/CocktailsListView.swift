//
//  CocktailsListView.swift
//  CocktailsBook
//
//  Created by Alexandr Golovach on 21.11.24.
//

import SwiftUI


struct CocktailsListView: View {
    
    @StateObject private var viewModel: CocktailsViewModel = CocktailsViewModel()
    
    var cocktailsSource: CocktailsSource = CocktailsSource.categories
    var sourceId: String?
    
    var body: some View {
        let _ = Self._printChanges()
        List {
            ForEach(viewModel.cocktails) { cocktail in
                NavigationLink {
                    CocktailDetailsView(cocktail: cocktail)
                } label: {
                    CocktailItemView(cocktail: cocktail)
                }
                .padding([.leading, .trailing], 15)
            }
            .listRowInsets(EdgeInsets())
        }
        .navigationTitle("cocktails_title")
        .task {
            if sourceId != nil {
                do {
                    try await viewModel.fetchCocktailsBySource(source: cocktailsSource, sourceId: sourceId!)
                } catch {
                    print(error.localizedDescription)
                }
            }
        }
    }
}
