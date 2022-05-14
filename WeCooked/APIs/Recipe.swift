//
//  Recipe.swift
//  avocadotoast
//
//  Created by Imran razak on 17/03/2022.
//

import SwiftUI
import Foundation
struct Recipe: Identifiable, Codable {
    let id: Int
    let name: String
    let creator: String
    let serves: Int
    let ingredients: [Ingredient]
    let methods: [Method]
    let imageURL: URL
    //let dateAdded: String
    //let difficulty: String

    //Add new attributes to the CodingKeys
    enum CodingKeys: String, CodingKey {
        case id, name, creator, serves, ingredients//, dateAdded, difficulty
        case methods = "method"
        case imageURL = "imageurl"
    }
}

struct Ingredient: Codable {
    let name: String
    let quantity: Double
    let measurement: String
    
}

struct Method: Codable {
    let step: Int
    let text: String
}

enum RecipeSelection: String, CaseIterable, Identifiable {
    case vegan
    case breakfast
    case lunch
    case dinner

    var id: String { self.rawValue }
    var name: String { self.rawValue.capitalized }

    var menu: String {
        switch self {
        case .vegan: return "Vegan"
        case .breakfast: return "Breakfast"
        case .lunch: return "Lunch"
        case .dinner: return "Dinner"
        }
    }
}





//All Recipes via Selection from RecipeContentView
@MainActor
class RecipeAPI: ObservableObject {
    @Published var recipes: [Recipe] = []

    //we'll use this URL as a basis for all of the different URLs
    let baseURL = "https://recipesstore.s3.eu-west-2.amazonaws.com/MENU.json"
    
    func fetchRecipes(for selection: RecipeSelection) async {

        //create the API URL by substituting the selected menu
        //into the baseURL
        guard let apiURL = URL(string: baseURL.replacingOccurrences(of: "MENU", with: selection.menu)) else {
            print("Invalid URL")
            return
        }

        do {
            let (data, _) = try await URLSession.shared.data(from: apiURL)
            let decoder = JSONDecoder()
            recipes = try decoder.decode([Recipe].self, from: data)
            
        } catch {
            print(error)
        }
    }
}



