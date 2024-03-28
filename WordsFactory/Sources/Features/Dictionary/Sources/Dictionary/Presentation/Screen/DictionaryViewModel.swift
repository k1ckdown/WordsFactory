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
    private let fetchWordDefinitionsUseCase: FetchWordDefinitionsUseCase

    init(fetchWordDefinitionsUseCase: FetchWordDefinitionsUseCase) {
        self.fetchWordDefinitionsUseCase = fetchWordDefinitionsUseCase
    }

    func handle(_ event: Event) {
        switch event {
        case .definitionSelected(let index):
            state = state.selectDefinition(at: index)
        case .addToDictionaryTapped:
            Task { await handleAddToDictionaryTap() }
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

    func handleAddToDictionaryTap() async {
        await MainActor.run { state = state.unselectDefinition() }
    }

    func handlePhoneticTap(_ phonetic: String) {

    }

    func fetchDefinitions(of word: String) async {
        await MainActor.run { state = .loading }
        do {
            definitions = try await fetchWordDefinitionsUseCase.execute(word)
            await handleDefinitions(definitions)
        } catch {
            await MainActor.run { state = .error(error.localizedDescription) }
        }
    }
}
