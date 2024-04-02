//
//  DictionaryFactory.swift
//
//
//  Created by Ivan Semenov on 29.03.2024.
//

final class DictionaryFactory {

    private let dependencies: ModuleDependencies
    private lazy var coreDataProvider = CoreDataProvider()

    private lazy var wordRepository: WordRepository = {
        let localDataSource = WordLocalDataSource(context: coreDataProvider.context)
        let remoteDataSource = WordRemoteDataSource(networkService: dependencies.networkService)
        return WordRepositoryImpl(localDataSource: localDataSource, remoteDataSource: remoteDataSource)
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
            getWordListUseCase: makeGetWordListUseCase(),
            saveWordListUseCase: makeSaveWordListUseCase(),
            removeWordListUseCase: makeRemoveWordListUseCase()
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

    func makeGetWordListUseCase() -> GetWordListUseCase {
        GetWordListUseCase(wordRepository: wordRepository)
    }

    func makeSaveWordListUseCase() -> SaveWordListUseCase {
        SaveWordListUseCase(wordRepository: wordRepository)
    }

    func makeRemoveWordListUseCase() -> RemoveWordListUseCase {
        RemoveWordListUseCase(wordRepository: wordRepository)
    }
}
