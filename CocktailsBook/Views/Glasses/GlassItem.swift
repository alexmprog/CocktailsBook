//
//  GlassItem.swift
//  CocktailsBook
//
//  Created by Alexandr Golovach on 21.11.24.
//

import SwiftUI

struct GlassItem: View {
    
    var glass: Glass

    var body: some View {
        VStack(alignment: .leading) {
            Text(glass.name)
                .foregroundStyle(.primary)
        }
    }
}

