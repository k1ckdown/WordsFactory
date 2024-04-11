//
//  GetDictionaryWordCountUseCase.swift
//
//
//  Created by Ivan Semenov on 02.04.2024.
//

import WordModuleAPI

public final class GetDictionaryWordCountUseCase: GetDictionaryWordCountUseCaseProtocol {

    private let wordRepository: WordRepositoryProtocol

    public init(wordRepository: WordRepositoryProtocol) {
        self.wordRepository = wordRepository
    }

    public func execute() async throws -> Int {
        let dictionaryWords = try await wordRepository.getAllDictionary()
        return dictionaryWords.count
    }
}
