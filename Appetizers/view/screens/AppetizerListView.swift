//
//  AppetizerListView.swift
//  Appetizers
//
//  Created by Tharin Zaman on 18/12/2023.
//
import SwiftUI

struct AppetizerListView: View {
    
    let network: NetworkClientProtocol
    
    @StateObject var viewModel: AppetizerListViewModel
    
    init(
        network: NetworkClientProtocol
    ) {
        self.network = network
#if DEBUG
        let mockNetworkClient: NetworkClientProtocol = UITestingHelper.networkingSuccess ? MockNetworkClientSuccess() : MockNetworkClientThrowInvalidURL()
        _viewModel = StateObject(
            wrappedValue: AppetizerListViewModel(
                network: UITestingHelper.isUITest ? mockNetworkClient : network
            )
        )
#else
        _viewModel = StateObject(
            wrappedValue: AppetizerListViewModel(
                network: network
            )
        )
#endif
    }
    
    var body: some View {
        ZStack {
            NavigationStack {
                List(
                    viewModel.appetizers
                ) { appetizer in
                    AppetizerCell(
                        network: network,
                        appetizer: appetizer
                    )
                    .onTapGesture {
                        viewModel.shouldShowDetail = true
                        viewModel.selectedAppetizer = appetizer
                    }
                    .accessibilityIdentifier("item_\(appetizer.id)")
                }.navigationTitle(
                    "🍟 Appetizers"
                )
                .listStyle(
                    .plain
                )
                .disabled(
                    viewModel.shouldShowDetail
                )
                .accessibilityIdentifier(
                    "appetizer-list"
                )
            }
            .task {
                await viewModel.getAppetizers()
            }
            .blur(
                radius: viewModel.shouldShowDetail ? 20 : 0
            )
            if viewModel.shouldShowDetail {
                DetailView(
                    shouldShowDetail: $viewModel.shouldShowDetail,
                    appetizer: viewModel.selectedAppetizer ?? MockData.sampleAppetizer,
                    network: network
                ).accessibilityIdentifier("detail-view")
            }
            if viewModel.areAppetizersLoading {
                LoadingView()
            }
        }.alert(
            item: $viewModel.alertItem
        ) { alertItem in
            Alert(
                title: alertItem.title,
                message: alertItem.message,
                dismissButton: alertItem.dismissButton
            )
        }
    }
}
