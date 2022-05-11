//
//  AppDelegate.swift
//  WeCooked
//
//  Created by Imran razak on 11/05/2022.
//

import Foundation
import SwiftUI
import Amplify
import AWSS3StoragePlugin
import AWSCognitoAuthPlugin

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        do {
            //Log messages for what Amplifiy is configuring
            Amplify.Logging.logLevel = .verbose
            try Amplify.add(plugin: AWSCognitoAuthPlugin())
            try Amplify.add(plugin: AWSS3StoragePlugin())
            try Amplify.configure()
        } catch {
            print("An error occurred setting up Amplify: \(error)")
        }
        return true
    }
}
