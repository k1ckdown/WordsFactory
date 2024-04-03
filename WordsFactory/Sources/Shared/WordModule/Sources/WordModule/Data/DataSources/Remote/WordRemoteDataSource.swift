//
//  WordRemoteDataSource.swift
//
//
//  Created by Ivan Semenov on 26.03.2024.
//

import NetworkingAPI

final class WordRemoteDataSource {

    private let networkService: NetworkServiceProtocol

    init(networkService: NetworkServiceProtocol) {
        self.networkService = networkService
    }
}

// MARK: - Public methods

extension WordRemoteDataSource {

    func fetchAll(by word: String) async throws -> [WordDefinitionDTO] {
        let networkConfig = WordNetworkConfig.list(word)
        return try await networkService.request(config: networkConfig)
    }
}
