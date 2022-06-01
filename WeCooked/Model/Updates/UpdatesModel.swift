//
//  UpdatesModel.swift
//  WeCooked
//
//  Created by Imran razak on 23/05/2022.
//

import Foundation
import SwiftUI

struct UpdatesModel: Identifiable, Codable{
    let id: Int
    let image: String
    let updateTitle: String
    let updateText: String
    
    enum CodingKeys: String, CodingKey {
      case id, image, updateTitle, updateText
  }
    
}
