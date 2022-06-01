//
//  RecipeAPI.swift
//  WeCooked
//
//  Created by Imran razak on 14/05/2022.
//  Copyright © 2022 Imran Razak. All rights reserved.
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

        
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yyyy"

        do {
            let apiURL = URL(string: baseURL.replacingOccurrences(of: "MENU", with: selection.menu))!
            async let items = try await URLSession.shared.decode([Recipe].self, from: apiURL, dateDecodingStrategy: .formatted(formatter))
            recipes = try await items
            recipes = recipes.filter { $0.dateAdded <= Date.now }
        } catch {
            print(error)
        }
        
        
    }
    

    
    func sortByCreator() {
        recipes.sort { $0.creator < $1.creator }
    }

    func sortByDifficulty() {
        recipes.sort { $0.difficulty < $1.difficulty }
    }
    
    func sortByServing() {
        recipes.sort { $0.serves < $1.serves }
    }
}
