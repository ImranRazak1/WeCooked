//
//  avocadotoastApp.swift
//  avocadotoast
//
//  Created by Imran razak on 04/03/2022.
//

import SwiftUI


@main
struct WeCookedApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    var body: some Scene {
        WindowGroup {
            RecipeContentView()
            
        }
    }
   
}
