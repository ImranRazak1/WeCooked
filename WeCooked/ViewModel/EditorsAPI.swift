//
//  EditorsAPI.swift
//  WeCooked
//
//  Created by Imran razak on 31/05/2022.
//

import Foundation

@MainActor
class EditorsAPI: ObservableObject {
    @Published var recipes: [Recipe] = []
    
    func fetchRecipes() async {
        
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yyyy"
        
        do {
            let editorAPIURL = URL(string: URLData.editor.rawValue)!
            async let items = try await URLSession.shared.decode([Recipe].self, from: editorAPIURL, dateDecodingStrategy: .formatted(formatter))
            recipes = try await items
            recipes = recipes.filter { $0.dateAdded <= Date.now }
        } catch {
            print("Error decoding: ", error)
        }
    }
    
    
}
