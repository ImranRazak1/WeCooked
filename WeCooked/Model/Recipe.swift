//
//  Recipe.swift
//  avocadotoast
//
//  Created by Imran razak on 17/03/2022.
//  Copyright © 2022 Imran Razak. All rights reserved.
//

import SwiftUI
import Foundation
struct Recipe: Identifiable, Codable {
    let id: Int
    let name: String
    let creator: String
    let serves: Int
    let ingredients: [Ingredient]
    let methods: [Method]
    let imageURL: URL
    let dateAdded: Date
    let difficulty: String

    //Add new attributes to the CodingKeys
      enum CodingKeys: String, CodingKey {
        case id, name, creator, serves, ingredients, dateAdded, difficulty
        case methods = "method"
        case imageURL = "imageurl"
    }
}

struct Ingredient: Codable {
    let name: String
    let quantity: Int
    let measurement: String
    
}

struct Method: Codable {
    let step: Int
    let text: String
}

enum RecipeSelection: String, CaseIterable, Identifiable {
    case vegan
    case breakfast
    case lunch
    case dinner

    var id: String { self.rawValue }
    var name: String { self.rawValue.capitalized }

    var menu: String {
        switch self {
        case .vegan: return "Vegan"
        case .breakfast: return "Breakfast"
        case .lunch: return "Lunch"
        case .dinner: return "Dinner"
        }
    }
}




