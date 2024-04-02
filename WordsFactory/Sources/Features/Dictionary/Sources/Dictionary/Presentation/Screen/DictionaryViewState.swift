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
            var isWordsSaved: Bool
            var wordCards: [WordCardViewModel]
        }
    }

    enum Event {
        case dictionaryTapped
        case searchWordChanged(String)
    }
}

// MARK: - Mutating

extension DictionaryViewModel.ViewState {

    func saveWords() -> Self {
        guard case .loaded(var viewData) = self else { return self }

        viewData.isWordsSaved = true
        return .loaded(viewData)
    }

    func removeWords() -> Self {
        guard case .loaded(var viewData) = self else { return self }

        viewData.isWordsSaved = false
        return .loaded(viewData)
    }
}
