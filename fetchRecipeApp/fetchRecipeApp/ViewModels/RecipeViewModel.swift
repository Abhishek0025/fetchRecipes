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
                    recipes = try await RecipeService.shared.fetchRecipes()
                } catch {
                    errorMessage = "Failed to load recipes"
                    recipes = []
                }

                isLoading = false
            }
        }
