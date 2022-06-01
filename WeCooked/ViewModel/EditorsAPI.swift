//
//  EditorsAPI.swift
//  WeCooked
//
//  Created by Imran razak on 31/05/2022.
//

import Foundation
@MainActor
class EditorAPI: ObservableObject {
    @Published var recipes: [Recipe] = []
    
    func fetchRecipes() async {
        
        
        do {
            let editorAPIURL = URL(string: URLData.editor.rawValue)!
            async let items = try await URLSession.shared.decode([Recipe].self, from: editorAPIURL)
            recipes = try await items
        } catch {
            print("Error decoding: ", error)
        }
    }
    
    
}
