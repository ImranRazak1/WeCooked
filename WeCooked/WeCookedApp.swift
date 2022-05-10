//
//  avocadotoastApp.swift
//  avocadotoast
//
//  Created by Imran razak on 04/03/2022.
//

import SwiftUI
import Amplify

@main
struct WeCookedApp: App {
    
    var body: some Scene {
        WindowGroup {
            RecipeContentView()
            
        }
    }
   
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        do {
            //Log messages for what Amplifiy is configuring
            Amplify.Logging.logLevel = .verbose
            try Amplify.configure()
        } catch {
            print("An error occurred setting up Amplify: \(error)")
        }
        return true
    }
}
