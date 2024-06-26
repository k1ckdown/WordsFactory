//
//  OnboardingView.swift
//
//
//  Created by Ivan Semenov on 29.03.2024.
//

import SwiftUI
import CommonUI

struct OnboardingView: View {

    @StateObject private var viewModel: OnboardingViewModel

    init(viewModel: OnboardingViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }

    var body: some View {
        VStack {
            VStack(spacing: .zero) {
                viewModel.state.style.image
                    .resizable()
                    .scaledToFit()
                    .frame(height: Constants.Image.height)

                Group {
                    VStack(spacing: Constants.Titles.spacing) {
                        Text(viewModel.state.style.title)
                            .font(Fonts.headline4)
                            .foregroundStyle(Colors.appDark.swiftUIColor)
                            .frame(height: Constants.Titles.height, alignment: .bottom)

                        Text(viewModel.state.style.subtitle)
                            .font(Fonts.paragraphMedium)
                            .foregroundStyle(Colors.appDarkGray.swiftUIColor)
                    }
                    .multilineTextAlignment(.center)
                    .lineSpacing(Constants.Titles.lineSpacing)
                    .padding(.top, Constants.Titles.insetTop)

                    PageIndicator(viewModel.state.style.page)
                        .padding(.top, Constants.PageIndicator.insetTop)
                }
                .padding(.horizontal, Constants.Titles.insetHorizontal)
            }
            .frame(maxHeight: .infinity)

            Button(viewModel.state.style.buttonTitle, action: nextTapped)
                .mainButtonStyle()
                .offset(y: Constants.Button.offsetY)
                .padding(.horizontal, Constants.Button.insetHorizontal)
        }
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Button(Strings.skip) {
                    viewModel.handle(.skipTapped)
                }
                .font(Fonts.buttonSmall)
                .foregroundStyle(Colors.appDarkGray.swiftUIColor)
            }
        }
        .gesture(DragGesture()
            .onEnded {
                if $0.translation.width < 0 {
                    nextTapped()
                }
            }
        )
    }

    private func nextTapped() {
        withAnimation(.easeInOut) {
            viewModel.handle(.nextTapped)
        }
    }
}

// MARK: - Constants

private extension OnboardingView {

    enum Constants {

        enum Image {
            static let height: CGFloat = 264
        }

        enum Titles {
            static let height: CGFloat = 70
            static let spacing: CGFloat = 13
            static let insetTop: CGFloat = 25
            static let lineSpacing: CGFloat = 3
            static let insetHorizontal: CGFloat = 17
        }

        enum PageIndicator {
            static let insetTop: CGFloat = 40
        }

        enum Button {
            static let offsetY: CGFloat = -20
            static let insetHorizontal: CGFloat = 32
        }
    }
}
