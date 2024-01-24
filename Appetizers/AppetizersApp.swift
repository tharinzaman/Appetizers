//
//  AppetizersApp.swift
//  Appetizers
//
//  Created by Tharin Zaman on 18/12/2023.
//

import SwiftUI

@main
struct AppetizersApp: App {
    var order = Order()
    let network = NetworkClientImpl()
    var body: some Scene {
        WindowGroup {
            AppetizerTabView(
                network: network
            ).environmentObject(order)
        }
    }
}
