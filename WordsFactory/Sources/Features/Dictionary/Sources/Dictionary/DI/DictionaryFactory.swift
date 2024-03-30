//
//  DictionaryFactory.swift
//
//
//  Created by Ivan Semenov on 29.03.2024.
//

final class DictionaryFactory {

    private let dependencies: ModuleDependencies
    private lazy var coreDataProvider = CoreDataProvider()

    private lazy var wordDefinitionRepository: WordDefinitionRepository = {
        let localDataSource = WordDefinitionLocalDataSource(context: coreDataProvider.context)
        let remoteDataSource = WordDefinitionRemoteDataSource(networkService: dependencies.networkService)
        return WordDefinitionRepositoryImpl(localDataSource: localDataSource, remoteDataSource: remoteDataSource)
    }()

    init(dependencies: ModuleDependencies) {
        self.dependencies = dependencies
    }
}

// MARK: - DictionaryScreenFactory

extension DictionaryFactory: DictionaryScreenFactory {

    func makeDictionaryScreen(coordinator: DictionaryCoordinatorProtocol) -> DictionaryView {
        let viewModel = DictionaryViewModel(
            audioManager: makeAudioManager(),
            coordinator: coordinator,
            saveWordDefinitionUseCase: makeSaveWordDefinitionUseCase(),
            fetchWordDefinitionsUseCase: makeFetchWordDefinitionsUseCase()
        )

        let view = DictionaryView(viewModel: viewModel)
        return view
    }
}

// MARK: - Media

private extension DictionaryFactory {

    func makeAudioManager() -> AudioManager {
        AudioManager()
    }
}

// MARK: - Use Cases

private extension DictionaryFactory {

    func makeFetchWordDefinitionsUseCase() -> FetchWordDefinitionsUseCase {
        FetchWordDefinitionsUseCase(wordDefinitionRepository: wordDefinitionRepository)
    }

    func makeSaveWordDefinitionUseCase() -> SaveWordDefinitionUseCase {
        SaveWordDefinitionUseCase(wordDefinitionRepository: wordDefinitionRepository)
    }
}
