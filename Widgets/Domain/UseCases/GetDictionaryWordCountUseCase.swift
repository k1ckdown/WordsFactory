//
//  GetDictionaryWordCountUseCase.swift
//  WidgetsExtension
//
//  Created by Ivan Semenov on 09.04.2024.
//

import WordModuleAPI

final class GetDictionaryWordCountUseCase {

    private let wordRepository: WordRepositoryProtocol

    init(wordRepository: WordRepositoryProtocol) {
        self.wordRepository = wordRepository
    }

    func execute() async throws -> Int {
        let dictionaryWords = try await wordRepository.getAllDictionary()
        return dictionaryWords.count
    }
}
