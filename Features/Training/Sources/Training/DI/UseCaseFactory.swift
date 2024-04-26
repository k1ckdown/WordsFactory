//
//  UseCaseFactory.swift
//
//
//  Created by Ivan Semenov on 03.04.2024.
//

import DictionaryDomain

final class UseCaseFactory {

    private let wordRepository: WordRepositoryProtocol

    init(wordRepository: WordRepositoryProtocol) {
        self.wordRepository = wordRepository
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

    func makeGetAllDictionaryUseCase() -> GetAllDictionaryUseCase {
        GetAllDictionaryUseCase(wordRepository: wordRepository)
    }

    func makeUpdateStudyCoefficientUseCase() -> UpdateStudyCoefficientUseCase {
        UpdateStudyCoefficientUseCase(wordRepository: wordRepository)
    }
}
