//
//  StaticJSONMapper.swift
//  AppetizersTests
//
//  Created by Tharin Zaman on 18/01/2024.
//

import Foundation
@testable import Appetizers
import XCTest

struct StaticLoader {
    
    static func loadJSONFromFileReturnDecodedData(
        file: String
    ) throws -> [Appetizer] {
        
        guard let path = Bundle.main.path(
            forResource: file,
            ofType: "json"
        ) else {
            throw AppetizerError.invalidURL
        }
        
        guard let data = FileManager.default.contents(atPath: path) else {
            throw AppetizerError.invalidData
        }
        
        do {
            return try JSONDecoder().decode(
                AppetizerResponse.self,
                from: data
            ).request
        } catch {
            throw AppetizerError.unableToComplete
        }
    }
    
    static func loadJSONFromFileReturnData(
        file: String
    ) -> Data? {
        guard let path = Bundle.main.path(
            forResource: file,
            ofType: "json") else {
            XCTFail("Failed to get path")
            return nil
        }
        guard let data = FileManager.default.contents(atPath: path) else {
            XCTFail("Failed to get data")
            return nil
        }
        return data
    }
}
