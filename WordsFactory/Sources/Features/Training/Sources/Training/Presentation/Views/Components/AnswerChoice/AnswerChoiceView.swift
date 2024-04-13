//
//  AnswerChoiceView.swift
//
//
//  Created by Ivan Semenov on 01.04.2024.
//

import SwiftUI
import CommonUI

struct AnswerChoiceView: View {

    let viewModel: AnswerChoiceViewModel
    @State private var isChosen = false

    var body: some View {
        Button {
            viewModel.chooseHandler()
        } label: {
            HStack(spacing: .zero) {
                Text("\(viewModel.key).")

                Text(viewModel.value.capitalized)
                    .padding(.leading)
            }
        }
        .buttonStyle(AnswerChoiceButtonStyle())
    }
}

fileprivate struct AnswerChoiceButtonStyle: ButtonStyle {

    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(Fonts.paragraphLarge)
            .foregroundStyle(Colors.appDark.swiftUIColor)
            .padding(.vertical, Constants.insetVertical)
            .padding(.horizontal, Constants.insetHorizontal)
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(background(isPressed: configuration.isPressed))
            .contentShape(.rect)
            .animation(.easeOut, value: configuration.isPressed)
    }

    @ViewBuilder
    private func background(isPressed: Bool) -> some View {
        let rectangle = RoundedRectangle(cornerRadius: Constants.cornerRadius)

        rectangle
            .stroke(isPressed ? Colors.appOrange.swiftUIColor : Colors.appGray.swiftUIColor, lineWidth: Constants.borderWidth)
            .background(rectangle.fill(isPressed ? Colors.appOrange.swiftUIColor.opacity(Constants.chosenOpacity) : .clear))
    }
}

// MARK: - Constants

private extension AnswerChoiceButtonStyle {

    enum Constants {
        static let chosenOpacity = 0.1
        static let borderWidth: CGFloat = 2
        static let cornerRadius: CGFloat = 8
        static let insetVertical: CGFloat = 21
        static let insetHorizontal: CGFloat = 24
    }
}
