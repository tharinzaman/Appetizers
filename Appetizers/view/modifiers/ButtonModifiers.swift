//
//  CustomModifiers.swift
//  Appetizers
//
//  Created by Tharin Zaman on 21/12/2023.
//

import SwiftUI

struct StandardButtonStyle: ViewModifier {
        
    func body(content: Content) -> some View {
        content
            .buttonStyle(.bordered)
            .tint(.brandPrimary)
            .controlSize(.large)
    }
}

extension View {
    
    func standardButtonStyle() -> some View {
        self.modifier(StandardButtonStyle())
    }
    
}
