//
//  WordDefinitionRepositoryImpl.swift
//
//
//  Created by Ivan Semenov on 26.03.2024.
//

final class WordDefinitionRepositoryImpl {

    private let remoteDataSource: WordDefinitionRemoteDataSource

    init(remoteDataSource: WordDefinitionRemoteDataSource) {
        self.remoteDataSource = remoteDataSource
    }
}

// MARK: - WordDefinitionRepository

extension WordDefinitionRepositoryImpl: WordDefinitionRepository {

    func getDefinitionList(of word: String) async throws -> [WordDefinition] {
        let dtoList = try await remoteDataSource.fetchDefinitionList(of: word)
        return WordDefinitionMapper.toDomainList(dtoList)
    }
}
