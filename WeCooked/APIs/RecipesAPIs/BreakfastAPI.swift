//
//  BreakfastAPI.swift
//  WeCooked
//
//  Created by Imran razak on 29/04/2022.
//

import Foundation
import Amplify


@MainActor
class BreakfastAPI: ObservableObject {
    @Published var recipes: [Recipe] = []
 
    let urlRecieved = ""
    
    func fetchRecipes() async {
       
         let sink = Amplify.Storage.getURL(key: "Breakfast.json")
                   .resultPublisher
                   .sink {
                       if case let .failure(storageError) = $0 {
                           print("Failed: \(storageError.errorDescription). \(storageError.recoverySuggestion)")
                       }
                   }
                   receiveValue: { url in
                      let urlRecieved = url
                   }
        
        guard let breakfastAPIURL = URL(string: urlRecieved) else {
            
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
