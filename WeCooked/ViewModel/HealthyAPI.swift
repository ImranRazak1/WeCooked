//
//  HealthyAPI.swift
//  WeCooked
//
//  Created by Imran razak on 29/04/2022.
//

import Foundation

@MainActor
class HealthyAPI: ObservableObject {
    @Published var recipes: [Recipe] = []
    
    func fetchRecipes() async {
        guard let healthyAPIURL = URL(string: URLData.healthy.rawValue) else {
            fatalError("Missing URL")
        }

          do {
              let (data, _) = try await URLSession.shared.data(from: healthyAPIURL)
              let decoder = JSONDecoder()
              recipes = try decoder.decode([Recipe].self, from: data)
          } catch {
              print("Error decoding: ", error)
          }
      }
}
