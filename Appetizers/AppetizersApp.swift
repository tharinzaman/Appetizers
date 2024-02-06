//
//  AppetizersApp.swift
//  Appetizers
//
//  Created by Tharin Zaman on 18/12/2023.
//
import SwiftUI

@main
struct AppetizersApp: App {
    
    @UIApplicationDelegateAdaptor(
        AppDelegate.self
    ) var appDelegate
    
    var order = Order()
    let encoder = JSONEncoder()
    let decoder = JSONDecoder()
    var body: some Scene {
        WindowGroup {
            AppetizerTabView(
                network: NetworkClientImpl(
                    decoder: self.decoder
                ),
                encoder: encoder,
                decoder: decoder
            ).environmentObject(
                order
            )
//            CombineScreen(
//                network: NetworkClientImpl(
//                    decoder: self.decoder
//                )
//            )
        }
    }
}

class AppDelegate: UIResponder, UIApplicationDelegate {
    
    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil
    ) -> Bool {
#if DEBUG
        print(
            "😂 Is UI Test Running: \(UITestingHelper.isUITest)"
        )
#endif
        return true
    }
}
