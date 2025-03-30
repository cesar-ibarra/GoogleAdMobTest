//
//  GoogleAdMobTestApp.swift
//  GoogleAdMobTest
//
//  Created by Cesar Ibarra on 3/30/25.
//

import SwiftUI
import GoogleMobileAds

@main
struct GoogleAdMobTestApp: App {
    
    init() {
        MobileAds.shared.start(completionHandler: nil)
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
