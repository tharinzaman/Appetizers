//
//  MockStorage.swift
//  AppetizersTests
//
//  Created by Tharin Zaman on 27/01/2024.
//

import Foundation
@testable import Appetizers

class MockStorageSuccess: StorageProtocol {
    
    private(
        set
    ) var saveUserCalled = false
    private(
        set
    ) var retrieveUserCalled = false
    
    func saveUser(
        user: Appetizers.User
    ) throws {
        saveUserCalled = true
    }
    
    func retrieveUser(
        key: String
    ) throws -> Appetizers.User {
        retrieveUserCalled = true
        return User(
            firstName: "Tharin",
            lastName: "Zaman",
            email: "tharinzaman@hotmail.com",
            dateOfBirth: Date.now,
            extraNapkins: true,
            frequentRefills: true
        )
    }
    
}

class MockStorageFailure: StorageProtocol {
    
    private(set) var saveUserCalled = false
    private(set) var retrieveUserCalled = false
    
    func saveUser(
        user: Appetizers.User
    ) throws {
        saveUserCalled = true
        throw UserError.unableToSaveUser
    }
    
    func retrieveUser(
        key: String
    ) throws -> Appetizers.User {
        retrieveUserCalled = true
        throw UserError.unableToRetrieveUser
    }
}
