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
        guard let breakfastAPIURL = URL(string: "https://recipesstore.s3.eu-west-2.amazonaws.com/Breakfast.json") else {
            
            print("Invalid URL")
            return
            
        }

          do {
              let (data, _) = try await URLSession.shared.data(from: breakfastAPIURL)
              let decoder = JSONDecoder()
              recipes = try decoder.decode([Recipe].self, from: data)
          } catch {
              print(error)
          }
      }
    
}
