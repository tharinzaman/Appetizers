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
        image?.resizable() ?? Image("cheeseburger").resizable()
    }
}

struct AppetizerRemoteImage: View {
    
    @StateObject var viewModel = ImageLoaderViewModel()
    let urlString: String
    
    var body: some View {
        RemoteImage(image: viewModel.image)
            .onAppear {
                viewModel.load(from: urlString)
            }
    }
}
