//
//  ToggleSection.swift
//  Appetizers
//
//  Created by Tharin Zaman on 20/12/2023.
//

import SwiftUI

struct ToggleSection: View {
    @ObservedObject var viewModel: AccountViewModel
    var body: some View {
        Section(
            header: Text(
                "Requests"
            )
        ) {
            Toggle(
                "Extra napkins",
                isOn: $viewModel.user.extraNapkins
            )
            Toggle(
                "Frequent refills",
                isOn: $viewModel.user.frequentRefills
            )
        }.toggleStyle(
            SwitchToggleStyle(
                tint: .brandPrimary
            )
        )
    }
}
