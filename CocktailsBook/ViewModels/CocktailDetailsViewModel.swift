//
//  CocktailDetailsViewModel.swift
//  CocktailsBook
//
//  Created by Alexandr Golovach on 22.11.24.
//

import Foundation
import SwiftUI

@MainActor
class CocktailDetailsViewModel: ObservableObject {
    
    @Published var cocktailDetails: CocktailDetails? = nil
    
    func fetchCocktailDetails(cocktailId: String) async throws {
        self.cocktailDetails = try await NetworkService.shared.getCocktailDetails(coctailId: cocktailId)
    }
}
