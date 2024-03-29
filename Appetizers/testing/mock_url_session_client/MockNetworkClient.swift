//
//  MockNetworkClientImpl.swift
//  AppetizersTests
//
//  Created by Tharin Zaman on 25/01/2024.
//

#if DEBUG
import Foundation
import SwiftUI

class MockNetworkClientSuccess: NetworkClientProtocol {
    
    private(set) var fetchCalled = false
    private(set) var fetchImageCalled = false
    
    func fetch(
        session: URLSession
    ) -> [Appetizer] {
        fetchCalled = true
        return StaticLoader.loadJSONFromFileReturnDecodedData(file: "MockNetworkResponse")
    }
    
    func fetchImage(
        session: URLSession,
        from urlString: String
    ) -> UIImage? {
        fetchImageCalled = true
        return StaticLoader.loadImageFromFileReturnUIImage(
            file: "AsianFlankSteak",
            fileExt: "jpg"
        )
    }
    
}

class MockNetworkClientThrowInvalidURL: NetworkClientProtocol {
    
    private(set) var fetchCalled = false
    private(set) var fetchImageCalled = false
    
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
    
    private(set) var fetchCalled = false
    private(set) var fetchImageCalled = false
    
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
#endif

