import SwiftUI

struct RecipeListView: View {
    @StateObject private var viewModel = RecipeViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                Button("Refresh") {
                    Task {
                        await viewModel.fetchRecipes()
                    }
                }
                .buttonStyle(.bordered)
                .padding()
                Group {
                    if viewModel.isLoading {
                        VStack {
                            ProgressView("Loading recipes...")
                                .padding()
                        }
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                    } else if !viewModel.recipes.isEmpty {
                        List(viewModel.recipes) { recipe in
                            RecipeRowView(recipe: recipe)
                        }
                        .refreshable {
                            await viewModel.fetchRecipes()
                        }
                    } else {
                        VStack {
                            Text("No recipes available.")
                                .font(.title2)
                                .foregroundColor(.gray)
                            Button("Retry") {
                                Task {
                                    await viewModel.fetchRecipes()
                                }
                            }
                            .buttonStyle(.borderedProminent)
                        }
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                    }
                }
                .navigationTitle("Recipes")
                .onAppear {
                    Task {
                        await viewModel.fetchRecipes()
                    }
                }
            }
        }
    }
}
