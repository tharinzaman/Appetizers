//
//  NetworkManager.swift
//  Appetizers
//
//  Created by Tharin Zaman on 19/12/2023.
//

import Foundation
import UIKit
import Combine

final class NetworkClientImpl: NetworkClientProtocol {
    
    static let instance = NetworkClientImpl(decoder: JSONDecoder())
    
    private let cache = NSCache<
        NSString,
        UIImage
    >()
    
    static let baseURL = "https://seanallen-course-backend.herokuapp.com/swiftui-fundamentals/"
    private let appetizerURL = baseURL + "appetizers"
    
    private let decoder: JSONDecoder
        
    init(decoder: JSONDecoder) {
        self.decoder = decoder
    }
    
    //    func getAppetizers(
    //        completed: @escaping (
    //            Result<
    //            [Appetizer],
    //            AppetizerError
    //            >
    //        ) -> Void
    //    ) {
    //
    //        guard let url = URL(
    //            string: appetizerURL
    //        ) else {
    //            completed(
    //                .failure(
    //                    .invalidURL
    //                )
    //            )
    //            return
    //        }
    //
    //        let task = URLSession.shared.dataTask(
    //            with: URLRequest(
    //                url: url
    //            )
    //        ) {
    //            data,
    //            response,
    //            error in
    //
    //            guard error == nil else {
    //                completed(
    //                    .failure(
    //                        .unableToComplete
    //                    )
    //                )
    //                return
    //            }
    //
    //            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
    //                completed(
    //                    .failure(
    //                        .invalidResponse
    //                    )
    //                )
    //                return
    //            }
    //
    //            guard let data = data else {
    //                completed(
    //                    .failure(
    //                        .invalidData
    //                    )
    //                )
    //                return
    //            }
    //
    //            do {
    //                let decoder = JSONDecoder()
    //                let decodedResponse = try decoder.decode(
    //                    AppetizerResponse.self,
    //                    from: data
    //                )
    //                completed(
    //                    .success(
    //                        decodedResponse.request
    //                    )
    //                )
    //            } catch {
    //                completed(
    //                    .failure(
    //                        .invalidData
    //                    )
    //                )
    //            }
    //        }
    //        task.resume()
    //
    //    }
    
    func fetchWithCombine() throws -> AnyPublisher<AppetizerResponse, Error>{
        guard let url = URL(string: appetizerURL) else {
            throw URLError(.badURL)
        }
        return URLSession
            .shared
            .dataTaskPublisher(for: url)
            .map( {$0.data} )
            .decode(type: AppetizerResponse.self, decoder: decoder)
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
    
    
    func fetch(
        session: URLSession = .shared
    ) async throws -> [Appetizer] {
        
        guard let url = URL(
            string: appetizerURL
        ) else {
            throw AppetizerError.invalidURL
        }
        
        let (
            data,
            _
        ) = try await session.data(
            from: url
        )
        
        do {
            return try decoder.decode(
                AppetizerResponse.self,
                from: data
            ).request
        } catch {
            throw AppetizerError.invalidData
        }
    }
    
    func fetchImage(
        session: URLSession = .shared,
        from urlString: String
    ) async throws -> UIImage? {
        
        let cacheKey = NSString(
            string: urlString
        )
        // Check if we have already downloaded the image
        if let savedImage = cache.object(
            forKey: cacheKey
        ) {
            return savedImage
        }
        
        guard let url = URL(
            string: urlString
        ) else {
            throw AppetizerError.invalidURL
        }
        
        let(
            data,
            _
        ) = try await session.data(
            from: url
        )
        
        guard let image = UIImage(
            data: data
        ) else {
            throw AppetizerError.invalidData
        }
        
        self.cache.setObject(
            image,
            forKey: cacheKey
        )
        
        return image
    }
    
    //    func getImage(
    //        fromURLString urlString: String,
    //        completed: @escaping (
    //            UIImage?
    //        ) -> Void
    //    ) {
    //        let cacheKey = NSString(
    //            string: urlString
    //        )
    //
    //        // Check if we have already downloaded the image
    //        if let image = cache.object(
    //            forKey: cacheKey
    //        ) {
    //            completed(
    //                image
    //            )
    //            return
    //        }
    //
    //        guard let url = URL(
    //            string: urlString
    //        ) else {
    //            completed(
    //                nil
    //            )
    //            return
    //        }
    //
    //        let task = URLSession.shared.dataTask(
    //            with: URLRequest(
    //                url: url
    //            )
    //        ) {
    //            data,
    //            response,
    //            error in
    //
    //            guard let data, let image = UIImage(
    //                data: data
    //            ) else {
    //                completed(
    //                    nil
    //                )
    //                return
    //            }
    //
    //            // Save image to cache so we don't have to download it again
    //            self.cache.setObject(
    //                image,
    //                forKey: cacheKey
    //            )
    //            completed(
    //                image
    //            )
    //
    //        }
    //        task.resume()
    //    }
    
}
