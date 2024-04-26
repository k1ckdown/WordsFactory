//
//  WordRepository.swift
//
//
//  Created by Ivan Semenov on 26.03.2024.
//

import NetworkingAPI
import DictionaryDomain

final class WordRepository {

    private let userIdProvider: UserIdProvider
    private let localDataSource: WordLocalDataSource
    private let remoteDataSource: WordRemoteDataSource

    init(
        userIdProvider: @escaping UserIdProvider,
        localDataSource: WordLocalDataSource,
        remoteDataSource: WordRemoteDataSource
    ) {
        self.userIdProvider = userIdProvider
        self.localDataSource = localDataSource
        self.remoteDataSource = remoteDataSource
    }
}

// MARK: - WordRepositoryProtocol

extension WordRepository: WordRepositoryProtocol {

    func saveDictionary(_ word: Word) async throws {
        try await localDataSource.saveDictionary(userIdProvider(), word: word)
    }

    func removeDictionary(by text: String) async throws {
        try await localDataSource.removeDictionary(userIdProvider(), by: text)
    }

    func getAllDictionary() async throws -> [DictionaryWord] {
        try await localDataSource.fetchAllDictionary(userIdProvider())
    }

    func updateStudyCoefficient(_ coefficient: Int, of wordText: String) async throws {
        try await localDataSource.updateStudyCoefficient(userIdProvider(), coefficient: coefficient, wordText: wordText)
    }

    func get(by text: String) async throws -> Word? {
        do {
            return try await fetchRemoteWord(by: text)
        } catch NetworkError.requestFailed(.notFound, _) {
            return nil
        } catch NetworkError.notConnected {
            return try await localDataSource.fetch(userIdProvider(), by: text)
        } catch {
            throw error
        }
    }
}

// MARK: - Private methods

private extension WordRepository {

    func fetchRemoteWord(by text: String) async throws -> Word? {
        let isDictionary = try await localDataSource.isDictionary(userIdProvider(), wordText: text)
        let remoteDefinitions = try await remoteDataSource.fetchAll(by: text)

        return remoteDefinitions.toWord(isDictionary: isDictionary)
    }
}
