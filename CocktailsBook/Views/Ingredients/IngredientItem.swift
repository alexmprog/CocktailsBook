//
//  IngredientItem.swift
//  CocktailsBook
//
//  Created by Alexandr Golovach on 21.11.24.
//

import SwiftUI

struct IngredientItem: View {
    
    var ingredient: Ingredient

    var body: some View {
        VStack(alignment: .leading) {
            Text(ingredient.name)
                .foregroundStyle(.primary)
        }
    }
}

//#Preview {
//    IngredientItem()
//}
