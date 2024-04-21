//
//  TrainingStartView.swift
//
//
//  Created by Ivan Semenov on 31.03.2024.
//

import SwiftUI
import CommonUI

struct TrainingStartView: View {

    @StateObject private var viewModel: TrainingStartViewModel

    init(viewModel: TrainingStartViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }

    var body: some View {
        contentView
            .onAppear {
                viewModel.handle(.onAppear)
            }
    }

    @ViewBuilder
    private var contentView: some View {
        switch viewModel.state {
        case .idle, .failed:
            ZStack { EmptyView() }
        case .loading:
            ProgressView().tintColor()
        case .loaded(let viewData):
            loadedView(viewData)
        }
    }
}

// MARK: - Loaded view

private extension TrainingStartView {

    @ViewBuilder
    func loadedView(_ viewData: TrainingStartViewModel.ViewState.ViewData) -> some View {
        if viewData.wordCount == 0 {
            PlaceholderView(title: Strings.dictionaryEmpty, subtitle: Strings.addWordsToDictionary)
        } else {
            VStack(spacing: .zero) {
                titlesView(wordCount: viewData.wordCount)
                countdownView(viewData.countdown, isShowing: viewData.isCountdownShowing)
            }
            .frame(maxHeight: .infinity, alignment: .bottom)
            .padding(.bottom, Constants.startViewInsetBottom)
        }
    }

    func titlesView(wordCount: Int) -> some View {
        VStack(spacing: .zero) {
            HighlightedText(
                Strings.dictionaryWords(wordCount),
                color: Colors.appOrange.swiftUIColor
            )

            Text("\(Strings.startTraining)?")
                .padding(.top, Constants.subtitleInsetTop)
        }
        .font(Fonts.headline4)
        .multilineTextAlignment(.center)
        .padding(.horizontal, Constants.titlesHorizontalInset)
    }

    func countdownView(_ timerViewModel: TimerViewModel, isShowing: Bool) -> some View {
        Group {
            if isShowing {
                CountdownView(viewModel: timerViewModel)
            } else {
                Button(Strings.start) {
                    viewModel.handle(.startTapped)
                }
                .mainButtonStyle()
                .padding(.horizontal, Constants.startButtonHorizontalInset)
            }
        }
        .frame(height: Constants.countdownHeight, alignment: .bottom)
        .padding(.top, Constants.countdownTopInset)
    }
}

// MARK: - Constants

private extension TrainingStartView {

    enum Constants {
        static let subtitleInsetTop: CGFloat = 35
        static let titlesHorizontalInset: CGFloat = 50
        static let countdownHeight: CGFloat = 120
        static let countdownTopInset: CGFloat = 160
        static let startViewInsetBottom: CGFloat = 120
        static let startButtonHorizontalInset: CGFloat = 33
    }
}
