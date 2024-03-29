//
//  DictionaryFactory.swift
//
//
//  Created by Ivan Semenov on 29.03.2024.
//

final class DictionaryFactory {

    private let dependencies: ModuleDependencies

    private lazy var wordDefinitionRepository: WordDefinitionRepository = {
        let remoteDataSource = WordDefinitionRemoteDataSource(networkService: dependencies.networkService)
        return WordDefinitionRepositoryImpl(remoteDataSource: remoteDataSource)
    }()

    init(dependencies: ModuleDependencies) {
        self.dependencies = dependencies
    }
}

// MARK: - Factory methods

extension DictionaryFactory {

    func makeFetchWordDefinitionsUseCase() -> FetchWordDefinitionsUseCase {
        FetchWordDefinitionsUseCase(wordDefinitionRepository: wordDefinitionRepository)
    }
}
