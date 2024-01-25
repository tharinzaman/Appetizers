//
//  AppetizerListViewModelTest.swift
//  AppetizersTests
//
//  Created by Tharin Zaman on 13/01/2024.
//

import XCTest
@testable import Appetizers

final class AppetizerListViewModelTest: XCTestCase {
    
    func test_getAppetizersFromNetworkClient_ResultSuccess() async {
        // ASSIGN
        let client = MockNetworkClientSuccess()
        let viewModel = AppetizerListViewModel(network: client)
        // ACT
        await viewModel.getAppetizers()
        // ASSERT
        XCTAssertEqual(
            viewModel.appetizers.count,
            14
        )
        XCTAssertNil(
            viewModel.alertItem
        )
        XCTAssertTrue(
            client.fetchCalled
        )
    }
    
    func test_getAppetizersFromNetworkClient_failure_invalidURL() async {
        // ASSIGN
        let client = MockNetworkClientThrowInvalidURL()
        let viewModel = AppetizerListViewModel(network: client)
        // ACT
        await viewModel.getAppetizers()
        // ASSERT
        XCTAssertNotNil(viewModel.alertItem)
        XCTAssertEqual(viewModel.alertItem?.id, ErrorAlertItems.invalidURL.id)
        XCTAssertTrue(viewModel.appetizers.isEmpty)
        XCTAssertTrue(client.fetchCalled)
    }
    
    func test_getAppetizersFromNetworkClient_failure_invalidData() async {
        // ASSIGN
        let client = MockNetworkClientThrowInvalidData()
        let viewModel = AppetizerListViewModel(network: client)
        // ACT
        await viewModel.getAppetizers()
        // ASSERT
        XCTAssertNotNil(viewModel.alertItem)
        XCTAssertEqual(viewModel.alertItem?.id, ErrorAlertItems.invalidData.id)
        XCTAssertTrue(viewModel.appetizers.isEmpty)
        XCTAssertTrue(client.fetchCalled)
    }
    
}
