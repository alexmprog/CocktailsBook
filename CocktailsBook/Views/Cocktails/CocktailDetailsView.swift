//
//  CocktailDetailsView.swift
//  CocktailsBook
//
//  Created by Alexandr Golovach on 21.11.24.
//

import Foundation
import SwiftUI

struct CocktailDetailsView: View {
    
    let cocktail: Cocktail
    
    @Environment(AppState.self) private var appState
    
    @State private var cocktailDetails: CocktailDetails? = nil

    var body: some View {
        let _ = Self._printChanges()
        ScrollView {
            VStack (alignment: .leading) {
                AsyncImage(url: URL(string: cocktail.thumb),
                           transaction: Transaction(animation: .smooth)) { phase in
                        switch phase {
                           case .failure:
                               Image(systemName: "photo")
                                   .font(.largeTitle)
                           case .success(let image):
                               image.resizable()
                           default:
                               ProgressView()
                           }
                }
                .scaledToFit()
                Text(cocktail.name)
                    .padding(.all, 8)
                Text(cocktailDetails?.category ?? "" )
                    .padding(.all, 8)
                Text(cocktailDetails?.glass ?? "" )
                    .padding(.all, 8)
                Text(cocktailDetails?.description ?? "" )
                    .padding(.all, 8)
                }.frame(maxWidth: .infinity, alignment: .leading)
        }
        .task {
            do {
                self.cocktailDetails = try await appState.cocktailsState.fetchCocktailDetails(cocktailId: cocktail.id)
            } catch {
                print(error.localizedDescription)
            }
        }
    }
}
