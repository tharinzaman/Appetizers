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
        _viewModel = StateObject(
            wrappedValue: AppetizerListViewModel(
                network: network
            )
        )
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
                }.navigationTitle(
                    "🍟 Appetizers"
                )
                .listStyle(
                    .plain
                )
                .disabled(
                    viewModel.shouldShowDetail
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
                )
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
