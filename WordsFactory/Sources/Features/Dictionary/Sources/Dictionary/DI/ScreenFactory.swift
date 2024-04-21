//
//  ScreenFactory.swift
//
//
//  Created by Ivan Semenov on 29.03.2024.
//

final class ScreenFactory {

    private let useCaseFactory: UseCaseFactory

    init(useCaseFactory: UseCaseFactory) {
        self.useCaseFactory = useCaseFactory
    }
}

// MARK: - Public methods

extension ScreenFactory {

    func makeDictionaryScreen(coordinator: DictionaryCoordinatorProtocol) -> DictionaryView {
        let viewModel = DictionaryViewModel(
            audioManager: makeAudioManager(),
            coordinator: coordinator,
            getWordUseCase: useCaseFactory.makeGetWordUseCase(),
            saveDictionaryWordUseCase: useCaseFactory.makeSaveDictionaryWordUseCase(),
            removeDictionaryWordUseCase: useCaseFactory.makeRemoveDictionaryWordUseCase()
        )

        let view = DictionaryView(viewModel: viewModel)
        return view
    }
}

// MARK: - Private methods

private extension ScreenFactory {

    func makeAudioManager() -> AudioManager {
        AudioManager()
    }
}
