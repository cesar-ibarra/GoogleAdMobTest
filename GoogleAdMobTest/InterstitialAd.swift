//
//  InterstitialAd.swift
//  GoogleAdMobTest
//
//  Created by Cesar Ibarra on 3/30/25.
//

import Foundation
import SwiftUI
import GoogleMobileAds

@Observable
class InterstitialAdManager: NSObject {
    private var interstitialAd: InterstitialAd?
    
    override init() {
        super.init()
        loadAd()
    }
    
    func loadAd() {
        let request = Request()
        InterstitialAd.load(
            with: "ca-app-pub-3940256099942544/4411468910", // ID de prueba
            request: request
        ) { [weak self] ad, error in
            if let error = error {
                print("❌ Error al cargar anuncio: \(error.localizedDescription)")
                return
            }
            self?.interstitialAd = ad
            self?.interstitialAd?.fullScreenContentDelegate = self
            print("✅ Anuncio cargado correctamente.")
        }
    }
    
    func showAdIfAvailable() {
        guard let ad = interstitialAd,
              let rootVC = (UIApplication.shared.connectedScenes.first as? UIWindowScene)?
                  .keyWindow?.rootViewController else {
            print("⚠️ El anuncio no está listo o no se encontró rootViewController.")
            return
        }
        ad.present(from: rootVC)
    }
}

extension InterstitialAdManager: FullScreenContentDelegate {
    func adDidDismissFullScreenContent(_ ad: FullScreenPresentingAd) {
        print("🔁 Anuncio cerrado. Cargando otro.")
        loadAd()
    }
}
