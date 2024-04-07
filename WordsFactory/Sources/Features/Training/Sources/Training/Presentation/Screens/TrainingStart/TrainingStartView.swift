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
        case .loaded(let viewData):
            loadedView(viewData)
        }
    }
}

// MARK: - Loaded view

private extension TrainingStartView {

    @ViewBuilder
    func loadedView(_ viewData: TrainingStartViewModel.ViewState.ViewData) -> some View {
        if viewData.totalWords == 0 {
            Text(Strings.addWordsToDictionary)
                .font(Fonts.headline5)
        } else {
            VStack(spacing: .zero) {
                titlesView(totalWords: viewData.totalWords)
                countdownView(viewData.countdown, isShowing: viewData.isCountdownShowing)
            }
        }
    }

    func titlesView(totalWords: Int) -> some View {
        VStack(spacing: .zero) {
            HighlightedText(
                Strings.dictionaryWords(totalWords),
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
        .frame(height: Constants.countdownHeight)
        .padding(.top, Constants.countdownTopInset)
    }
}

// MARK: - Constants

private extension TrainingStartView {

    enum Constants {
        static let subtitleInsetTop: CGFloat = 35
        static let titlesHorizontalInset: CGFloat = 50
        static let countdownHeight: CGFloat = 120
        static let countdownTopInset: CGFloat = 190
        static let startButtonHorizontalInset: CGFloat = 33
    }
}
