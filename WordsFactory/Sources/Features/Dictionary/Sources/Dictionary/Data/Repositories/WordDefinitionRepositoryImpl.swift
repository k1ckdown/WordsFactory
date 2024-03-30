//
//  WordDefinitionRepositoryImpl.swift
//
//
//  Created by Ivan Semenov on 26.03.2024.
//

import NetworkingAPI

final class WordDefinitionRepositoryImpl {

    private let localDataSource: WordDefinitionLocalDataSource
    private let remoteDataSource: WordDefinitionRemoteDataSource

    init(localDataSource: WordDefinitionLocalDataSource, remoteDataSource: WordDefinitionRemoteDataSource) {
        self.localDataSource = localDataSource
        self.remoteDataSource = remoteDataSource
    }
}

// MARK: - WordDefinitionRepository

extension WordDefinitionRepositoryImpl: WordDefinitionRepository {

    func saveDefinition(_ definition: WordDefinition) throws {
        try localDataSource.saveDefinition(definition)
    }

    func getDefinitionList(of word: String) async throws -> [WordDefinition] {
        do {
            return try await fetchRemoteDefinitions(of: word)
        } catch NetworkError.requestFailed(.notFound, _) {
            return []
        } catch NetworkError.notConnected {
            return try localDataSource.fetchDefinitionList(of: word)
        } catch {
            throw error
        }
    }
}

// MARK: - Private methods

private extension WordDefinitionRepositoryImpl {

    func fetchRemoteDefinitions(of word: String) async throws -> [WordDefinition] {
        let dtoList = try await remoteDataSource.fetchDefinitionList(of: word)
        return WordDefinitionMapper.toDomainList(dtoList)
    }
}
