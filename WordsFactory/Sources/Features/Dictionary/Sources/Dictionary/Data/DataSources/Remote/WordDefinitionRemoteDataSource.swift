//
//  WordDefinitionRemoteDataSource.swift
//
//
//  Created by Ivan Semenov on 26.03.2024.
//

import NetworkingAPI

final class WordDefinitionRemoteDataSource {

    private let networkService: NetworkService

    init(networkService: NetworkService) {
        self.networkService = networkService
    }
}

// MARK: - Public methods

extension WordDefinitionRemoteDataSource {

    func fetchDefinitionList(of word: String) async throws -> [WordDefinitionDTO] {
        let networkConfig = WordDefinitionNetworkConfig.list(word)
        return try await networkService.request(config: networkConfig)
    }
}
