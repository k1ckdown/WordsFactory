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
            ProgressView().tintColor()

        case .error(let message):
            Text(message)

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
            LazyVStack {
                ForEach(Array(viewData.definitionCards.enumerated()), id: \.element.id) { index, card in
                    WordDefinitionCardView(viewModel: card)
                        .padding()
                        .overlay {
                            if let selected = viewData.selectedDefinitionIndex, selected == index {
                                RoundedRectangle(cornerRadius: Constants.Definition.cornerRadius)
                                    .stroke(Colors.appOrange.swiftUIColor)
                            }
                        }
                        .onTapGesture {
                            withAnimation {
                                viewModel.handle(.cardSelected(index))
                            }
                        }
                }
            }
            .padding([.top, .horizontal])
            .padding(.bottom, Constants.Definition.listInsetBottom)
        }.overlay(alignment: .bottom) {
            if viewData.isAddToDictionaryShowing {
                Button(Strings.addToDictionary) {
                    withAnimation {
                        viewModel.handle(.addToDictionaryTapped)
                    }
                }
                .mainButtonStyle()
                .padding(.horizontal, Constants.AddToDictionary.insetHorizontal)
                .transition(.opacity)
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
            static let cornerRadius: CGFloat = 16
            static let listInsetBottom: CGFloat = 75
        }
    }
}
