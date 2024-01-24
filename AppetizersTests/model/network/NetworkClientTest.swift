//
//  AppetizerNetworkProtocolTest.swift
//  AppetizersTests
//
//  Created by Tharin Zaman on 15/01/2024.
//

import XCTest
@testable import Appetizers

final class NetworkClientTest: XCTestCase {
    
    private var session: URLSession!
    private var jsonUrl: URL!
    private var imageUrl: URL!

    
    private var client = NetworkClientImpl()
    
    override func setUp() {
        jsonUrl = URL(
            string: "https://reqres.in/users"
        )
        imageUrl = URL(
            string: "https://seanallen-course-backend.herokuapp.com//images//appetizers//asian-flank-steak.jpg"
        )
        let configuration = URLSessionConfiguration.ephemeral
        configuration.protocolClasses = [MockURLSession.self]
        session = URLSession(
            configuration: configuration
        )
    }
    
    override func tearDown() {
        session = nil
        jsonUrl = nil
        imageUrl = nil
    }
    
    func test_makeANetworkRequest_successfulResponse() async throws {
        // ASSIGN
        let data = StaticLoader.loadJSONFromFileReturnData(
            file: "MockNetworkResponse"
        )
        MockURLSession.loadingHandler = {
            let response = HTTPURLResponse(
                url: self.jsonUrl,
                statusCode: 200,
                httpVersion: nil,
                headerFields: nil
            )
            return (
                response!,
                data
            )
        }
        let expectedResult = try StaticLoader.loadJSONFromFileReturnDecodedData(
            file: "MockNetworkResponse"
        )
        // ACT
        let result = try await client.fetch(
            session: self.session
        )
        // ASSERT
        XCTAssertEqual(
            result,
            expectedResult,
            "The returned response should be decoded should be decoded properly"
        )
    }
    
    // This is on the border of being a UI test
    func test_makeANetworkRequestForImage_successfulResponse() async throws {
        // ASSIGN
        let data = StaticLoader.loadImageFromFileReturnData(
            file: "AsianFlankSteak",
            fileExt: "jpg"
        )
        MockURLSession.loadingHandler = {
            let response = HTTPURLResponse(
                url: self.imageUrl,
                statusCode: 200,
                httpVersion: nil,
                headerFields: nil
            )
            return (
                response!,
                data
            )
        }
        let expectedResult: UIImage? = try StaticLoader.loadImageFromFileReturnUIImage(
            file: "AsianFlankSteak",
            fileExt: "jpg"
        )
        // ACT
        let result: UIImage? = try await client.fetchImage(
            from: self.imageUrl.absoluteString
        )
        // ASSERT
        XCTAssertEqual(
            expectedResult?.images,
            result?.images
        )
    }
}
