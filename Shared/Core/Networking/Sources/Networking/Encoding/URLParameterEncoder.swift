//
//  URLParameterEncoder.swift
//
//
//  Created by Ivan Semenov on 24.03.2024.
//

import Foundation
import NetworkingAPI

enum URLParameterEncoder {

    static func encode(_ url: URL, parameters: Parameters) throws -> URL {
        guard var components = URLComponents(url: url, resolvingAgainstBaseURL: false) else {
            throw NetworkError.encodingError
        }

        let queryItems = parameters.reduce(into: [URLQueryItem]()) { partialResult, parameter in
            let item = URLQueryItem(
                name: parameter.key,
                value: "\(parameter.value)".addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
            )

            partialResult.append(item)
        }

        components.queryItems = queryItems
        guard let modifiedUrl = components.url else { throw NetworkError.encodingError }
        return modifiedUrl
    }
}
