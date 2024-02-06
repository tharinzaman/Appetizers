//
//  AccountView.swift
//  Appetizers
//
//  Created by Tharin Zaman on 18/12/2023.
//

import SwiftUI

struct AccountView: View {
        
    @StateObject var viewModel : AccountViewModel
    @FocusState private var focusedTextField: FocusTextField?
    
    init(
        encoder: JSONEncoder,
        decoder: JSONDecoder
    ) {
        _viewModel = StateObject(
            wrappedValue: AccountViewModel(
                encoder: encoder,
                decoder: decoder
            )
        )
    }
    
    var body: some View {
        NavigationStack {
            Form {
                PersonalInfoSection(
                    viewModel: self.viewModel
                )
                ToggleSection(
                    viewModel: self.viewModel
                )
            }
            .navigationTitle(
                "👩🏿‍💼 Account"
            )
            .toolbar {
                ToolbarItemGroup(
                    placement: .keyboard
                ) {
                    Button(
                        "Dismiss"
                    ) {
                        focusedTextField = nil
                    }
                }
            }
        }
        .onAppear {
            viewModel.retrieveUserDetailsFromStorage()
        }
        .alert(
            item: $viewModel.alertItem
        ) { alertItem in
            Alert(
                title: alertItem.title,
                message: alertItem.message,
                dismissButton: alertItem.dismissButton
            )
        }
    }
}

