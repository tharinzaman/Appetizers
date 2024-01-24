//
//  AccountViewModel.swift
//  Appetizers
//
//  Created by Tharin Zaman on 20/12/2023.
//

import SwiftUI

final class AccountViewModel: ObservableObject {
    
    @Published var user = User()
    @Published var alertItem: AlertItem? = nil
    
    private let storage : StorageProtocol
    
    init(storage: StorageProtocol) {
        self.storage = storage
    }
    
    var isValidForm: Bool {
        guard !user.firstName.isEmpty && !user.lastName.isEmpty && !user.email.isEmpty else {
            alertItem = ErrorAlertItems.missingDetail
            return false
        }
        guard user.email.isValidEmail else {
            alertItem = ErrorAlertItems.invalidEmail
            return false
        }
        return true
    }
    
    func saveUserChangesToStorage() {
        guard isValidForm else {
            return
        }
        do {
            try storage.saveUser(
                user: self.user
            )
            alertItem = UserAlertItem.userSavedSuccessfully
        } catch {
            alertItem = ErrorAlertItems.unableToSaveUser
        }
    }
    
    func retrieveUserDetailsFromStorage() {
        do {
            self.user = try storage.retrieveUser(
                key: "user"
            )
        } catch {
            alertItem = ErrorAlertItems.unableToRetrieveUser
        }
    }
}
