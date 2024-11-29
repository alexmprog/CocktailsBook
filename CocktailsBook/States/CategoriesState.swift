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
    
    private let networkService: NetworkService
    
    init(networkService: NetworkService){
        self.networkService = networkService
    }
    
    func fetchAllCategories() async throws {
        if(!self.categories.isEmpty) {
            return
        }
        self.categories = try await networkService.getAllCategories()
    }
    
}
