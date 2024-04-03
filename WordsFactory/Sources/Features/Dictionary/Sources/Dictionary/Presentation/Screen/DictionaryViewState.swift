//
//  DictionaryViewState.swift
//
//
//  Created by Ivan Semenov on 27.03.2024.
//

extension DictionaryViewModel {

    enum ViewState: Equatable {
        case idle
        case failed
        case loading
        case loaded(ViewData)

        struct ViewData: Equatable {
            var isWordSaved: Bool
            let wordCards: [WordCardViewModel]
        }
    }

    enum Event {
        case dictionaryTapped
        case searchWordChanged(String)
    }
}

// MARK: - Mutating

extension DictionaryViewModel.ViewState {

    func saveWord() -> Self {
        guard case .loaded(var viewData) = self else { return self }

        viewData.isWordSaved = true
        return .loaded(viewData)
    }

    func removeWord() -> Self {
        guard case .loaded(var viewData) = self else { return self }

        viewData.isWordSaved = false
        return .loaded(viewData)
    }
}
