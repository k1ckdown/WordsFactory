//
//  OnBoardingView.swift
//
//
//  Created by Ivan Semenov on 20.03.2024.
//

import SwiftUI
import CommonUI

struct OnBoardingView: View {

    let page: Int
    let image: Image
    let title: String
    let subtitle: String
    let buttonTitle: String
    let skipAction: () -> Void
    let continueAction: () -> Void

    var body: some View {
        VStack {
            VStack(spacing: .zero) {
                image
                    .resizable()
                    .scaledToFit()
                    .frame(height: Constants.Image.height)

                Group {
                    VStack(spacing: Constants.Titles.spacing) {
                        Text(title)
                            .font(Fonts.headline4)
                            .foregroundStyle(Colors.appDark.swiftUIColor)

                        Text(subtitle)
                            .font(Fonts.paragraphMedium)
                            .foregroundStyle(Colors.appDarkGray.swiftUIColor)
                    }
                    .multilineTextAlignment(.center)
                    .lineSpacing(Constants.Titles.lineSpacing)
                    .padding(.top, Constants.Titles.insetTop)

                    PageIndicator(page)
                        .padding(.top, Constants.PageIndicator.insetTop)
                }
                .padding(.horizontal, Constants.Titles.insetHorizontal)
            }
            .frame(maxHeight: .infinity)

            Button(buttonTitle, action: continueAction)
                .mainButtonStyle()
                .offset(y: Constants.Button.offsetY)
                .padding(.horizontal, Constants.Button.insetHorizontal)
        }
        .backgroundColor()
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Button(Strings.skip, action: skipAction)
                    .font(Fonts.buttonSmall)
                    .foregroundStyle(Colors.appDarkGray.swiftUIColor)
            }
        }
        .gesture(DragGesture()
            .onEnded {
                if $0.translation.width < 0 {
                    continueAction()
                }
            }
        )
    }
}

// MARK: - Constants

private extension OnBoardingView {

    enum Constants {

        enum Image {
            static let height: CGFloat = 264
        }

        enum Titles {
            static let spacing: CGFloat = 13
            static let insetTop: CGFloat = 25
            static let lineSpacing: CGFloat = 3
            static let insetHorizontal: CGFloat = 17
        }

        enum PageIndicator {
            static let insetTop: CGFloat = 40
        }

        enum Button {
            static let offsetY: CGFloat = -15
            static let insetHorizontal: CGFloat = 32
        }
    }
}
