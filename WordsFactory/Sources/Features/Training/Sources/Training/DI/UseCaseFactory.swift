//
//  UseCaseFactory.swift
//
//
//  Created by Ivan Semenov on 03.04.2024.
//

import WordModuleAPI

final class UseCaseFactory {

    private let repositoryFactory: RepositoryFactory
    private let getDictionaryWordCountUseCaseProvider: GetDictionaryWordCountUseCaseProvider

    init(
        repositoryFactory: RepositoryFactory,
        getDictionaryWordCountUseCaseProvider: @escaping GetDictionaryWordCountUseCaseProvider
    ) {
        self.repositoryFactory = repositoryFactory
        self.getDictionaryWordCountUseCaseProvider = getDictionaryWordCountUseCaseProvider
    }
}

// MARK: - Public methods

extension UseCaseFactory {

    func makeGetWordTestResultUseCase() -> GetWordTestResultUseCase {
        GetWordTestResultUseCase()
    }

    func makeGetWordQuestionsUseCase() -> GetWordQuestionsUseCase {
        GetWordQuestionsUseCase(wordRepository: repositoryFactory.makeWordRepository())
    }

    func makeHandleWordTestResultUseCase() -> HandleWordTestResultUseCase {
        HandleWordTestResultUseCase(wordRepository: repositoryFactory.makeWordRepository())
    }

    func makeGetDictionaryWordCountUseCase() -> GetDictionaryWordCountUseCaseProtocol {
        getDictionaryWordCountUseCaseProvider()
    }
}
