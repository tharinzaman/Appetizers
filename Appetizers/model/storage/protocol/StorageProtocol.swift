//
//  StorageRepo.swift
//  Appetizers
//
//  Created by Tharin Zaman on 20/12/2023.
//

import Foundation


protocol StorageProtocol {
    func saveUser(user: User) throws -> Void
    func retrieveUser(key: String) throws -> User
}
