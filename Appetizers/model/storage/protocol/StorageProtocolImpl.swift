//
//  StorageRepoImpl.swift
//  Appetizers
//
//  Created by Tharin Zaman on 20/12/2023.
//

import Foundation
import SwiftUI

class StorageProtocolImpl: StorageProtocol {
    
    @AppStorage("user") private var userData: Data?
        
    func saveUser(user: User) throws {
        do {
            let data = try JSONEncoder().encode(user)
            userData = data
        } catch {
            throw UserError.unableToSaveUser
        }
    }
    
    func retrieveUser(key: String) throws -> User {
        // Check if there is already user data
        guard let userData else {
            return User()
        }
        
        var user = User()
        do {
            user = try JSONDecoder().decode(User.self, from: userData)
        } catch {
            throw UserError.unableToRetrieveUser
        }
        return user
    }
}
