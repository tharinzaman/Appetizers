//
//  MockNetworkClientImpl.swift
//  AppetizersTests
//
//  Created by Tharin Zaman on 25/01/2024.
//

import Foundation
@testable import Appetizers
import SwiftUI

class MockNetworkClientSuccess: NetworkClientProtocol {
        
    @Published private(set) var fetchCalled = false
    @Published private(set) var fetchImageCalled = false
    
    func fetch(
        session: URLSession
    ) throws -> [Appetizer] {
        fetchCalled = true
        return StaticLoader.loadJSONFromFileReturnDecodedData(
            file: "MockNetworkResponse"
        )
    }
    
    func fetchImage(
        session: URLSession,
        from urlString: String
    ) throws -> UIImage? {
        fetchImageCalled = true
        return StaticLoader.loadImageFromFileReturnUIImage(
            file: "AsianFlankSteak",
            fileExt: "jpg"
        )
    }
    
}

class MockNetworkClientThrowInvalidURL: NetworkClientProtocol {
        
    @Published private(set) var fetchCalled = false
    @Published private(set) var fetchImageCalled = false
    
    func fetch(
        session: URLSession
    ) throws -> [Appetizer] {
        fetchCalled = true
        throw AppetizerError.invalidURL
    }
    
    func fetchImage(
        session: URLSession,
        from urlString: String
    ) throws -> UIImage? {
        fetchImageCalled = true
        throw AppetizerError.invalidURL
    }
    
}

class MockNetworkClientThrowInvalidData: NetworkClientProtocol {
        
    @Published private(set) var fetchCalled = false
    @Published private(set) var fetchImageCalled = false
    
    func fetch(
        session: URLSession
    ) throws -> [Appetizer] {
        fetchCalled = true
        throw AppetizerError.invalidData
    }
    
    func fetchImage(
        session: URLSession,
        from urlString: String
    ) throws -> UIImage? {
        fetchImageCalled = true
        throw AppetizerError.invalidData
    }
    
}
