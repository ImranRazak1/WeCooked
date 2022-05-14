//
//  RecipeAPI.swift
//  WeCooked
//
//  Created by Imran razak on 14/05/2022.
//

import Foundation



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
