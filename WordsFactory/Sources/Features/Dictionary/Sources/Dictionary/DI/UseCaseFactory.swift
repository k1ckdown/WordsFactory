//
//  UseCaseFactory.swift
//
//
//  Created by Ivan Semenov on 21.04.2024.
//

final class UseCaseFactory {

    private let repositoryFactory: RepositoryFactory

    init(repositoryFactory: RepositoryFactory) {
        self.repositoryFactory = repositoryFactory
    }
}

// MARK: - Public methods

extension UseCaseFactory {

    func makeGetWordUseCase() -> GetWordUseCase {
        GetWordUseCase(wordRepository: repositoryFactory.makeWordRepository())
    }

    func makeSaveDictionaryWordUseCase() -> SaveDictionaryWordUseCase {
        SaveDictionaryWordUseCase(wordRepository: repositoryFactory.makeWordRepository())
    }

    func makeRemoveDictionaryWordUseCase() -> RemoveDictionaryWordUseCase {
        RemoveDictionaryWordUseCase(wordRepository: repositoryFactory.makeWordRepository())
    }
}
