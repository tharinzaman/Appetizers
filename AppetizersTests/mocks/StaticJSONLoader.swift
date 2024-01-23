//
//  StaticJSONMapper.swift
//  AppetizersTests
//
//  Created by Tharin Zaman on 18/01/2024.
//

import Foundation
@testable import Appetizers

struct StaticJSONLoader {
    
    static func loadJSONFromFile(
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
}
