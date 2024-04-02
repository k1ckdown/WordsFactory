//
//  WordRepositoryImpl.swift
//
//
//  Created by Ivan Semenov on 26.03.2024.
//

import NetworkingAPI

final class WordRepositoryImpl {

    private let localDataSource: WordLocalDataSource
    private let remoteDataSource: WordRemoteDataSource

    init(localDataSource: WordLocalDataSource, remoteDataSource: WordRemoteDataSource) {
        self.localDataSource = localDataSource
        self.remoteDataSource = remoteDataSource
    }
}

// MARK: - WordRepository

extension WordRepositoryImpl: WordRepository {

    func save(_ words: [Word]) throws {
        try localDataSource.save(words)
    }

    func remove(by word: String) throws {
        try localDataSource.remove(by: word)
    }

    func getAll(by word: String) async throws -> WordList {
        do {
            return try await fetchRemoteWordList(of: word)
        } catch NetworkError.requestFailed(.notFound, _) {
            return WordList(words: [], isSaved: false)
        } catch NetworkError.notConnected {
            return try fetchLocalWordList(by: word)
        } catch {
            throw error
        }
    }
}

// MARK: - Private methods

private extension WordRepositoryImpl {

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
