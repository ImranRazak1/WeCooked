//
//  ShareSheet.swift
//  WeCooked
//
//  Created by Imran razak on 23/05/2022.
//

import Foundation
import SwiftUI


func shareButton() {
        let url = URL(string: "https://apps.apple.com/tt/app/wecooked/id1622900349")
    
        let activityController = UIActivityViewController(activityItems: [url!], applicationActivities: nil)

    UIApplication.shared.currentUIWindow()?.rootViewController!.present(activityController, animated: true, completion: nil)
}



public extension UIApplication {
    func currentUIWindow() -> UIWindow? {
        let connectedScenes = UIApplication.shared.connectedScenes
            .filter({
                $0.activationState == .foregroundActive})
            .compactMap({$0 as? UIWindowScene})
        
        let window = connectedScenes.first?
            .windows
            .first { $0.isKeyWindow }

        return window
        
    }
}
