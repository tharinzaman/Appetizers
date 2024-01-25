//
//  MockNetworkClientImpl.swift
//  AppetizersTests
//
//  Created by Tharin Zaman on 25/01/2024.
//

import Foundation
@testable import Appetizers
import SwiftUI

class MockNetworkClient {
    @Published private(set) var fetchCalled = false
    @Published private(set) var fetchImageCalled = false
}

class MockNetworkClientSuccess: MockNetworkClient, NetworkClientProtocol {
    
    func fetch(
        session: URLSession
    ) throws -> [Appetizer] {
        fetchCalled = true
        return try StaticLoader.loadJSONFromFileReturnDecodedData(
            file: "MockNetworkResponse"
        )
    }
    
    func fetchImage(
        session: URLSession,
        from urlString: String
    ) throws -> UIImage? {
        fetchImageCalled = true
        return try StaticLoader.loadImageFromFileReturnUIImage(
            file: "AsianFlankSteak",
            fileExt: "jpg"
        )
    }
    
}
