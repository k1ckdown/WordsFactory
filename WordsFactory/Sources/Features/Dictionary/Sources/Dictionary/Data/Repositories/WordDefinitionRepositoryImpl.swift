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

    func saveDefinitions(_ definitions: [WordDefinition]) throws {
        try localDataSource.saveDefinitions(definitions)
    }

    func deleteDefinitions(of word: String) throws {
        try localDataSource.deleteDefinitions(of: word)
    }

    func getDefinitionList(of word: String) async throws -> WordDefinitionList {
        do {
            return try await fetchRemoteDefinitionList(of: word)
        } catch NetworkError.requestFailed(.notFound, _) {
            return WordDefinitionList(isSaved: false, definitions: [])
        } catch NetworkError.notConnected {
            return try fetchLocalDefinitionList(of: word)
        } catch {
            throw error
        }
    }
}

// MARK: - Private methods

private extension WordDefinitionRepositoryImpl {

    func fetchLocalDefinitionList(of word: String) throws -> WordDefinitionList {
        let localDefinitions = try localDataSource.fetchDefinitionList(of: word)
        let isSaved = localDefinitions.isEmpty == false

        return WordDefinitionList(isSaved: isSaved, definitions: localDefinitions)
    }

    func fetchRemoteDefinitionList(of word: String) async throws -> WordDefinitionList {
        let dtoList = try await remoteDataSource.fetchDefinitionList(of: word)
        let localDefinitionList = try fetchLocalDefinitionList(of: word)
        let domainList = WordDefinitionMapper.toDomainList(dtoList)

        return WordDefinitionList(isSaved: localDefinitionList.isSaved, definitions: domainList)
    }
}
