//
//  AppDelegate.swift
//  WeCooked
//
//  Created by Imran razak on 22/04/2022.
//

import Foundation
import SwiftUI
import Amplify
import AWSS3StoragePlugin
//import AWSCognitoAuthPlugin

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        do {
            try Amplify.add(plugin: AWSS3StoragePlugin())
           // try Amplify.add(plugin: AWSCognitoAuthPlugin())
            try Amplify.configure()
            print("Amplify configured with storage plugin")
        } catch {
            print("Failed to initialize Amplify with \(error)")
        }

        return true
    }
}
