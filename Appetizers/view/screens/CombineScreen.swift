//
//  CombineScreen.swift
//  Appetizers
//
//  Created by Tharin Zaman on 06/02/2024.
//
import SwiftUI
import MapKit

struct CombineScreen: View {
    
    @StateObject private var vm: AppetizerListViewModel
    
    private let network: NetworkClientProtocol
    
    init(
        network: NetworkClientProtocol
    ) {
        self.network = network
        _vm = StateObject(
            wrappedValue: AppetizerListViewModel(
                network: network
            )
        )
    }
    
    var body: some View {
        ScrollView {
            VStack {
                ForEach(
                    vm.appetizers
                ) { appetizer in
                    Text(
                        appetizer.name
                    )
                }
            }
        }
    }
}

