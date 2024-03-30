//
//  DictionaryViewState.swift
//
//
//  Created by Ivan Semenov on 27.03.2024.
//

extension DictionaryViewModel {

    enum ViewState: Equatable {
        case idle
        case loading
        case loaded(ViewData)

        struct ViewData: Equatable {
            var isDefinitionsSaved: Bool
            var definitionCards: [WordDefinitionCardViewModel]
        }
    }

    enum Event {
        case dictionaryTapped
        case searchWordChanged(String)
    }
}

// MARK: - Mutating

extension DictionaryViewModel.ViewState {

    func saveDefinition() -> Self {
        guard case .loaded(var viewData) = self else { return self }

        viewData.isDefinitionsSaved = true
        return .loaded(viewData)
    }

    func deleteDefinition() -> Self {
        guard case .loaded(var viewData) = self else { return self }

        viewData.isDefinitionsSaved = false
        return .loaded(viewData)
    }
}
