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
        case .cardSelected(let index):
            Task { await handleCardSelect(at: index) }
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
    func loading() {
        state = .loading
    }

    @MainActor
    func handleError(_ error: Error) {
        print(error)
        state = .error(error.localizedDescription)
    }

    @MainActor
    func handleDefinitions(_ definitions: [WordDefinition]) {
        let viewModels = definitions.map { WordDefinitionCardViewModel($0, phoneticAction: handlePhoneticTap) }
        let viewData = ViewState.ViewData(definitionCards: viewModels)
        state = .loaded(viewData)
    }

    func handleCardSelect(at index: Int) async {
        guard case .loaded(let viewData) = state else { return }

        state = await viewData.selectedDefinitionIndex == nil
        ? state.selectDefinition(at: index)
        : state.unselectDefinition()
    }

    func handleAddToDictionaryTap() async {
        await state = state.unselectDefinition()
    }

    func handlePhoneticTap(_ phonetic: String) {
    }

    func fetchDefinitions(of word: String) async {
        await loading()
        do {
            definitions = try await fetchWordDefinitionsUseCase.execute(word)
            await handleDefinitions(definitions)
        } catch {
            await handleError(error)
        }
    }
}
