//
//  AddToOrderButton.swift
//  Appetizers
//
//  Created by Tharin Zaman on 19/12/2023.
//

import SwiftUI

struct OrderButton: View {
    
    let price: Double
    let toDo: String
    
    let action: () -> Void
    
    var body: some View {
        Button {
            action()
        } label: {
            Text("$\(price, specifier: "%.2f") - \(toDo)")
                .font(.title3)
                .fontWeight(.semibold)
        }
        .modifier(StandardButtonStyle())
//        .standardButtonStyle() This is another way of doing what we do in the line above
        .padding(30)
    }
}
