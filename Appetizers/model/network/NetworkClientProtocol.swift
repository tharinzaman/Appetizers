//
//  NetworkProtocol.swift
//  Appetizers
//
//  Created by Tharin Zaman on 11/01/2024.
//

import Foundation
import SwiftUI

protocol NetworkClientProtocol {
    func getAppetizers() async throws -> [Appetizer]
    func getImage(
        from urlString: String
    ) async throws -> UIImage?}
