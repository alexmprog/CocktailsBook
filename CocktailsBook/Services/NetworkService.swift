//
//  NetworkService.swift
//  CocktailsBook
//
//  Created by Alexandr Golovach on 21.11.24.
//

import Foundation

class NetworkService {
    
    private let baseURL: URL
        
    init(baseUrl:String) {
        self.baseURL = URL(string: baseUrl)!
    }
    
    func getAllCategories() async throws -> [Category] {
        
        guard let url = URL(string: "list.php?c=list", relativeTo: baseURL) else {
            throw NetworkServiceError.badURL
        }
        
        let (data, _) = try await URLSession.shared.data(from: url)
        return try JSONDecoder().decode(CategoriesResponse.self, from: data).categories
    }
    
    func getAllIngredients() async throws -> [Ingredient] {
        
        guard let url = URL(string: "list.php?i=list", relativeTo: baseURL) else {
            throw NetworkServiceError.badURL
        }
        
        let (data, _) = try await URLSession.shared.data(from: url)
        return try JSONDecoder().decode(IngredientsResponse.self, from: data).ingredients
    }
    
    func getAllGlasses() async throws -> [Glass] {
        
        guard let url = URL(string: "list.php?g=list", relativeTo: baseURL) else {
            throw NetworkServiceError.badURL
        }
        
        let (data, _) = try await URLSession.shared.data(from: url)
        return try JSONDecoder().decode(GlassesResponse.self, from: data).glasses
    }
    
    func getCocktailsByCategory(categoryId: String) async throws -> [Cocktail] {
        
        guard let url = URL(string: "filter.php?c=" + categoryId, relativeTo: baseURL) else {
            throw NetworkServiceError.badURL
        }
        
        let (data, _) = try await URLSession.shared.data(from: url)
        return try JSONDecoder().decode(CocktailsResponse.self, from: data).cocktails
    }
    
    func getCocktailsByIngredient(ingredientId: String) async throws -> [Cocktail] {
        
        guard let url = URL(string: "filter.php?i=" + ingredientId, relativeTo: baseURL) else {
            throw NetworkServiceError.badURL
        }
        
        let (data, _) = try await URLSession.shared.data(from: url)
        return try JSONDecoder().decode(CocktailsResponse.self, from: data).cocktails
    }
    
    func getCocktailsByGlass(glassId: String) async throws -> [Cocktail] {
        
        guard let url = URL(string: "filter.php?g=" + glassId, relativeTo: baseURL) else {
            throw NetworkServiceError.badURL
        }
        
        let (data, _) = try await URLSession.shared.data(from: url)
        return try JSONDecoder().decode(CocktailsResponse.self, from: data).cocktails
    }
    
    func getCocktailDetails(coctailId: String) async throws -> CocktailDetails {
        
        guard let url = URL(string: "lookup.php?i=" + coctailId, relativeTo: baseURL) else {
            throw NetworkServiceError.badURL
        }
        
        let (data, _) = try await URLSession.shared.data(from: url)
        return try JSONDecoder().decode(CocktailDetailsResponse.self, from: data).details.first!
    }
    
}

enum NetworkServiceError: Error {
    case unexpected
    case badURL
    case apiError(statusCode: Int)
}
