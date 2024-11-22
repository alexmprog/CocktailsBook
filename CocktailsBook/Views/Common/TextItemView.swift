//
//  TextItemView.swift
//  CocktailsBook
//
//  Created by Alexandr Golovach on 22.11.24.
//

import SwiftUI

struct TextItemView: View {
    
    var name: String

    var body: some View {
        VStack(alignment: .leading) {
            Text(name)
                .foregroundStyle(.primary)
        }
    }
}

#Preview {
    TextItemView(name: "Vodka")
}
