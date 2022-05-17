//
//  VeganAPI.swift
//  WeCooked
//
//  Created by Imran razak on 27/04/2022.
//  Copyright © 2022 Imran Razak. All rights reserved.
//

import Foundation

@MainActor
class VeganAPI: ObservableObject {
    @Published var recipes: [Recipe] = []
    
    func fetchRecipes() async {
        guard let veganAPIURL = URL(string: URLData.vegan.rawValue) else {
            fatalError("Missing URL")
            
        }

          do {
              let (data, _) = try await URLSession.shared.data(from: veganAPIURL)
              let decoder = JSONDecoder()
              recipes = try decoder.decode([Recipe].self, from: data)
          } catch {
              print("Error decoding: ", error)
          }
      }
    
}
