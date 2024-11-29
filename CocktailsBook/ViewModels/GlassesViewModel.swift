//
//  GlassesViewModel.swift
//  CocktailsBook
//
//  Created by Alexandr Golovach on 22.11.24.
//

import Foundation
import SwiftUI

@Observable class GlassesViewModel {
    
    private(set) var glasses: [Glass] = []
    
    func fetchAllGlasses() async throws {
        self.glasses = try await NetworkService.shared.getAllGlasses()
    }
    
}
