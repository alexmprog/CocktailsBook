//
//  GlassesState.swift
//  CocktailsBook
//
//  Created by Alexandr Golovach on 29.11.24.
//

import Foundation
import SwiftUI

@Observable class GlassesState {
    
    private(set) var glasses: [Glass] = []
    
    func fetchAllGlasses() async throws {
        if(!self.glasses.isEmpty) {
            return
        }
        self.glasses = try await NetworkService.shared.getAllGlasses()
    }
    
}
