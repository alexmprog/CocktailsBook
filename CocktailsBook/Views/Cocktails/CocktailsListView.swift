//
//  CocktailsListView.swift
//  CocktailsBook
//
//  Created by Alexandr Golovach on 21.11.24.
//

import SwiftUI


struct CocktailsListView: View {
    
    @Environment(AppState.self) private var appState
    
    @State private var cocktails: [Cocktail] = []
    
    var cocktailsSource: CocktailsSource = CocktailsSource.categories
    var sourceId: String?
    
    var body: some View {
        let _ = Self._printChanges()
        List {
            ForEach(cocktails) { cocktail in
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
                    self.cocktails = try await appState.cocktailsState.fetchCocktailsBySource(source: cocktailsSource, sourceId: sourceId!)
                } catch {
                    print(error.localizedDescription)
                }
            }
        }
    }
}
