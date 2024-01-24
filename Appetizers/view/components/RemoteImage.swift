//
//  RemoteImage.swift
//  Appetizers
//
//  Created by Tharin Zaman on 19/12/2023.
//

import SwiftUI

struct RemoteImage: View {
    var image: Image?
    var body: some View {
        image?.resizable() ?? Image(
            "cheeseburger"
        ).resizable()
    }
}

struct AppetizerRemoteImage: View {
    
    @StateObject var viewModel: ImageLoaderViewModel
    let urlString: String
    
    init(
        network: NetworkClientProtocol,
        urlString: String
    ) {
        _viewModel = StateObject(
            wrappedValue: ImageLoaderViewModel(
                network: network
            )
        )
        self.urlString = urlString
    }
        
    var body: some View {
        RemoteImage(
            image: viewModel.image
        )
        .onAppear {
            viewModel.load(
                from: urlString
            )
            }
        // Use AsyncImage if caching isn't important
//        AsyncImage(url: URL(string: urlString)) { image in
//            image
//                .resizable()
//                .aspectRatio(contentMode: .fit)
//                .frame(width: 120, height: 90)
//                .cornerRadius(8)
//        } placeholder: {
//            Image("cheeseburger")
//                .resizable()
//                .aspectRatio(contentMode: .fit)
//                .frame(width: 120, height: 90)
//                .cornerRadius(8)
//        }
    }
}
