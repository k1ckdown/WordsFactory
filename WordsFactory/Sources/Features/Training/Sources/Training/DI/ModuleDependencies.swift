//
//  ModuleDependencies.swift
//
//
//  Created by Ivan Semenov on 03.04.2024.
//

import WordModuleAPI

public typealias GetDictionaryWordCountUseCaseProvider = () -> GetDictionaryWordCountUseCaseProtocol

public struct ModuleDependencies {
    let wordRepository: WordRepositoryProtocol
    let getDictionaryWordCountUseCaseProvider: GetDictionaryWordCountUseCaseProvider

    public init(
        wordRepository: WordRepositoryProtocol,
        getDictionaryWordCountUseCase: @autoclosure @escaping GetDictionaryWordCountUseCaseProvider
    ) {
        self.wordRepository = wordRepository
        self.getDictionaryWordCountUseCaseProvider = getDictionaryWordCountUseCase
    }
}
