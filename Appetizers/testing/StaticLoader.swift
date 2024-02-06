//
//  StaticJSONMapper.swift
//  AppetizersTests
//
//  Created by Tharin Zaman on 18/01/2024.
//

#if DEBUG
import Foundation
import SwiftUI

struct StaticLoader {
    
    static func loadJSONFromFileReturnData(
        file: String
    ) -> Data? {
        guard let path = Bundle.main.path(
            forResource: file,
            ofType: "json"
        ) else {
            fatalError("Invalid path")
        }
        guard let data = FileManager.default.contents(
            atPath: path
        ) else {
            fatalError("No data for path")
        }
        return data
    }
    
    static func loadJSONFromFileReturnDecodedData(
        file: String
    ) -> [Appetizer] {
        
        guard let path = Bundle.main.path(
            forResource: file,
            ofType: "json"
        ) else {
            fatalError("Invalid path")
        }
        
        guard let data = FileManager.default.contents(
            atPath: path
        ) else {
            fatalError("No data for path")
        }
        
        do {
            return try JSONDecoder().decode(
                AppetizerResponse.self,
                from: data
            ).request
        } catch {
            fatalError("Invalid data")
        }
    }
    
    static func loadImageFromFileReturnData(
        file: String,
        fileExt type: String
    ) -> Data? {
        guard let path = Bundle.main.path(
            forResource: file,
            ofType: type
        ) else {
            fatalError("Invalid path")
        }
        guard let data = FileManager.default.contents(
            atPath: path
        ) else {
            fatalError("No data for path")
        }
        return data
    }
    
    static func loadImageFromFileReturnUIImage(
        file: String,
        fileExt type: String
    ) -> UIImage? {
        guard let path = Bundle.main.path(
            forResource: file,
            ofType: type
        ) else {
            fatalError("Invalid path")
        }
        guard let data = FileManager.default.contents(
            atPath: path
        ) else {
            fatalError("No data for path")
        }
        guard let image = UIImage(
            data: data
        ) else {
            fatalError("Invalid data")
        }
        return image
    }
    
}
#endif
