//
//  RecipeService.swift
//  fetchRecipeApp
//
//  Created by Abhishek A on 3/12/25.
//

import Foundation
struct RecipeService {
    static let shared = RecipeService()
    
    func fetchRecipes() async throws -> [Recipe] {
        let url = URL(string: "https://d3jbb8n5wk0qxi.cloudfront.net/recipes.json")!
        let (data, _) = try await URLSession.shared.data(from: url)
        let decodedData = try JSONDecoder().decode([String: [Recipe]].self, from: data)
        return decodedData["recipes"] ?? []
    }
}
