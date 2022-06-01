//
//  avocadotoastApp.swift
//  avocadotoast
//
//  Created by Imran razak on 04/03/2022.
//

import SwiftUI

@main
struct WeCookedApp: App {
    @StateObject var check = updateStatus()
    var body: some Scene {
        WindowGroup {
            HomeContentView()
                .onAppear(perform: check.checkStatus)
        }
        
    }

}
