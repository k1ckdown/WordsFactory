//
//  ModuleDependencies.swift
//
//
//  Created by Ivan Semenov on 03.04.2024.
//

import WordModuleAPI

public typealias GetAllDictionaryUseCaseProvider = () -> GetAllDictionaryUseCaseProtocol

public struct ModuleDependencies {
    let wordRepository: WordRepositoryProtocol
    let getAllDictionaryUseCaseProvider: GetAllDictionaryUseCaseProvider

    public init(
        wordRepository: WordRepositoryProtocol,
        getAllDictionaryUseCase: @autoclosure @escaping GetAllDictionaryUseCaseProvider
    ) {
        self.wordRepository = wordRepository
        self.getAllDictionaryUseCaseProvider = getAllDictionaryUseCase
    }
}
