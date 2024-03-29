//
//  NetworkServiceImpl.swift
//
//
//  Created by Ivan Semenov on 24.03.2024.
//

import Foundation
import NetworkingAPI

public final class NetworkServiceImpl {

    private let encoder = JSONEncoder()
    private let decoder = JSONDecoder()

    public init() {}
}

// MARK: - NetworkService

extension NetworkServiceImpl: NetworkService {

    public func request(config: NetworkConfig) async throws {
        try await makeRequest(config: config)
    }

    public func request<T: Decodable>(config: NetworkConfig) async throws -> T {
        let data = try await makeRequest(config: config)
        return try decode(data: data)
    }
}

// MARK: - Private methods

private extension NetworkServiceImpl {

    typealias DataRequestResponse = (data: Data, urlResponse: URLResponse)

    func decode<T: Decodable>(data: Data) throws -> T {
        guard let model = try? decoder.decode(T.self, from: data) else {
            throw NetworkError.decodingError
        }

        return model
    }

    func resolve(error: Error) -> NetworkError {
        let code = URLError.Code(rawValue: (error as NSError).code)

        return switch code {
        case .timedOut: .timedOut
        case .notConnectedToInternet: .notConnected
        case .userAuthenticationRequired: .unauthorized
        default: .unknown(error)
        }
    }

    func handleResponse(_ response: DataRequestResponse) throws {
        guard let httpResponse = response.urlResponse as? HTTPURLResponse else {
            throw NetworkError.invalidResponse
        }

        guard Constants.successfulCodes.contains(httpResponse.statusCode) else {
            if let statusCode = HTTPStatusCode(rawValue: httpResponse.statusCode) {
                throw NetworkError.requestFailed(statusCode, response.data)
            }

            throw NetworkError.invalidResponse
        }
    }

    @discardableResult
    func makeRequest(config: NetworkConfig) async throws -> Data {
        let request = try buildRequest(config: config)
        let response: DataRequestResponse

        do {
            response = try await URLSession.shared.data(for: request)
        } catch {
            throw resolve(error: error)
        }

        try handleResponse(response)
        return response.data
    }

    func buildRequest(config: NetworkConfig) throws -> URLRequest {
        let urlString = config.path + config.endpoint
        guard let url = URL(string: urlString) else { throw NetworkError.missingUrl }

        var request = URLRequest(url: url)
        switch config.task {
        case .request: break

        case .requestBody(let data):
            guard config.method == .post || config.method == .put else {
                throw NetworkError.methodNotAllowed
            }
            request.httpBody = data

        case .requestParameters(let parameters):
            request.url = try URLParameterEncoder.encode(url, parameters: parameters)
        }

        request.httpMethod = config.method.rawValue
        request.setValue(Constants.jsonContentType, forHTTPHeaderField: Constants.contentTypeHeader)

        return request
    }
}

// MARK: - Constants

private extension NetworkServiceImpl {

    enum Constants {
        static let successfulCodes = 200...299
        static let contentTypeHeader = "Content-Type"
        static let jsonContentType = "application/json"
    }
}
