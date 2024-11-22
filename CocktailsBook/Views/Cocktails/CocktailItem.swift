//
//  CocktailItem.swift
//  CocktailsBook
//
//  Created by Alexandr Golovach on 21.11.24.
//

import SwiftUI

struct CocktailItem: View {
    
    var cocktail: Cocktail

    var body: some View {
        HStack {
            AsyncImage(url: URL(string: cocktail.thumb)) { phase in
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
                   .frame(width: 60, height: 60)
            Text(cocktail.name)
            Spacer()
        }
    }
}
