//
//  AppetizerDetailsTextView.swift
//  Appetizers
//
//  Created by Tharin Zaman on 19/12/2023.
//

import SwiftUI

struct AppetizerDetailsTextView: View {
    let appetizer: Appetizer
    var body: some View {
        VStack {
            Text(appetizer.name)
                .font(.title2)
                .fontWeight(.semibold)
            Text(appetizer.description)
                .multilineTextAlignment(.center)
                .font(.body)
                .padding()
        }
    }
}

#Preview {
    AppetizerDetailsTextView(appetizer: MockData.sampleAppetizer)
}
