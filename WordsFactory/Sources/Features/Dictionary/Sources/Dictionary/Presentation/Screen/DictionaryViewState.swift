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
        case error(String)
        case loaded(ViewData)

        struct ViewData: Equatable {
            var selectedDefinitionIndex: Int?
            var definitionCards: [WordDefinitionCardViewModel]

            var isAddToDictionaryShowing: Bool {
                selectedDefinitionIndex != nil
            }
        }
    }

    enum Event {
        case addToDictionaryTapped
        case definitionSelected(Int)
        case searchWordChanged(String)
    }
}

// MARK: - Mutating

extension DictionaryViewModel.ViewState {

    func unselectDefinition() -> Self {
        guard case .loaded(var viewData) = self else { return self }

        viewData.selectedDefinitionIndex = nil
        return .loaded(viewData)
    }

    func selectDefinition(at index: Int) -> Self {
        guard case .loaded(var viewData) = self else { return self }

        viewData.selectedDefinitionIndex = viewData.selectedDefinitionIndex == nil ? index : nil
        return .loaded(viewData)
    }
}
