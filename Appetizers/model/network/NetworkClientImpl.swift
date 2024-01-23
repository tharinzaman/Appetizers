//
//  NetworkManager.swift
//  Appetizers
//
//  Created by Tharin Zaman on 19/12/2023.
//

import Foundation
import UIKit

final class NetworkClientImpl: NetworkClientProtocol {
        
    private let cache = NSCache<
        NSString,
        UIImage
    >()
    
    static let baseURL = "https://seanallen-course-backend.herokuapp.com/swiftui-fundamentals/"
    private let appetizerURL = baseURL + "appetizers"

    
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
    
    func fetch() async throws -> [Appetizer] {
        
        guard let url = URL(
            string: appetizerURL
        ) else {
            throw AppetizerError.invalidURL
        }
        
        let (
            data,
            response
        ) = try await URLSession.shared.data(
            from: url
        )
        
        // TODO: Add in guard statement to check URL response is 200 OK else throw error
        
//        guard let object : [T] = try? JSONDecoder().decode([T].self, from: data) else {
//            throw AppetizerError.invalidData
//        }
//        return object
        do {
            let decoder = JSONDecoder()
            return try decoder.decode(
                AppetizerResponse.self,
                from: data
            ).request.self
        } catch {
            throw AppetizerError.invalidData
        }
    }
    
    func fetchImage(
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
            return nil
        }
        
        let(
            data,
            _
        ) = try await URLSession.shared.data(
            from: url
        )
        
        guard let image = UIImage(
            data: data
        ) else {
            throw AppetizerError.unableToComplete
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