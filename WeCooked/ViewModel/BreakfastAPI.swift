//
//  BreakfastAPI.swift
//  WeCooked
//
//  Created by Imran razak on 29/04/2022.
//  Copyright © 2022 Imran Razak. All rights reserved.
//

import Foundation

@MainActor
class BreakfastAPI: ObservableObject {
    @Published var recipes: [Recipe] = []
    
    func fetchRecipes() async {
        
        ///Fetches new recipes
        
        guard let breakfastAPIURL = URL(string: URLData.breakfast.rawValue) else {
            fatalError("Missing URL") 
        }
        
        /// This methof get's the API URL and stores into the constant.

          do {
              let (data, _) = try await URLSession.shared.data(from: breakfastAPIURL)
              let decoder = JSONDecoder()
              recipes = try decoder.decode([Recipe].self, from: data)
        /// The data is then decoded and put into the recipes array for accibsle use across the app.
          } catch {
              print("Error decoding: ", error)
          }
      }
    
}

