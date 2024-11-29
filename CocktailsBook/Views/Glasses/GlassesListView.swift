//
//  GlassesListView.swift
//  CocktailsBook
//
//  Created by Alexandr Golovach on 21.11.24.
//

import SwiftUI

struct GlassesListView: View {
        
    @StateObject private var viewModel: GlassesViewModel = GlassesViewModel()
    
    var body: some View {
        let _ = Self._printChanges()
        NavigationStack {
            List {
                ForEach(viewModel.glasses) { glass in
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
                     try await viewModel.fetchAllGlasses()
                } catch {
                    print(error.localizedDescription)
                }
            }
        }
    }
}
