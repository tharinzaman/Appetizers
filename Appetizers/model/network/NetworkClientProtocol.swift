//
//  NetworkProtocol.swift
//  Appetizers
//
//  Created by Tharin Zaman on 11/01/2024.
//

import Foundation
import SwiftUI

protocol NetworkClientProtocol {
    func fetch(
        session: URLSession
    ) async throws -> [Appetizer]
    
    func fetchImage(
        session: URLSession,
        from urlString: String
    ) async throws -> UIImage?
}

protocol NetworkingManagerImpl {
    
    func request<T: Codable>() async throws -> T
    
    func requestImage<T:Codable>() async throws -> T
}

protocol NetworkingManager {
    
    associatedtype T
    associatedtype I
    
    func request() async throws -> T
    
    func requestImage() async throws -> I
}
