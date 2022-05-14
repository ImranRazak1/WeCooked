//
//  BreakfastAPI.swift
//  WeCooked
//
//  Created by Imran razak on 29/04/2022.
//

import Foundation

@MainActor
class BreakfastAPI: ObservableObject {
    @Published var recipes: [Recipe] = []
    
    func fetchRecipes() async {
        
        guard let breakfastAPIURL = URL(string: URLData.breakfast.rawValue) else {
            fatalError("Missing URL") 
        }

          do {
              let (data, _) = try await URLSession.shared.data(from: breakfastAPIURL)
              let decoder = JSONDecoder()
              recipes = try decoder.decode([Recipe].self, from: data)
              //recipes = recipes.filter { $0.dateAdded <= Date.now }
              
          } catch {
              print("Error decoding: ", error)
          }
      }
    
}

