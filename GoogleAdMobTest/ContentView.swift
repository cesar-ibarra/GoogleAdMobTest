//
//  ContentView.swift
//  GoogleAdMobTest
//
//  Created by Cesar Ibarra on 3/30/25.
//

import SwiftUI

struct ContentView: View {
    @State private var adManager = InterstitialAdManager()
    
    var body: some View {
        TabView {
            HomeView(adManager: adManager)
                .tabItem {
                    Label("Inicio", systemImage: "house")
                }
            SettingsView()
                .tabItem {
                    Label("Configuración", systemImage: "gearshape")
                }
        }
    }
}

#Preview {
    ContentView()
}
