//
//  MeaningCardView.swift
//
//
//  Created by Ivan Semenov on 26.03.2024.
//

import SwiftUI
import CommonUI

struct MeaningCardView: View {

    let viewModel: MeaningCardViewModel

    var body: some View {
        VStack(alignment: .leading, spacing: Constants.contentSpacing) {
            HStack(alignment: .bottom) {
                Text("\(Strings.partOfSpeech):")
                    .font(Fonts.buttonMedium)

                Text(viewModel.partOfSpeech.capitalized)
                    .font(Fonts.paragraphMedium)
            }

            VStack(alignment: .leading, spacing: Constants.definitionSpacing) {
                ForEach(viewModel.definitions) { definition in
                    MeaningDefinitionCardView(viewModel: definition)
                }
            }
        }
    }
}

// MARK: - Constants

private extension MeaningCardView {

    enum Constants {
        static let contentSpacing: CGFloat = 15
        static let definitionSpacing: CGFloat = 13
    }
}
