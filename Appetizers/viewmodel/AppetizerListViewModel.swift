//
//  AppetizerListViewModel.swift
//  Appetizers
//
//  Created by Tharin Zaman on 19/12/2023.
//

import Foundation
import SwiftUI

final class AppetizerListViewModel: ObservableObject {
    
    private let network: NetworkClientProtocol
    
    init(network: NetworkClientProtocol) {
        self.network = network
    }
    
    @Published var appetizers: [Appetizer] = []
    @Published var alertItem: AlertItem? = nil
    @Published var areAppetizersLoading: Bool = false
    @Published var shouldShowDetail = false
    @Published var selectedAppetizer: Appetizer? = nil
        
    @MainActor
    func getAppetizers() async {
        areAppetizersLoading = true
//        Task {
            do {
                appetizers = try await network.fetch(session: .shared)
                areAppetizersLoading = false
            } catch {
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
//        }
    }
}
