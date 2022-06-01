//
//  HealthyAPI.swift
//  WeCooked
//
//  Created by Imran razak on 29/04/2022.
//  Copyright © 2022 Imran Razak. All rights reserved.
//

import Foundation

@MainActor
class HealthyAPI: ObservableObject {
    @Published var recipes: [Recipe] = []
    
    func fetchRecipes() async {

        
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yyyy"

          do {
              let healthyAPI = URL(string: URLData.healthy.rawValue)!
              async let items = try await URLSession.shared.decode([Recipe].self, from: healthyAPI, dateDecodingStrategy: .formatted(formatter))
              recipes = try await items
              recipes = recipes.filter { $0.dateAdded <= Date.now }
          } catch {
              print("Error decoding: ", error)
          }
      }
}
