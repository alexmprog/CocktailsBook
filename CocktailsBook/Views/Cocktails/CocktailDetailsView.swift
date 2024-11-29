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
    
    @Environment(CocktailsState.self) private var cocktailsState

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
                Text(cocktailsState.cocktailDetails?.category ?? "" )
                    .padding(.all, 8)
                Text(cocktailsState.cocktailDetails?.glass ?? "" )
                    .padding(.all, 8)
                Text(cocktailsState.cocktailDetails?.description ?? "" )
                    .padding(.all, 8)
                }.frame(maxWidth: .infinity, alignment: .leading)
        }
        .task {
            do {
                try await cocktailsState.fetchCocktailDetails(cocktailId: cocktail.id)
            } catch {
                print(error.localizedDescription)
            }
        }
    }
}
