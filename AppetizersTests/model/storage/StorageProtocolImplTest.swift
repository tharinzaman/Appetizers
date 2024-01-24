//
//  StorageProtocolImplTest.swift
//  AppetizersTests
//
//  Created by Tharin Zaman on 11/01/2024.
//

import XCTest
@testable import Appetizers

final class StorageProtocolImplTest: XCTestCase {
    
    let storage: StorageProtocol = StorageProtocolImpl()

    func test_SaveUserToAppStorage_Success() {
        // ARRANGE
        let user = User(firstName: "Tharin")
        do { try storage.saveUser(user: user) } catch {}
        // ACT
        var result = User()
        do {
            result = try storage.retrieveUser(key: "user")
        } catch {}
        // ASSERT
        XCTAssertEqual(result.firstName, "Tharin")
    }
    
//    func test_SaveUserToAppStorage_Failure_ThrowsError() {
//       
//        XCTAssertThrowsError(try storage.saveUser(user: <#T##User#>))
//    }

}
