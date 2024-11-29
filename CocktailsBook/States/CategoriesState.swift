//
//  CategoriesState.swift
//  CocktailsBook
//
//  Created by Alexandr Golovach on 29.11.24.
//

import Foundation
import SwiftUI

@Observable class CategoriesState {
    
    private(set) var categories: [Category] = []
    
    func fetchAllCategories() async throws {
        if(!self.categories.isEmpty) {
            return
        }
        self.categories = try await NetworkService.shared.getAllCategories()
    }
    
}
