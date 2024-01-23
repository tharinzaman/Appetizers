//
//  AppetizerNetworkProtocolTest.swift
//  AppetizersTests
//
//  Created by Tharin Zaman on 15/01/2024.
//

import XCTest
@testable import Appetizers

final class NetworkClientTest: XCTestCase {
    
    var networkClient: NetworkClientProtocol
    
    override func setUp() {
        super.setUp()
        networkClient = MockNetworkClientImpl()
        MockNetworkClientImpl.fileName = "MockNetworkResponse"
    }
    
    override func tearDown() {
        super.tearDown()
    }

    func test_fetchDataFromJSON_Success() async throws {
        // ASSIGN
        
        // ACT
        let result = try await networkClient.fetch()
        // ASSERT
        XCTAssertNotNil(result)
    }
    
//    func test_URLParsedIsInvalid_Fail() async throws {
//        // ASSIGN
//        MockNetworkClientImpl.fileName = "InvalidFile"
//        // ACT
//        let result = try await networkClient.fetch()
//        // ASSERT
//    }

}
