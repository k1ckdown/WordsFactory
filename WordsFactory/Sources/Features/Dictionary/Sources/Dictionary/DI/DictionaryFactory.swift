//
//  DictionaryFactory.swift
//
//
//  Created by Ivan Semenov on 29.03.2024.
//

final class DictionaryFactory {

    private let dependencies: ModuleDependencies

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
        GetWordListUseCase(wordRepository: dependencies.wordRepository)
    }

    func makeSaveWordListUseCase() -> SaveWordListUseCase {
        SaveWordListUseCase(wordRepository: dependencies.wordRepository)
    }

    func makeRemoveWordListUseCase() -> RemoveWordListUseCase {
        RemoveWordListUseCase(wordRepository: dependencies.wordRepository)
    }
}
