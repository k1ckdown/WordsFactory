//
//  WordCardView.swift
//
//
//  Created by Ivan Semenov on 26.03.2024.
//

import SwiftUI
import CommonUI

struct WordCardView: View {

    let viewModel: WordCardViewModel

    var body: some View {
        VStack(alignment: .leading, spacing: Constants.contentSpacing) {
            HStack(alignment: .bottom, spacing: Constants.wordSpacing) {
                Text(viewModel.text.capitalized)
                    .font(Fonts.headline4)

                if viewModel.isPhoneticsShowing {
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: Constants.phoneticSpacing) {
                            ForEach(viewModel.phonetics) { phonetic in
                                PhoneticItemView(viewModel: phonetic)
                            }
                        }
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

private extension WordCardView {

    enum Constants {
        static let wordSpacing: CGFloat = 16
        static let contentSpacing: CGFloat = 20
        static let phoneticSpacing: CGFloat = 15
        static let meaningCardSpacing: CGFloat = 30
        static let meaningsHeaderSpacing: CGFloat = 10
        static let dividerOffsetY: CGFloat = Constants.meaningCardSpacing / 2
    }
}
