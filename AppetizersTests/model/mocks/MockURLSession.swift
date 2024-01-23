//
//  MockURLSession.swift
//  AppetizersTests
//
//  Created by Tharin Zaman on 22/01/2024.
//

import Foundation
import XCTest

class MockURLSession: URLProtocol {
    
    static var loadingHandler: (() -> (HTTPURLResponse, Data))?
    
    override class func canInit(with request: URLRequest) -> Bool {
        return true
    }
    
    override class func canonicalRequest(for request: URLRequest) -> URLRequest {
        return request
    }
    
    override func startLoading() {
        
        guard let handler = MockURLSession.loadingHandler else {
            XCTFail("Loading handler is not set")
            return
        }
        
        let (response, data) = handler()
        client?.urlProtocol(self, didReceive: response, cacheStoragePolicy: .notAllowed)
    }
}
