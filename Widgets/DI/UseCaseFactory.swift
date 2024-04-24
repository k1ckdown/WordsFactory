//
//  UseCaseFactory.swift
//  WidgetsExtension
//
//  Created by Ivan Semenov on 09.04.2024.
//

import Networking
import UserModule
import WordModule

final class UseCaseFactory {
    private lazy var networkService = NetworkService()
    private lazy var userRepository = UserRepositoryAssembly.assemble()
    private lazy var wordRepository = WordRepositoryAssembly.assemble(
        userIdProvider: { try await self.userRepository.getUserId() },
        networkService: networkService
    )
}

// MARK: - Public methods

extension UseCaseFactory {

    func makeGetRandomWordUseCase() -> GetRandomWordUseCase {
        GetRandomWordUseCase(wordRepository: wordRepository)
    }

    func makeGetDictionaryWordCountUseCase() -> GetDictionaryWordCountUseCase {
        GetDictionaryWordCountUseCase(wordRepository: wordRepository)
    }

    func makeGetRememberedWordCountUseCase() -> GetRememberedWordCountUseCase {
        GetRememberedWordCountUseCase(wordRepository: wordRepository)
    }
}
