//
//  updateStatus.swift
//  WeCooked
//
//  Created by Imran razak on 30/05/2022.
//

import Foundation

class updateStatus: ObservableObject {
    @Published var showUpdate = false {
        willSet{
            objectWillChange.send()
        }
    }
    
    @Published var updated = UserDefaults.standard.bool(forKey: "updated")
    var updates = true
    
    func toggleSheet(){
        updated = true
        UserDefaults.standard.set(self.updated,forKey: "updated")
        
}

    func checkStatus() {
        if updated == false && updates == true{
            showUpdate = true
            updated = true
            UserDefaults.standard.set(self.updated,forKey: "updated")
        } else if updated == true{
            showUpdate = false
        }
        
    }
    
    
}
