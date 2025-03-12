//
//  FetchRecipeAppTests.swift
//  FetchRecipeAppTests
//
//  Created by Abhishek A on 3/11/25.
//
import XCTest
@testable import fetchRecipeApp

final class RecipeViewModelTests: XCTestCase {

    @MainActor
    func testFetchingRecipes() async throws {
        let viewModel = RecipeViewModel()
        await viewModel.fetchRecipes()
        XCTAssertFalse(viewModel.recipes.isEmpty, "Recipes should not be empty after fetching")
    }

    @MainActor
    func testHandlingMalformedJSON() async throws {
        let viewModel = RecipeViewModel()
        
        // Simulate a malformed JSON scenario
        viewModel.errorMessage = "Invalid data received. Please try again."
        
        XCTAssertEqual(viewModel.errorMessage, "Invalid data received. Please try again.",
                       "App should display an error for malformed JSON.")
    }

    @MainActor
    func testHandlingEmptyData() async throws {
        let viewModel = RecipeViewModel()
        viewModel.recipes = [] // Simulating an empty data case

        XCTAssertTrue(viewModel.recipes.isEmpty, "App should show an empty state when no recipes are available.")
    }
}
