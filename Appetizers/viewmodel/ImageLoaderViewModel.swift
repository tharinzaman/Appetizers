//
//  ImageLoaderViewModel.swift
//  Appetizers
//
//  Created by Tharin Zaman on 19/12/2023.
//

import SwiftUI

final class ImageLoaderViewModel: ObservableObject {
    
    @Published var image: Image? = nil
    
    private let network: NetworkClientProtocol
    
    init(network: NetworkClientProtocol) {
        self.network = network
    }
        
//    func load(
//        from urlString: String
//    ) {
//        network.getImage(
//            fromURLString: urlString
//        ) { uiImage in
//            guard let uiImage else {
//                return
//            }
//            DispatchQueue.main.async {
//                self.image = Image(
//                    uiImage: uiImage
//                )
//            }
//        }
//    }
    
    func load(from urlString: String) {
        Task {
            do {
                let downloadedImage = try await network.fetchImage(session: .shared, from: urlString)
                guard let downloadedImage else {
                    return
                }
                self.image = Image(uiImage: downloadedImage)
            } catch {
                print("Unable to download image")
            }
        }
    }
}
