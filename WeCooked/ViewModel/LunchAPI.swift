//
//  LunchAPI.swift
//  WeCooked
//
//  Created by Imran razak on 29/04/2022.
//  Copyright © 2022 Imran Razak. All rights reserved.
//

import Foundation

@MainActor
class LunchAPI: ObservableObject {
    @Published var recipes: [Recipe] = []
    
    func fetchRecipes() async {
        
        ///Fetches new recipes
        
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yyyy"
        
        do {
            let lunchAPIURL = URL(string: URLData.lunch.rawValue)!
            async let items = try await URLSession.shared.decode([Recipe].self, from: lunchAPIURL, dateDecodingStrategy: .formatted(formatter))
            recipes = try await items
            recipes = recipes.filter { $0.dateAdded <= Date.now }
            /// The data is then decoded and put into the recipes array for accibsle use across the app.
        } catch {
            print("Error decoding: ", error)
        }
    }
    
    
}
