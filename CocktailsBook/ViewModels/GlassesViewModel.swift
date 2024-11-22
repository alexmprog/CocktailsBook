//
//  GlassesViewModel.swift
//  CocktailsBook
//
//  Created by Alexandr Golovach on 22.11.24.
//

import Foundation
import SwiftUI

@MainActor
class GlassesViewModel: ObservableObject {
    
    @Published var glasses: [Glass] = []
    
    func fetchAllGlasses() async throws {
        self.glasses = try await NetworkService.shared.getAllGlasses()
    }
    
}
