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

// MARK: - DictionaryScreenFactory

extension DictionaryFactory: DictionaryScreenFactory {

    func makeDictionaryScreen(coordinator: DictionaryCoordinatorProtocol) -> DictionaryView {
        let viewModel = DictionaryViewModel(
            coordinator: coordinator,
            fetchWordDefinitionsUseCase: makeFetchWordDefinitionsUseCase()
        )
        
        let view = DictionaryView(viewModel: viewModel)
        return view
    }
}

// MARK: - Use Cases

private extension DictionaryFactory {

    func makeFetchWordDefinitionsUseCase() -> FetchWordDefinitionsUseCase {
        FetchWordDefinitionsUseCase(wordDefinitionRepository: wordDefinitionRepository)
    }
}
