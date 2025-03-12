import Foundation

@MainActor
class RecipeViewModel: ObservableObject {
    @Published var recipes: [Recipe] = []
    @Published var isLoading = false
    @Published var errorMessage: String?
    
    private let url = URL(string: "https://d3jbb8n5wk0qxi.cloudfront.net/recipes.json")!
    
    func fetchRecipes() async {
        isLoading = true
        errorMessage = nil
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let decodedData = try JSONDecoder().decode([String: [Recipe]].self, from: data)
            
            if let fetchedRecipes = decodedData["recipes"] {
                recipes = fetchedRecipes
            } else {
                throw URLError(.badServerResponse)
            }
        } catch {
            errorMessage = "Invalid data received. Please try again."
            recipes = [] // Ensure list is cleared if data is bad
        }
        
        isLoading = false
    }
}
