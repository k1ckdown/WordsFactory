//
//  UseCaseFactory.swift
//  WidgetsExtension
//
//  Created by Ivan Semenov on 09.04.2024.
//

import Networking
import WordModule

final class UseCaseFactory {
    private lazy var networkService = NetworkService()
    private lazy var wordRepository = WordRepositoryAssembly.assemble(networkService: networkService)
}

// MARK: - Public methods

extension UseCaseFactory {

    func makeGetDictionaryWordCountUseCase() -> GetDictionaryWordCountUseCase {
        GetDictionaryWordCountUseCase(wordRepository: wordRepository)
    }

    func makeGetRememberedWordCountUseCase() -> GetRememberedWordCountUseCase {
        GetRememberedWordCountUseCase(wordRepository: wordRepository)
    }
}
