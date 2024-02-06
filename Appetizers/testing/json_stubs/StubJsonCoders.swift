//
//  MockJsonCoders.swift
//  AppetizersTests
//
//  Created by Tharin Zaman on 29/01/2024.
//

#if DEBUG
import Foundation

final class StubEncoderSuccess: JSONEncoder {
    override func encode<T: Encodable>(
        _ value: T
    ) throws -> Data {
        return Data()
    }
}

final class StubEncoderFailure: JSONEncoder {
    override func encode<T: Encodable>(
        _ value: T
    ) throws -> Data {
        throw AppetizerError.invalidData
    }
}

final class StubDecoderSuccess: JSONDecoder {
    override func decode<T: Decodable>(
        _ type: T.Type,
        from data: Data
    ) throws -> T {
        return User(
            firstName: "Tharin",
            lastName: "Zaman",
            email: "tharinzaman@hotmail.com"
        ) as! T
    }
}

final class StubDecoderFailure: JSONDecoder {
    override func decode<T: Decodable>(
        _ type: T.Type,
        from data: Data
    ) throws -> T {
        throw AppetizerError.invalidData
    }
}

#endif
