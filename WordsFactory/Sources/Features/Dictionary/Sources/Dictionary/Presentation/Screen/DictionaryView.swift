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
        case .failed:
            EmptyView()
        case .loading:
            wordList(.placeholders(Constants.WordList.placeholders))
        case .loaded(let viewData):
            loadedView(viewData)
        }
    }
}

// MARK: - Loaded view

private extension DictionaryView {

    @ViewBuilder
    func loadedView(_ viewData: DictionaryViewModel.ViewState.ViewData) -> some View {
        if viewData.wordCards.isEmpty {
            DictionaryPlaceholderView()
        } else {
            wordContentView(viewData)
        }
    }

    func wordContentView(_ viewData: DictionaryViewModel.ViewState.ViewData) -> some View {
        ZStack(alignment: .bottom) {
            wordList(viewData.wordCards)
            dictionaryButton(isWordSaved: viewData.isWordSaved)
        }
        .ignoresSafeArea(edges: .bottom)
    }

    func dictionaryButton(isWordSaved: Bool) -> some View {
        Button(isWordSaved ? Strings.deleteFromDictionary : Strings.addToDictionary) {
            viewModel.handle(.dictionaryTapped)
        }
        .mainButtonStyle()
        .padding(.horizontal, Constants.DictionaryButton.insetHorizontal)
        .offset(y: Constants.DictionaryButton.offsetY)
    }

    func wordList(_ cards: [WordCardViewModel]) -> some View {
        ScrollView {
            LazyVStack(spacing: Constants.WordList.spacing) {
                ForEach(cards) { card in
                    WordCardView(viewModel: card)
                }
            }
            .padding([.top, .horizontal])
            .padding(.bottom, Constants.WordList.listInsetBottom)
        }
        .redacted(if: viewModel.state == .loading)
    }
}

// MARK: - Constants

private extension DictionaryView {

    enum Constants {

        enum DictionaryButton {
            static let offsetY: CGFloat = -115
            static let insetHorizontal: CGFloat = 33
        }

        enum WordList {
            static let placeholders = 2
            static let spacing: CGFloat = 30
            static let cornerRadius: CGFloat = 16
            static let listInsetBottom: CGFloat = 190
        }
    }
}
