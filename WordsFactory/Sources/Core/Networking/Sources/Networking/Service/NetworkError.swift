//
//  NetworkError.swift
//
//
//  Created by Ivan Semenov on 25.03.2024.
//

import Foundation

public enum NetworkError: Error {
    case timedOut
    case missingUrl
    case unauthorized
    case notConnected
    case decodingError
    case encodingError
    case methodNotAllowed
    case invalidResponse
    case unknown(Error)
    case requestFailed(HTTPStatusCode, Data)
}
