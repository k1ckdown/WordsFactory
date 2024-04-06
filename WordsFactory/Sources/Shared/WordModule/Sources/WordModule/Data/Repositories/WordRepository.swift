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

    func saveDictionary(_ word: Word) throws {
        try localDataSource.saveDictionary(word)
    }

    func removeDictionary(by text: String) throws {
        try localDataSource.removeDictionary(by: text)
    }

    func updateStudyCoefficient(_ coefficient: Int, of word: String) throws {
        try localDataSource.updateStudyCoefficient(coefficient, of: word)
    }

    func getAllDictionary() throws -> [DictionaryWord] {
        let localWords = try localDataSource.fetchAllDictionary()
        return localWords.map { $0.toDomainDictionary() }
    }

    func get(by text: String) async throws -> Word? {
        do {
            return try await fetchRemoteWord(by: text)
        } catch NetworkError.requestFailed(.notFound, _) {
            return nil
        } catch NetworkError.notConnected {
            return try fetchLocalWord(by: text)
        } catch {
            throw error
        }
    }
}

// MARK: - Private methods

private extension WordRepository {

    func fetchLocalWord(by text: String) throws -> Word? {
        let localWord = try localDataSource.fetch(by: text)
        return localWord?.toDomain()
    }

    func fetchRemoteWord(by text: String) async throws -> Word? {
        let isDictionary = try localDataSource.fetch(by: text) != nil
        let remoteDefinitions = try await remoteDataSource.fetchAll(by: text)

        return remoteDefinitions.toWord(isDictionary: isDictionary)
    }
}