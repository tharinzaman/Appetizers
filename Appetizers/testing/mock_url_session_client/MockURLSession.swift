//
//  MockURLSession.swift
//  AppetizersTests
//
//  Created by Tharin Zaman on 22/01/2024.
//

import Foundation

#if DEBUG
import Foundation
/**
This mock class simulates an API call where we make a request and get back a response and data.
We use it in order to test the network client.
*/
class MockURLSession: URLProtocol {
        
    static var loadingHandler: (() -> (HTTPURLResponse, Data?))?
    
    override class func canInit(with request: URLRequest) -> Bool {
        return true
    }
    
    override class func canonicalRequest(for request: URLRequest) -> URLRequest {
        return request
    }
    
    override func startLoading() {
        
        guard let handler = MockURLSession.loadingHandler else {
            fatalError("Loading handler is not set")
        }
        
        let (response, data) = handler()
        client?.urlProtocol(self, didReceive: response, cacheStoragePolicy: .notAllowed)
        if let data {
            client?.urlProtocol(self, didLoad: data)
        }
        client?.urlProtocolDidFinishLoading(self)
    }
    
    override func stopLoading() {
        
    }
}

#endif
