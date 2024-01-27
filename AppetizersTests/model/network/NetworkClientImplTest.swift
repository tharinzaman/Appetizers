//
//  AppetizerNetworkProtocolTest.swift
//  AppetizersTests
//
//  Created by Tharin Zaman on 15/01/2024.
//

import XCTest
@testable import Appetizers

final class NetworkClientImplTest: XCTestCase {
    
    private var session: URLSession!
    private var jsonUrl: URL!
    private var imageUrl: URL!

    
    private var client = NetworkClientImpl()
    
    override func setUp() {
        jsonUrl = URL(
            string: "https://seanallen-course-backend.herokuapp.com//images//appetizers"
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
        setUpLoadingHandlerWithJSON()
        let expectedResult = StaticLoader.loadJSONFromFileReturnDecodedData(
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

    // For some reason the test isn't throwing the error
    func test_makeANetworkRequest_failure_invalidData() async {
        // ASSIGN
        // Intentionally use wrong type of data
        setUpLoadingHandlerWithImage()
        // ACT
        do {
            _ = try await client.fetch(
                session: self.session
            )
            print("No exception thrown")
        } catch {
            guard let appetizerError = error as? AppetizerError else {
                XCTFail(
                    "Wrong type of error"
                )
                return
            }
            print(
                "Exception has been caught"
            )
            // ASSERT
            XCTAssertEqual(
                appetizerError,
                AppetizerError.invalidData
            )
        }
    }
    
    func test_makeANetworkRequestForImage_successfulResponse() async throws {
        // ASSIGN
        setUpLoadingHandlerWithImage()
        let expectedResult: UIImage? = StaticLoader.loadImageFromFileReturnUIImage(
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
    
    func test_makeANetworkRequestForImage_failure_invalidURL() async {
        // ASSIGN
        setUpLoadingHandlerWithImage()
        // ACT
        do {
            _ = try await client.fetchImage(
                session: self.session,
                from: ""
            )
        } catch {
            // ASSERT
            guard let appetizerError = error as? AppetizerError else {
                XCTFail(
                    "Wrong type of error"
                )
                return
            }
            print(
                "Exception has been caught"
            )
            XCTAssertEqual(
                appetizerError,
                AppetizerError.invalidURL
            )
        }
    }
    
    func test_makeANetworkRequestForImage_failure_invalidData() async {
        // ASSIGN
        // We are intentionally setting it up with the wrong kind of data
        setUpLoadingHandlerWithJSON()
        // ACT
        do {
            _ = try await client.fetchImage(
                session: self.session,
                from: self.imageUrl.absoluteString
            )
        } catch {
            guard let appetizerError = error as? AppetizerError else {
                XCTFail(
                    "Wrong type of error"
                )
                return
            }
            print(
                "Exception has been caught"
            )
            // ASSERT
            XCTAssertEqual(
                appetizerError,
                AppetizerError.invalidData
            )
        }
    }
    
    private func setUpLoadingHandlerWithJSON() {
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
    }
    
    private func setUpLoadingHandlerWithImage() {
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
    }
}
