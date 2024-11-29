//
//  CategoriesViewModel.swift
//  CocktailsBook
//
//  Created by Alexandr Golovach on 22.11.24.
//

import Foundation
import SwiftUI

@Observable class CategoriesViewModel {
    
    private(set) var categories: [Category] = []
    
    func fetchAllCategories() async throws {
        self.categories = try await NetworkService.shared.getAllCategories()
    }
    
}
