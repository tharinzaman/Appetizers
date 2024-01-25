//
//  ImageLoaderViewModelTest.swift
//  AppetizersTests
//
//  Created by Tharin Zaman on 25/01/2024.
//

import XCTest
@testable import Appetizers

final class ImageLoaderViewModelTest: XCTestCase {
    
    func test_loadImage_success() async {
        // ASSIGN
        let client = MockNetworkClientSuccess()
        let viewModel = ImageLoaderViewModel(network: client)
        // ACT
        await viewModel.load(from: "Doesn't matter, can be anything")
        // ASSERT
        XCTAssertNotNil(viewModel.image)
        XCTAssertTrue(client.fetchImageCalled)
    }
    
    func test_loadImage_failure() async {
        // ASSIGN
        let client = MockNetworkClientThrowInvalidURL()
        let viewModel = ImageLoaderViewModel(network: client)
        // ACT
        await viewModel.load(from: "Doesn't matter, can be anything")
        // ASSERT
        XCTAssertNil(viewModel.image)
        XCTAssertTrue(client.fetchImageCalled)
    }
    
}
