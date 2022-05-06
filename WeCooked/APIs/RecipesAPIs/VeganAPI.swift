//
//  VeganAPI.swift
//  WeCooked
//
//  Created by Imran razak on 27/04/2022.
//

import Foundation

@MainActor
class VeganAPI: ObservableObject {
    @Published var recipes: [Recipe] = []
    
    func fetchRecipes() async {
        guard let veganAPIURL = URL(string: "https://recipesstore.s3.eu-west-2.amazonaws.com/Vegan.json") else {
            
            print("Invalid URL")
            return
            
        }

          do {
              let (data, _) = try await URLSession.shared.data(from: veganAPIURL)
              let decoder = JSONDecoder()
              recipes = try decoder.decode([Recipe].self, from: data)
          } catch {
              print(error)
          }
      }
    
}
