//
//  AppetizerCell.swift
//  Appetizers
//
//  Created by Tharin Zaman on 19/12/2023.
//

import SwiftUI

struct AppetizerCell: View {
    let network: NetworkClientProtocol
    let appetizer: Appetizer
    var body: some View {
        HStack {
            AppetizerRemoteImage(
                network: network,
                urlString: appetizer.imageURL
            )
            AppetizerPriceName(
                appetizer: appetizer
            )
        }
    }
}

struct AppetizerPriceName: View {
    let appetizer: Appetizer
    var body: some View {
        VStack(
            alignment: .leading,
            spacing: 5
        ) {
            Text(
                appetizer.name
            )
            .font(
                .title2
            )
            .fontWeight(
                .medium
            )
            Text("$\(appetizer.price,specifier: "%.2f")")
            .foregroundColor(
                .secondary
            )
            .fontWeight(
                .semibold
            )
        }.padding(
            .leading
        )
    }
}
