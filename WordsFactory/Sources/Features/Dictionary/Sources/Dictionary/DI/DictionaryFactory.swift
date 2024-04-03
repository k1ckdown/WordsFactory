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
            getWordUseCase: makeGetWordUseCase(),
            saveDictionaryWordUseCase: makeSaveDictionaryWordUseCase(),
            removeDictionaryWordUseCase: makeRemoveDictionaryWordUseCase()
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

    func makeGetWordUseCase() -> GetWordUseCase {
        GetWordUseCase(wordRepository: dependencies.wordRepository)
    }

    func makeSaveDictionaryWordUseCase() -> SaveDictionaryWordUseCase {
        SaveDictionaryWordUseCase(wordRepository: dependencies.wordRepository)
    }

    func makeRemoveDictionaryWordUseCase() -> RemoveDictionaryWordUseCase {
        RemoveDictionaryWordUseCase(wordRepository: dependencies.wordRepository)
    }
}
