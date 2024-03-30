//
//  DictionaryViewModel.swift
//
//
//  Created by Ivan Semenov on 27.03.2024.
//

import Foundation

final class DictionaryViewModel: ObservableObject {

    @Published private(set) var state = ViewState.idle

    private var definitions = [WordDefinition]()
    private let coordinator: DictionaryCoordinatorProtocol
    private let saveWordDefinitionUseCase: SaveWordDefinitionUseCase
    private let fetchWordDefinitionsUseCase: FetchWordDefinitionsUseCase

    init(
        coordinator: DictionaryCoordinatorProtocol,
        saveWordDefinitionUseCase: SaveWordDefinitionUseCase,
        fetchWordDefinitionsUseCase: FetchWordDefinitionsUseCase
    ) {
        self.coordinator = coordinator
        self.saveWordDefinitionUseCase = saveWordDefinitionUseCase
        self.fetchWordDefinitionsUseCase = fetchWordDefinitionsUseCase
    }

    func handle(_ event: Event) {
        switch event {
        case .definitionSelected(let index):
            state = state.selectDefinition(at: index)
        case .addToDictionaryTapped:
            handleAddToDictionaryTap()
        case .searchWordChanged(let word):
            Task { await fetchDefinitions(of: word) }
        }
    }
}

// MARK: - Private methods

private extension DictionaryViewModel {

    @MainActor
    func handleDefinitions(_ definitions: [WordDefinition]) {
        let viewModels = definitions.map { WordDefinitionCardViewModel($0, phoneticAction: handlePhoneticTap) }
        let viewData = ViewState.ViewData(definitionCards: viewModels)
        state = .loaded(viewData)
    }

    func handlePhoneticTap(_ phonetic: String) {

    }

    func handleAddToDictionaryTap() {
        guard
            case .loaded(let viewData) = state,
            let selectedDefinitionIndex = viewData.selectedDefinitionIndex
        else { return }

        saveDefinition(definitions[selectedDefinitionIndex])
        state = state.unselectDefinition()
    }

    func saveDefinition(_ definition: WordDefinition) {
        do {
            try saveWordDefinitionUseCase.execute(definition)
        } catch {
            coordinator.showError(message: error.localizedDescription)
        }
    }

    func fetchDefinitions(of word: String) async {
        await MainActor.run { state = .loading }
        do {
            definitions = try await fetchWordDefinitionsUseCase.execute(word)
            await handleDefinitions(definitions)
        } catch {
            await MainActor.run {
                state = .idle
                coordinator.showError(message: error.localizedDescription)
            }
        }
    }
}
