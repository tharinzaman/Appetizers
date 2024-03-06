//
//  AppetizerListViewModel.swift
//  Appetizers
//
//  Created by Tharin Zaman on 19/12/2023.
//

import Foundation
import SwiftUI
import Combine

final class AppetizerListViewModel: ObservableObject {
        
    private let network: NetworkClientProtocol
    
    private var cancellables = Set<AnyCancellable>()
    
    init(network: NetworkClientProtocol) {
        self.network = network
        getAppetizersWithCombine()
    }
    
    @Published var appetizers: [Appetizer] = []
    @Published var alertItem: AlertItem? = nil
    @Published var areAppetizersLoading: Bool = false
    @Published var shouldShowDaetail = false
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
    
    private func getAppetizersWithCombine() {
        do {
            try NetworkClientImpl.instance.fetchWithCombine()
                .sink { completion in
                    switch completion {
                    case .finished:
                        print("Finished")
                    case .failure(let error):
                        print("ERROR: \(error.localizedDescription)")
                    }
                } receiveValue: { [weak self] appetizers in
                    self?.appetizers = appetizers.request
                }
                .store(in: &cancellables)
        } catch {
            print("Error: \(error)")
        }
    }
}

