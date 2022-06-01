//
//  UpdatesModelAPI.swift
//  WeCooked
//
//  Created by Imran razak on 23/05/2022.
//

import Foundation


@MainActor
class updateAPI: ObservableObject {
    @Published var updates: [UpdatesModel] = []
    
    func loadData() async {
        
        let url = URL(string: "https://updatecheck.s3.eu-west-2.amazonaws.com/updates.json")!

        do {
            
            let (data, _) = try await URLSession.shared.data(from: url)
            let decoder = JSONDecoder()
            updates = try decoder.decode([UpdatesModel].self, from: data)
            
            
        } catch {
            print("Invalid data")
        }
        
    }
    
    
}
