//
//  GetAllDictionaryUseCase.swift
//
//
//  Created by Ivan Semenov on 11.04.2024.
//

public final class GetAllDictionaryUseCase {

    private let wordRepository: WordRepositoryProtocol

    public init(wordRepository: WordRepositoryProtocol) {
        self.wordRepository = wordRepository
    }

    public func execute() async throws -> [DictionaryWord] {
        try await wordRepository.getAllDictionary()
    }
}
