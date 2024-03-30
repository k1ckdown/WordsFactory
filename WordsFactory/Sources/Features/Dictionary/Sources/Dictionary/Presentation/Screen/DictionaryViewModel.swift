//
//  DictionaryViewModel.swift
//
//
//  Created by Ivan Semenov on 27.03.2024.
//

import Foundation

final class DictionaryViewModel: ObservableObject {

    @Published private(set) var state = ViewState.idle

    private var definitions: [WordDefinition] = []
    private let audioManager: AudioManager
    private let coordinator: DictionaryCoordinatorProtocol
    private let saveWordDefinitionsUseCase: SaveWordDefinitionsUseCase
    private let deleteWordDefinitionsUseCase: DeleteWordDefinitionsUseCase
    private let fetchWordDefinitionsUseCase: FetchWordDefinitionListUseCase

    init(
        audioManager: AudioManager,
        coordinator: DictionaryCoordinatorProtocol,
        saveWordDefinitionsUseCase: SaveWordDefinitionsUseCase,
        deleteWordDefinitionsUseCase: DeleteWordDefinitionsUseCase,
        fetchWordDefinitionsUseCase: FetchWordDefinitionListUseCase
    ) {
        self.audioManager = audioManager
        self.coordinator = coordinator
        self.saveWordDefinitionsUseCase = saveWordDefinitionsUseCase
        self.deleteWordDefinitionsUseCase = deleteWordDefinitionsUseCase
        self.fetchWordDefinitionsUseCase = fetchWordDefinitionsUseCase
    }

    func handle(_ event: Event) {
        switch event {
        case .dictionaryTapped:
            handleDictionaryTap()
        case .searchWordChanged(let word):
            Task { await fetchDefinitions(of: word) }
        }
    }
}

// MARK: - Private methods

private extension DictionaryViewModel {

    @MainActor
    func handleDefinitionList(_ list: WordDefinitionList) {
        let viewModels = list.definitions.map { WordDefinitionCardViewModel($0, phoneticAction: handlePhoneticTap) }
        let viewData = ViewState.ViewData(isDefinitionsSaved: list.isSaved, definitionCards: viewModels)
        state = .loaded(viewData)
    }

    func handlePhoneticTap(_ phonetic: String) {
        guard
            let audio = definitions.flatMap({ $0.phonetics }).first(where: { $0.text == phonetic })?.audio,
            let audioUrl = URL(string: audio)
        else { return }

        audioManager.play(url: audioUrl)
    }

    func handleDictionaryTap() {
        guard case .loaded(let viewData) = state else { return }

        do {
            try viewData.isDefinitionsSaved ? deleteDefinitions() : saveDefinitions()
        } catch {
            coordinator.showError(message: error.localizedDescription)
        }
    }

    func saveDefinitions() throws {
        guard definitions.isEmpty == false else { return }

        try saveWordDefinitionsUseCase.execute(definitions)
        state = state.saveDefinition()
    }

    func deleteDefinitions() throws {
        guard let word = definitions.first?.word else { return }

        try deleteWordDefinitionsUseCase.execute(word)
        state = state.deleteDefinition()
    }

    func fetchDefinitions(of word: String) async {
        await MainActor.run { state = .loading }
        do {
            let definitionList = try await fetchWordDefinitionsUseCase.execute(word)
            definitions = definitionList.definitions
            await handleDefinitionList(definitionList)
        } catch {
            await MainActor.run {
                state = .idle
                coordinator.showError(message: error.localizedDescription)
            }
        }
    }
}
