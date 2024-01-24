//
//  PersonalInfoForm.swift
//  Appetizers
//
//  Created by Tharin Zaman on 20/12/2023.
//

import SwiftUI

struct PersonalInfoSection: View {
    
    @ObservedObject var viewModel: AccountViewModel
    @FocusState private var focusedTextField: FocusTextField?
    
    var body: some View {
        Section(
            header: Text(
                "Personal Info"
            )
        ) {
            TextField(
                "First Name",
                text: $viewModel.user.firstName
            )
            .focused(
                $focusedTextField,
                equals: .firstName
            )
            .onSubmit {
                focusedTextField = .lastName
            }
            .submitLabel(
                .next
            )
            TextField(
                "Last Name",
                text: $viewModel.user.lastName
            )
            .focused(
                $focusedTextField,
                equals: .lastName
            )
            .submitLabel(
                .next
            )
            .onSubmit {
                focusedTextField = .email
            }
            TextField(
                "Email",
                text: $viewModel.user.email
            )
            .focused(
                $focusedTextField,
                equals: .email
            )
            .submitLabel(
                .continue
            )
            .onSubmit {
                focusedTextField = nil
            }
            .modifier(
                StandardEmailTextFieldStyle()
            )
            DatePicker(
                "Date of birth",
                selection: $viewModel.user.dateOfBirth,
                in: Date().twoHundredYearsAgo...Date().eighteenYearsAgo,
                displayedComponents: .date
            )
            Button {
                viewModel.saveUserChangesToStorage()
            } label: {
                Text(
                    "Save Changes"
                )
            }
        }
    }
}
