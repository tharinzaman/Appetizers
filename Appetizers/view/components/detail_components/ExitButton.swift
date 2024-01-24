//
//  ExitButton.swift
//  Appetizers
//
//  Created by Tharin Zaman on 19/12/2023.
//

import SwiftUI

struct ExitButton: View {
    @Binding var shouldShowDetail: Bool
    var body: some View {
        Button {
            shouldShowDetail = false
        } label: {
            ZStack {
                Circle()
                    .frame(
                        width: 30,
                        height: 30
                    )
                    .foregroundColor(
                        .white
                    )
                    .opacity(
                        0.6
                    )
                Image(systemName: "xmark")
                    .imageScale(.small)
                    .frame(width: 44, height: 44)
                    .foregroundColor(.black)
            }
        }
    }
}
