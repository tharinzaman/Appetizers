//
//  StaticJSONMapper.swift
//  AppetizersTests
//
//  Created by Tharin Zaman on 18/01/2024.
//

import Foundation
@testable import Appetizers
import XCTest
import SwiftUI

struct StaticLoader {
    
    static func loadJSONFromFileReturnData(
        file: String
    ) -> Data? {
        guard let path = Bundle.main.path(
            forResource: file,
            ofType: "json"
        ) else {
            XCTFail(
                "Failed to get path"
            )
            return nil
        }
        guard let data = FileManager.default.contents(
            atPath: path
        ) else {
            XCTFail(
                "Failed to get data"
            )
            return nil
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
            XCTFail(
                "Failed to get path"
            )
            return []
        }
        
        guard let data = FileManager.default.contents(
            atPath: path
        ) else {
            XCTFail(
                "Failed to get data"
            )
            return []
        }
        
        do {
            return try JSONDecoder().decode(
                AppetizerResponse.self,
                from: data
            ).request
        } catch {
            XCTFail(
                "Failed to get array"
            )
            return []
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
            XCTFail(
                "Failed to get path"
            )
            return nil
        }
        guard let data = FileManager.default.contents(
            atPath: path
        ) else {
            XCTFail(
                "Failed to get data"
            )
            return nil
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
            XCTFail(
                "Failed to get path"
            )
            return nil
        }
        guard let data = FileManager.default.contents(
            atPath: path
        ) else {
            XCTFail(
                "Failed to get data"
            )
            return nil
        }
        guard let image = UIImage(
            data: data
        ) else {
            XCTFail(
                "Failed to get image"
            )
            return nil
        }
        return image
    }
    
}
