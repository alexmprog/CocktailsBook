//
//  CategoryItem.swift
//  CocktailsBook
//
//  Created by Alexandr Golovach on 24.08.24.
//

import SwiftUI

struct CategoryItem: View {
    
    var category: Category

    var body: some View {
        VStack(alignment: .leading) {
            Text(category.name)
                .foregroundStyle(.primary)
        }
    }
}

//#Preview {
//    CategoryItem()
//}
