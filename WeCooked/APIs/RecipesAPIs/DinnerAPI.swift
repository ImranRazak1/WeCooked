//
//  DinnerAPI.swift
//  WeCooked
//
//  Created by Imran razak on 29/04/2022.
//

import Foundation

@MainActor
class DinnerAPI: ObservableObject {
    @Published var recipes: [Recipe] = []
    
    func fetchRecipes() async {
        guard let dinnerAPIURL = URL(string: URLData.dinner.rawValue) else {
            fatalError("Missing URL")
            
        }

          do {
              let (data, _) = try await URLSession.shared.data(from: dinnerAPIURL)
              let decoder = JSONDecoder()
              recipes = try decoder.decode([Recipe].self, from: data)
          } catch {
              print("Error decoding: ", error)
          }
      }
    
}
