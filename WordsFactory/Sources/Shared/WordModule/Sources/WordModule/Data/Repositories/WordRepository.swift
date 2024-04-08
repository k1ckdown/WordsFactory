//
//  WordRepository.swift
//
//
//  Created by Ivan Semenov on 26.03.2024.
//

import NetworkingAPI
import WordModuleAPI

final class WordRepository {

    private let localDataSource: WordLocalDataSource
    private let remoteDataSource: WordRemoteDataSource

    init(localDataSource: WordLocalDataSource, remoteDataSource: WordRemoteDataSource) {
        self.localDataSource = localDataSource
        self.remoteDataSource = remoteDataSource
    }
}

// MARK: - WordRepository

extension WordRepository: WordRepositoryProtocol {

    func saveDictionary(_ word: Word) async throws {
        try await localDataSource.saveDictionary(word)
    }

    func removeDictionary(by text: String) async throws {
        try await localDataSource.removeDictionary(by: text)
    }

    func getAllDictionary() async throws -> [DictionaryWord] {
        try await localDataSource.fetchAllDictionary()
    }

    func updateStudyCoefficient(_ coefficient: Int, of wordText: String) async throws {
        try await localDataSource.updateStudyCoefficient(coefficient, of: wordText)
    }

    func get(by text: String) async throws -> Word? {
        do {
            return try await fetchRemoteWord(by: text)
        } catch NetworkError.requestFailed(.notFound, _) {
            return nil
        } catch NetworkError.notConnected {
            return try await fetchLocalWord(by: text)
        } catch {
            throw error
        }
    }
}

// MARK: - Private methods

private extension WordRepository {

    func fetchLocalWord(by text: String) async throws -> Word? {
        try await localDataSource.fetch(by: text)
    }

    func fetchRemoteWord(by text: String) async throws -> Word? {
        let isDictionary = try await localDataSource.fetch(by: text) != nil
        let remoteDefinitions = try await remoteDataSource.fetchAll(by: text)

        return remoteDefinitions.toWord(isDictionary: isDictionary)
    }
}
