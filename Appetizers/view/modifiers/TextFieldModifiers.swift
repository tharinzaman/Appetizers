//
//  TextFieldModifiers.swift
//  Appetizers
//
//  Created by Tharin Zaman on 21/12/2023.
//

import SwiftUI

struct StandardEmailTextFieldStyle: ViewModifier {
        
    func body(
        content: Content
    ) -> some View {
        content
            .keyboardType(
                .emailAddress
            )
            .autocapitalization(
                .none
            )
            .autocorrectionDisabled(
                true
            )
    }
}
