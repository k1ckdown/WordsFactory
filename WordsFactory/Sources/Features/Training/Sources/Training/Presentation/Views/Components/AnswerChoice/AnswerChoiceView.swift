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
        HStack(spacing: .zero) {
            Text("\(viewModel.key).")

            Text(viewModel.value.capitalized)
                .padding(.leading)
        }
        .font(Fonts.paragraphLarge)
        .foregroundStyle(Colors.appDark.swiftUIColor)
        .padding(.vertical, Constants.insetVertical)
        .padding(.horizontal, Constants.insetHorizontal)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(background)
        .onTapGesture {
            isChosen.toggle()
            viewModel.chooseHandler()
        }
    }

    @ViewBuilder
    private var background: some View {
        let rectangle = RoundedRectangle(cornerRadius: Constants.cornerRadius)

        rectangle
            .stroke(isChosen ? Colors.appOrange.swiftUIColor : Colors.appGray.swiftUIColor, lineWidth: Constants.borderWidth)
            .background(rectangle.fill(isChosen ? Colors.appOrange.swiftUIColor.opacity(Constants.chosenOpacity) : .clear))
    }
}

// MARK: - Constants

private extension AnswerChoiceView {

    enum Constants {
        static let chosenOpacity = 0.1
        static let borderWidth: CGFloat = 2
        static let cornerRadius: CGFloat = 8
        static let insetVertical: CGFloat = 21
        static let insetHorizontal: CGFloat = 24
    }
}
