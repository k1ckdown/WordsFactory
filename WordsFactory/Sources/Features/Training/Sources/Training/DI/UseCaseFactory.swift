//
//  UseCaseFactory.swift
//
//
//  Created by Ivan Semenov on 03.04.2024.
//

import WordModuleAPI

final class UseCaseFactory {

    private let wordRepository: WordRepositoryProtocol
    private let getDictionaryWordCountUseCaseProvider: GetDictionaryWordCountUseCaseProvider

    init(
        wordRepository: WordRepositoryProtocol,
        getDictionaryWordCountUseCaseProvider: @escaping GetDictionaryWordCountUseCaseProvider
    ) {
        self.wordRepository = wordRepository
        self.getDictionaryWordCountUseCaseProvider = getDictionaryWordCountUseCaseProvider
    }
}

// MARK: - Public methods

extension UseCaseFactory {

    func makeGetWordTestResultUseCase() -> GetWordTestResultUseCase {
        GetWordTestResultUseCase()
    }

    func makeGetWordQuestionsUseCase() -> GetWordQuestionsUseCase {
        GetWordQuestionsUseCase(wordRepository: wordRepository)
    }

    func makeHandleWordTestResultUseCase() -> HandleWordTestResultUseCase {
        HandleWordTestResultUseCase(wordRepository: wordRepository)
    }

    func makeGetDictionaryWordCountUseCase() -> GetDictionaryWordCountUseCaseProtocol {
        getDictionaryWordCountUseCaseProvider()
    }
}
