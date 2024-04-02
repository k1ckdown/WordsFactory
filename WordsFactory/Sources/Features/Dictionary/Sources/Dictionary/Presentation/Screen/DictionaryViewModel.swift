//
//  DictionaryViewModel.swift
//
//
//  Created by Ivan Semenov on 27.03.2024.
//

import Foundation

final class DictionaryViewModel: ObservableObject {

    @Published private(set) var state = ViewState.idle

    private var words: [Word] = []
    private let audioManager: AudioManager
    private let coordinator: DictionaryCoordinatorProtocol
    private let getWordListUseCase: GetWordListUseCase
    private let saveWordListUseCase: SaveWordListUseCase
    private let removeWordListUseCase: RemoveWordListUseCase

    init(
        audioManager: AudioManager,
        coordinator: DictionaryCoordinatorProtocol,
        getWordListUseCase: GetWordListUseCase,
        saveWordListUseCase: SaveWordListUseCase,
        removeWordListUseCase: RemoveWordListUseCase
    ) {
        self.audioManager = audioManager
        self.coordinator = coordinator
        self.getWordListUseCase = getWordListUseCase
        self.saveWordListUseCase = saveWordListUseCase
        self.removeWordListUseCase = removeWordListUseCase
    }

    func handle(_ event: Event) {
        switch event {
        case .dictionaryTapped:
            handleDictionaryTap()
        case .searchWordChanged(let text):
            Task { await getWordList(by: text) }
        }
    }
}

// MARK: - Private methods

private extension DictionaryViewModel {

    @MainActor
    func handleWordList(_ list: WordList) {
        let viewModels = list.words.map { WordCardViewModel($0, phoneticAction: handlePhoneticTap) }
        let viewData = ViewState.ViewData(isWordsSaved: list.isSaved, wordCards: viewModels)
        state = .loaded(viewData)
    }

    func handlePhoneticTap(_ phonetic: String) {
        guard
            let audio = words.flatMap({ $0.phonetics }).first(where: { $0.text == phonetic })?.audio,
            let audioUrl = URL(string: audio)
        else { return }

        audioManager.play(url: audioUrl)
    }

    func handleDictionaryTap() {
        guard case .loaded(let viewData) = state else { return }

        do {
            try viewData.isWordsSaved ? removeWords() : saveWords()
        } catch {
            coordinator.showError(message: error.localizedDescription)
        }
    }

    func saveWords() throws {
        guard words.isEmpty == false else { return }

        try saveWordListUseCase.execute(words)
        state = state.saveWords()
    }

    func removeWords() throws {
        guard let word = words.first?.text else { return }

        try removeWordListUseCase.execute(word)
        state = state.removeWords()
    }

    func getWordList(by text: String) async {
        await MainActor.run { state = .loading }
        do {
            let wordList = try await getWordListUseCase.execute(text)
            words = wordList.words
            await handleWordList(wordList)
        } catch {
            await MainActor.run {
                state = .failed
                coordinator.showError(message: error.localizedDescription)
            }
        }
    }
}
