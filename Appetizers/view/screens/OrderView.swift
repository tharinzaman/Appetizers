//
//  OrderView.swift
//  Appetizers
//
//  Created by Tharin Zaman on 18/12/2023.
//

import SwiftUI

struct OrderView: View {
    @EnvironmentObject var order: Order
    let network: NetworkClientProtocol
    var body: some View {
        NavigationStack {
            ZStack {
                AppetizersOrderView(network: network)
                if !order.hasItems() {
                    EmptyOrderView(
                        imageName: "empty-order",
                        message: "There are currently no appetizers in your order. \nPlease add some delicious appetizers so you can checkout!"
                    )
                }
            }
            .navigationTitle(
                "🧾 Order"
            )
        }
    }
    
    
}

