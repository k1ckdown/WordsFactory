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

    func save(_ words: [Word]) throws {
        try localDataSource.save(words)
    }

    func remove(by text: String) throws {
        try localDataSource.remove(by: text)
    }

    func getDictionary() throws -> [Word] {
        try localDataSource.fetchAll()
    }

    func getAll(by text: String) async throws -> WordList {
        do {
            return try await fetchRemoteWordList(of: text)
        } catch NetworkError.requestFailed(.notFound, _) {
            return WordList(words: [], isSaved: false)
        } catch NetworkError.notConnected {
            return try fetchLocalWordList(by: text)
        } catch {
            throw error
        }
    }
}

// MARK: - Private methods

private extension WordRepository {

    func fetchLocalWordList(by text: String) throws -> WordList {
        let localWords = try localDataSource.fetchAll(by: text)
        let isSaved = localWords.isEmpty == false

        return WordList(words: localWords, isSaved: isSaved)
    }

    func fetchRemoteWordList(of text: String) async throws -> WordList {
        let localWords = try fetchLocalWordList(by: text)
        let dtoList = try await remoteDataSource.fetchAll(by: text)
        let domainList = WordMapper.toDomainList(dtoList)

        return WordList(words: domainList, isSaved: localWords.isSaved)
    }
}
