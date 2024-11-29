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
    
    private let networkService: NetworkService
    
    init(networkService: NetworkService){
        self.networkService = networkService
    }
    
    func fetchAllGlasses() async throws {
        if(!self.glasses.isEmpty) {
            return
        }
        self.glasses = try await networkService.getAllGlasses()
    }
    
}
