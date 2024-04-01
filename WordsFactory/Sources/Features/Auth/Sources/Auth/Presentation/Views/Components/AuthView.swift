//
//  AuthView.swift
//
//
//  Created by Ivan Semenov on 22.03.2024.
//

import SwiftUI
import CommonUI

struct AuthView<Content: View>: View {

    let title: String
    let subtitle: String

    let buttonTitle: String
    let promptText: String
    let promptTitle: String

    let isLoading: Bool
    let action: () -> Void
    let promptAction: () -> Void
    @ViewBuilder let content: Content

    var body: some View {
        VStack {
            VStack(spacing: Constants.spacing) {
                Images.auth.swiftUIImage
                    .resizable()
                    .scaledToFit()
                    .frame(maxHeight: Constants.imageMaxHeight)

                VStack(spacing: Constants.titleSpacing) {
                    Text(title)
                        .font(Fonts.headline4)
                        .foregroundStyle(Colors.appDark.swiftUIColor)

                    Text(subtitle)
                        .font(Fonts.paragraphMedium)
                        .foregroundStyle(Colors.appDarkGray.swiftUIColor)
                }

                content
                    .autocorrectionDisabled()
                    .textInputAutocapitalization(.never)

                if isLoading {
                    ProgressView()
                        .tintColor()
                }

                Button(buttonTitle, action: action)
                    .mainButtonStyle()
            }
            .frame(maxHeight: .infinity)

            PromptButton(promptText, promptTitle, action: promptAction)
                .padding(.vertical, Constants.promptInsetVertical)
        }
        .padding(.horizontal, Constants.insetHorizontal)
        .backgroundColor()
    }
}

// MARK: - Constants

private extension AuthView {

    enum Constants {
        static var spacing: CGFloat { 16 }
        static var titleSpacing: CGFloat { 8 }
        static var imageMaxHeight: CGFloat { 253 }
        static var insetHorizontal: CGFloat { 16 }
        static var promptInsetVertical: CGFloat { 15 }
    }
}
