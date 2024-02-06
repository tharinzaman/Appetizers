//
//  ContentView.swift
//  Appetizers
//
//  Created by Tharin Zaman on 18/12/2023.
//

import SwiftUI

struct AppetizerTabView: View {
    
    @EnvironmentObject var order: Order
    
    let network: NetworkClientProtocol
    let encoder: JSONEncoder
    let decoder: JSONDecoder
    
    var body: some View {
        TabView {
            AppetizerListView(
                network: network
            )
            .tabItem {
                Label(
                    "Home",
                    systemImage: "house.circle.fill"
                )
            }
            AccountView(
                encoder: encoder,
                decoder: decoder
            )
            .tabItem {
                Label(
                    "Account",
                    systemImage: "person.circle.fill"
                )
            }
            OrderView(
                network: network
            )
                .tabItem {
                    Label(
                        "Order",
                        systemImage: "bag.circle.fill"
                    )
                }
                .badge(
                    order.size()
                )
        }
    }
}

