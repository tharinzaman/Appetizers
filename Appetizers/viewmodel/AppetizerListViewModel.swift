//
//  AppetizerListViewModel.swift
//  Appetizers
//
//  Created by Tharin Zaman on 19/12/2023.
//

import Foundation
import SwiftUI

@MainActor final class AppetizerListViewModel: ObservableObject {
    
    private let network: NetworkClientProtocol
    
    init(network: NetworkClientProtocol) {
        self.network = network
    }
    
    @Published var appetizers: [Appetizer] = []
    @Published var alertItem: AlertItem? = nil
    @Published var areAppetizersLoading: Bool = false
    @Published var shouldShowDetail = false
    @Published var selectedAppetizer: Appetizer? = nil
    
    func getAppetizers() {
        areAppetizersLoading = true
        Task {
            do {
                appetizers = try await network.fetch(session: .shared)
                areAppetizersLoading = false
            } catch {
                // Following line checks that it's a specific error and not one thrown by Swift.
                if let appetizerError = error as? AppetizerError {
                    alertItem = switch appetizerError {
                    case .invalidData: ErrorAlertItems.invalidData
                    case .invalidResponse: ErrorAlertItems.invalidResponse
                    case .invalidURL: ErrorAlertItems.invalidURL
                    case .unableToComplete: ErrorAlertItems.unableToComplete
                    }
                } else {
                    alertItem = ErrorAlertItems.unableToComplete
                }
                areAppetizersLoading = false
            }
        }
    }
}
