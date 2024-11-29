//
//  GlassesListView.swift
//  CocktailsBook
//
//  Created by Alexandr Golovach on 21.11.24.
//

import SwiftUI

struct GlassesListView: View {
    
    @Environment(AppState.self) private var appState
    
    var body: some View {
        let _ = Self._printChanges()
        NavigationStack {
            List {
                ForEach(appState.glassesState.glasses) { glass in
                    NavigationLink {
                        CocktailsListView(cocktailsSource: CocktailsSource.glasses, sourceId: glass.id)
                    } label: {
                        TextItemView(name: glass.name)
                    }
                    .padding([.leading, .trailing], 15)
                }
                .listRowInsets(EdgeInsets())
            }
            .navigationTitle("glasses_title")
            .task {
                do {
                    try await appState.glassesState.fetchAllGlasses()
                } catch {
                    print(error.localizedDescription)
                }
            }
        }
    }
}
