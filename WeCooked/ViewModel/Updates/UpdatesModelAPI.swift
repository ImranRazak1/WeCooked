//
//  UpdatesModelAPI.swift
//  WeCooked
//
//  Created by Imran razak on 23/05/2022.
//

import Foundation
@MainActor
class updateModelAPI: ObservableObject {
    @Published var updates: [UpdatesModel] = []
    
    func loadData() async {
        
        guard let url = URL(string: "") else {
            print("Invalid URL")
            return
        }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let decoder = JSONDecoder()
            updates = try decoder.decode([UpdatesModel].self, from: data)
        } catch {
            print("Invalid data")
        }
        
    }
    
}
