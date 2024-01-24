//
//  EmptyOrderView.swift
//  Appetizers
//
//  Created by Tharin Zaman on 21/12/2023.
//

import SwiftUI

struct EmptyOrderView: View {
    
    let imageName: String
    let message: String
    
    var body: some View {
        ZStack {
            Color(.systemBackground)
                .ignoresSafeArea()
            VStack {
                Image(imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 150)
                Text(message)
                    .font(.title3)
                    .fontWeight(.semibold)
                    .multilineTextAlignment(.center)
                    .foregroundColor(.secondary)
                    .padding()
            }
            .offset(y: -50)
        }
    }
}

#Preview {
    EmptyOrderView(imageName: "empty-order", message: "This is our test message. I am purposely making it a bit long for testing")
}
