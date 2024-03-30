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
            HStack(alignment: .bottom, spacing: Constants.wordSpacing) {
                Text(viewModel.word.capitalized)
                    .font(Fonts.headline4)

                if viewModel.isPhoneticsShowing {
                    WrappingHStack(
                        viewModel.phonetics,
                        id: \.self,
                        spacing: .constant(Constants.phoneticSpacing),
                        lineSpacing: Constants.phoneticSpacing
                    ) { phonetic in
                        HStack(spacing: Constants.phoneticContentSpacing) {
                            Text(phonetic)

                            Button {
                                viewModel.phoneticAction(phonetic)
                            } label: {
                                Images.speakerIcon.swiftUIImage
                            }
                        }
                        .font(Fonts.paragraphMedium)
                        .foregroundStyle(Colors.appOrange.swiftUIColor)
                    }
                }
            }

            VStack(alignment: .leading, spacing: Constants.meaningsHeaderSpacing) {
                Text("\(Strings.meanings):")
                    .font(Fonts.headline5)

                VStack(spacing: Constants.meaningCardSpacing) {
                    ForEach(viewModel.meanings) { meaning in
                        VStack(spacing: .zero) {
                            MeaningCardView(viewModel: meaning)

                            if meaning != viewModel.meanings.last {
                                Divider().offset(y: Constants.dividerOffsetY)
                            }
                        }
                    }
                }
            }
        }
    }
}

// MARK: - Constants

private extension WordDefinitionCardView {

    enum Constants {
        static let wordSpacing: CGFloat = 16
        static let contentSpacing: CGFloat = 20
        static let phoneticSpacing: CGFloat = 15
        static let meaningCardSpacing: CGFloat = 30
        static let meaningsHeaderSpacing: CGFloat = 10
        static let phoneticContentSpacing: CGFloat = 10
        static let dividerOffsetY: CGFloat = Constants.meaningCardSpacing / 2
    }
}
