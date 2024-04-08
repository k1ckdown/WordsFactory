//
//  TrainingFinishView.swift
//
//
//  Created by Ivan Semenov on 04.04.2024.
//

import SwiftUI
import CommonUI
import WidgetKit

struct TrainingFinishView: View {

    @StateObject private var viewModel: TrainingFinishViewModel

    init(viewModel: TrainingFinishViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }

    var body: some View {
        contentView
            .onAppear {
                viewModel.handle(.onAppear)
                WidgetCenter.shared.reloadAllTimelines()
            }
    }

    @ViewBuilder
    private var contentView: some View {
        switch viewModel.state {
        case .idle:
            ZStack { EmptyView() }
        case .loaded(let viewData):
            loadedView(viewData)
        }
    }

    private func loadedView(_ viewData: TrainingFinishViewModel.ViewState.ViewData) -> some View {
        VStack(spacing: Constants.contentSpacing) {
            Images.finishedTraining.swiftUIImage
                .resizable()
                .scaledToFit()
                .frame(maxHeight: Constants.imageMaxHeight)

            VStack(spacing: .zero) {
                Text(Strings.trainingFinished)
                    .font(Fonts.headline4)
                    .foregroundStyle(Colors.appDark.swiftUIColor)

                VStack(spacing: .zero) {
                    Text("\(Strings.correct): \(viewData.correct)")
                    Text("\(Strings.incorrect): \(viewData.incorrect)")
                }
                .font(Fonts.paragraphMedium)
                .foregroundStyle(Colors.appDarkGray.swiftUIColor)
                .padding(.top, Constants.resultInsetTop)
            }

            Button(Strings.again) {
                viewModel.handle(.againTapped)
            }
            .mainButtonStyle()
            .padding(.horizontal, Constants.againInsetHorizontal)
        }
    }
}

// MARK: - Constants

private extension TrainingFinishView {

    enum Constants {
        static let resultInsetTop: CGFloat = 8
        static let contentSpacing: CGFloat = 37
        static let imageMaxHeight: CGFloat = 253
        static let againInsetHorizontal: CGFloat = 33
    }
}
