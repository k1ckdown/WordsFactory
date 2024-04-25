//
//  UseCaseFactory.swift
//
//
//  Created by Ivan Semenov on 03.04.2024.
//

import WordModuleAPI

final class UseCaseFactory {

    private let repositoryFactory: RepositoryFactory
    private let getAllDictionaryUseCaseProvider: GetAllDictionaryUseCaseProvider

    init(
        repositoryFactory: RepositoryFactory,
        getAllDictionaryUseCaseProvider: @escaping GetAllDictionaryUseCaseProvider
    ) {
        self.repositoryFactory = repositoryFactory
        self.getAllDictionaryUseCaseProvider = getAllDictionaryUseCaseProvider
    }
}

// MARK: - Public methods

extension UseCaseFactory {

    func makeGetWordQuestionsUseCase() -> GetWordTestQuestionsUseCase {
        GetWordTestQuestionsUseCase()
    }

    func makeGetWordTestResultUseCase() -> GetWordTestResultUseCase {
        GetWordTestResultUseCase()
    }

    func makeComputeWordCoefficientUseCase() -> ComputeWordCoefficientUseCase {
        ComputeWordCoefficientUseCase()
    }

    func makeGetAllDictionaryUseCase() -> GetAllDictionaryUseCaseProtocol {
        getAllDictionaryUseCaseProvider()
    }
    
    func makeUpdateStudyCoefficientUseCase() -> UpdateStudyCoefficientUseCase {
        UpdateStudyCoefficientUseCase(wordRepository: repositoryFactory.makeWordRepository())
    }
}
