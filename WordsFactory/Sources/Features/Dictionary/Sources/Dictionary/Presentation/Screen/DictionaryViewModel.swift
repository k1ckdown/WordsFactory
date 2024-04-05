//
//  DictionaryViewModel.swift
//
//
//  Created by Ivan Semenov on 27.03.2024.
//

import Foundation
import WordModuleAPI

final class DictionaryViewModel: ObservableObject {

    @Published private(set) var state = ViewState.idle

    private var word: Word?
    private let audioManager: AudioManager
    private let coordinator: DictionaryCoordinatorProtocol
    private let getWordUseCase: GetWordUseCase
    private let saveDictionaryWordUseCase: SaveDictionaryWordUseCase
    private let removeDictionaryWordUseCase: RemoveDictionaryWordUseCase

    init(
        audioManager: AudioManager,
        coordinator: DictionaryCoordinatorProtocol,
        getWordUseCase: GetWordUseCase,
        saveDictionaryWordUseCase: SaveDictionaryWordUseCase,
        removeDictionaryWordUseCase: RemoveDictionaryWordUseCase
    ) {
        self.audioManager = audioManager
        self.coordinator = coordinator
        self.getWordUseCase = getWordUseCase
        self.saveDictionaryWordUseCase = saveDictionaryWordUseCase
        self.removeDictionaryWordUseCase = removeDictionaryWordUseCase
    }

    func handle(_ event: Event) {
        switch event {
        case .dictionaryTapped:
            handleDictionaryTap()
        case .searchWordChanged(let text):
            Task { await getWord(by: text) }
        }
    }
}

// MARK: - Private methods

private extension DictionaryViewModel {

    @MainActor
    func handleWord(_ word: Word?) {
        self.word = word
        state = .loaded(makeViewData(of: word))
    }

    func handlePhoneticTap(_ phonetic: String) {
        guard
            let audio = word?.definitions.flatMap({ $0.phonetics }).first(where: { $0.text == phonetic })?.audio,
            let audioUrl = URL(string: audio)
        else { return }

        audioManager.play(url: audioUrl)
    }

    func handleDictionaryTap() {
        guard let word else { return }

        do {
            try word.isDictionary ? removeWord(word) : saveWord(word)
        } catch {
            coordinator.showError(message: error.localizedDescription)
        }
    }

    func saveWord(_ word: Word) throws {
        try saveDictionaryWordUseCase.execute(word)
        state = state.saveWord()
    }

    func removeWord(_ word: Word) throws {
        try removeDictionaryWordUseCase.execute(word.text)
        state = state.removeWord()
    }

    func getWord(by text: String) async {
        await MainActor.run { state = .loading }
        do {
            let word = try await getWordUseCase.execute(text)
            await handleWord(word)
        } catch {
            await MainActor.run {
                state = .failed
                coordinator.showError(message: error.localizedDescription)
            }
        }
    }

    func makeViewData(of word: Word?) -> ViewState.ViewData {
        guard let word else { return .init(isWordSaved: false, wordCards: []) }

        let wordViewModels = word.definitions.map {
            WordCardViewModel(text: word.text, definition: $0, phoneticHandler: handlePhoneticTap)
        }

        return .init(isWordSaved: word.isDictionary, wordCards: wordViewModels)
    }
}
