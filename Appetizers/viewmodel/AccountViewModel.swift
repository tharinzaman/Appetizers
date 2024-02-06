//
//  AccountViewModel.swift
//  Appetizers
//
//  Created by Tharin Zaman on 20/12/2023.
//

import SwiftUI

final class AccountViewModel: ObservableObject{
        
    @Published var user = User()
    @Published var alertItem: AlertItem? = nil
    
    @AppStorage("user") private var userData: Data?
    
    private let encoder: JSONEncoder
    private let decoder: JSONDecoder
    
    init(encoder: JSONEncoder, decoder: JSONDecoder) {
        self.encoder = encoder
        self.decoder = decoder
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
            self.userData = try encoder.encode(self.user)
            alertItem = UserAlertItem.userSavedSuccessfully
        } catch {
            alertItem = ErrorAlertItems.unableToSaveUser
        }
    }
    
    func retrieveUserDetailsFromStorage() {
        guard let userData else {
            return
        }
        do {
            self.user = try decoder.decode(User.self, from: userData)
        } catch {
            alertItem = ErrorAlertItems.unableToRetrieveUser
        }
    }
}
