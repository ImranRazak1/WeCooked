//
//  BreakfastRecipes.swift
//  avocadotoast
//
//  Created by Imran razak on 14/03/2022.
//

import SwiftUI

struct BreakfastRecipes: Identifiable, Codable {
    let id: Int
    let name: String
    let creator: String
    let serves: Int
    let ingredients: [Ingredient]
    let methods: [Method]
    let imageURL: URL

    enum CodingKeys: String, CodingKey {
        case id, name, creator, serves, ingredients
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


@MainActor
class RecipeAPI: ObservableObject {
    @Published var veganRecipe: [VeganRecipes] = []

    func fetchRecipes() async {
        let apiURL = URL(string: "https://recipesstore.s3.eu-west-2.amazonaws.com/vegan.json")!

        do {
            let (data, _) = try await URLSession.shared.data(from: apiURL)
            let decoder = JSONDecoder()
            veganRecipe = try decoder.decode([VeganRecipes].self, from: data)
        } catch {
            print(error)
        }
    }
}
