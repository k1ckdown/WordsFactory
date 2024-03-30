//
//  DictionaryView.swift
//
//
//  Created by Ivan Semenov on 26.03.2024.
//

import SwiftUI
import CommonUI

struct DictionaryView: View {

    @StateObject private var viewModel: DictionaryViewModel

    init(viewModel: DictionaryViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }

    var body: some View {
        VStack {
            SearchBar { word in
                viewModel.handle(.searchWordChanged(word))
            }
            .padding(.horizontal)

            contentView
                .frame(maxHeight: .infinity)
        }
    }

    @ViewBuilder
    private var contentView: some View {
        switch viewModel.state {
        case .idle:
            DictionaryPlaceholderView()
        case .loading:
            definitionList(.init(
                isDefinitionsSaved: false,
                definitionCards: .placeholders(Constants.Definition.placeholders)
            ))
        case .loaded(let viewData):
            loadedView(viewData)
        }
    }
}

// MARK: - Loaded view

private extension DictionaryView {

    @ViewBuilder
    func loadedView(_ viewData: DictionaryViewModel.ViewState.ViewData) -> some View {
        if viewData.definitionCards.isEmpty {
            DictionaryPlaceholderView()
        } else {
            definitionList(viewData)
        }
    }

    func definitionList(_ viewData: DictionaryViewModel.ViewState.ViewData) -> some View {
        ScrollView {
            LazyVStack(spacing: Constants.Definition.spacing) {
                ForEach(viewData.definitionCards) { card in
                    WordDefinitionCardView(viewModel: card)
                }
            }
            .padding([.top, .horizontal])
            .padding(.bottom, Constants.Definition.listInsetBottom)
        }
        .redacted(if: viewModel.state == .loading)
        .overlay(alignment: .bottom) {
            if case .loaded = viewModel.state {
                Button(viewData.isDefinitionsSaved ? Strings.deleteFromDictionary : Strings.addToDictionary) {
                    viewModel.handle(.dictionaryTapped)
                }
                .mainButtonStyle()
                .padding(.horizontal, Constants.AddToDictionary.insetHorizontal)
            }
        }
    }
}

// MARK: - Constants

private extension DictionaryView {

    enum Constants {

        enum AddToDictionary {
            static let insetHorizontal: CGFloat = 33
        }

        enum Definition {
            static let placeholders = 2
            static let spacing: CGFloat = 30
            static let cornerRadius: CGFloat = 16
            static let listInsetBottom: CGFloat = 75
        }
    }
}
