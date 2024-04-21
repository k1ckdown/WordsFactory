//
//  UseCaseFactory.swift
//
//
//  Created by Ivan Semenov on 21.04.2024.
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

    func makeGetWordUseCase() -> GetWordUseCase {
        GetWordUseCase(wordRepository: wordRepository)
    }

    func makeSaveDictionaryWordUseCase() -> SaveDictionaryWordUseCase {
        SaveDictionaryWordUseCase(wordRepository: wordRepository)
    }

    func makeRemoveDictionaryWordUseCase() -> RemoveDictionaryWordUseCase {
        RemoveDictionaryWordUseCase(wordRepository: wordRepository)
    }
}
