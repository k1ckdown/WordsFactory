//
//  QuestionView.swift
//
//
//  Created by Ivan Semenov on 01.04.2024.
//

import SwiftUI
import CommonUI

struct QuestionView: View {

    @StateObject private var viewModel: QuestionViewModel

    init(viewModel: QuestionViewModel) {
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

private extension QuestionView {

    func loadedView(_ viewData: QuestionViewModel.ViewState.ViewData) -> some View {
        VStack {
            VStack(spacing: .zero) {
                Text(Strings.of(viewData.question.number, viewData.totalQuestions))
                    .font(Fonts.paragraphLarge)
                    .foregroundStyle(Colors.appDarkGray.swiftUIColor)

                Text(viewData.question.definition)
                    .font(Fonts.headline4)
                    .foregroundStyle(Colors.appDark.swiftUIColor)
                    .multilineTextAlignment(.center)
                    .padding(.top, Constants.definitionInsetTop)

                VStack(spacing: Constants.choiceSpacing) {
                    ForEach(viewData.question.choices) { choice in
                        AnswerChoiceView(viewModel: choice)
                    }
                }
                .disabled(viewData.isChoiceDisabled)
                .padding(.top, Constants.choicesInsetTop)
            }
            .frame(maxHeight: .infinity)
            .offset(y: Constants.questionOffsetY)

            LinearTimerView(viewModel: viewData.timer)
                .offset(y: Constants.timerOffsetY)
        }
        .padding(.horizontal)
    }
}

// MARK: - Constants

private extension QuestionView {

    enum Constants {
        static let choiceSpacing: CGFloat = 16
        static let definitionInsetTop: CGFloat = 8
        static let choicesInsetTop: CGFloat = 25
        static let timerOffsetY: CGFloat = -30
        static let questionOffsetY: CGFloat = -90
    }
}
