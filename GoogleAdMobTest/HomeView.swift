//
//  HomeView.swift
//  GoogleAdMobTest
//
//  Created by Cesar Ibarra on 3/30/25.
//

import SwiftUI

struct HomeView: View {
    let adManager: InterstitialAdManager
    @State private var timer: Timer?

    var body: some View {
        VStack {
            Text("Bienvenido a GoogleAdmobTest!")
                .font(.title)
                .padding()
        }
        .onAppear {
            startAdTimer()
        }
        .onDisappear {
            timer?.invalidate()
        }
    }

    func startAdTimer() {
        adManager.showAdIfAvailable()
        
        timer?.invalidate()
        timer = Timer.scheduledTimer(withTimeInterval: 120, repeats: true) { _ in
            adManager.showAdIfAvailable()
        }
    }
}

#Preview {
    HomeView(adManager: InterstitialAdManager())
}
