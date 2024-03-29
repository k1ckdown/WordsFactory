//
//  NetworkService.swift
//
//
//  Created by Ivan Semenov on 29.03.2024.
//

public protocol NetworkService {
    func request(config: NetworkConfig) async throws
    func request<T: Decodable>(config: NetworkConfig) async throws -> T
}
