//
//  AddToOrderButton.swift
//  Appetizers
//
//  Created by Tharin Zaman on 19/12/2023.
//

import SwiftUI

struct OrderButtonText: View {
    
    let price: Double
    let action: String
    
    var body: some View {
        Text("$\(price, specifier: "%.2f") - \(action)")
            .font(.title3)
            .fontWeight(.semibold)
            .frame(width: 260, height: 50)
            .foregroundColor(.white)
            .background(Color.brandPrimary)
            .cornerRadius(10)
    }
}
