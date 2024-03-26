//
//  WordDefinitionCardView.swift
//
//
//  Created by Ivan Semenov on 26.03.2024.
//

import SwiftUI
import CommonUI
import WrappingHStack

struct WordDefinitionCardView: View {

    let viewModel: WordDefinitionCardViewModel

    var body: some View {
        VStack(alignment: .leading, spacing: Constants.contentSpacing) {
            VStack(alignment: .leading, spacing: Constants.wordSpacing) {
                Text(viewModel.word.capitalized)
                    .font(Fonts.headline4)

                WrappingHStack(
                    viewModel.phonetics,
                    id: \.self,
                    spacing: .constant(Constants.phoneticSpacing),
                    lineSpacing: Constants.phoneticSpacing
                ) { phonetic in
                    HStack(spacing: Constants.phoneticContentSpacing) {
                        Text(phonetic)

                        Button {
                            viewModel.phoneticTapped(phonetic)
                        } label: {
                            Images.speakerIcon.swiftUIImage
                        }
                    }
                    .font(Fonts.paragraphMedium)
                    .foregroundStyle(Colors.appOrange.swiftUIColor)
                }
            }

            VStack(alignment: .leading) {
                Text("\(Strings.meanings):")
                    .font(Fonts.headline5)

                VStack(spacing: Constants.meaningCardSpacing) {
                    ForEach(viewModel.meanings, id: \.self) { meaning in
                        MeaningCardView(viewModel: meaning)
                    }
                }
            }
        }
    }
}

// MARK: - Constants

private extension WordDefinitionCardView {

    enum Constants {
        static let wordSpacing: CGFloat = 10
        static let contentSpacing: CGFloat = 20
        static let phoneticSpacing: CGFloat = 15
        static let meaningCardSpacing: CGFloat = 20
        static let phoneticContentSpacing: CGFloat = 10
    }
}
