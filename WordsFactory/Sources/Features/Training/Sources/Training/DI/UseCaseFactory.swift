//
//  UseCaseFactory.swift
//
//
//  Created by Ivan Semenov on 03.04.2024.
//

import WordModuleAPI

final class UseCaseFactory {

    private let wordRepository: WordRepositoryProtocol

    init(wordRepository: WordRepositoryProtocol) {
        self.wordRepository = wordRepository
    }
}

// MARK: - Public methods

extension UseCaseFactory {

    func makeGetWordQuestionsUseCase() -> GetWordQuestionsUseCase {
        GetWordQuestionsUseCase(wordRepository: wordRepository)
    }

    func makeGetTotalDictionaryWordsUseCase() -> GetTotalDictionaryWordsUseCase {
        GetTotalDictionaryWordsUseCase(wordRepository: wordRepository)
    }
}
