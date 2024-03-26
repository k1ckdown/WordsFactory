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
            HStack {
                Text("\(Strings.partOfSpeech):")
                    .font(Fonts.buttonMedium)

                Text(viewModel.partOfSpeech.capitalized)
                    .font(Fonts.paragraphMedium)
            }

            VStack(alignment: .leading, spacing: Constants.definitionSpacing) {
                ForEach(viewModel.definitions, id: \.self) { definition in
                    VStack(spacing: .zero) {
                        MeaningDefinitionCardView(viewModel: definition)

                        if definition != viewModel.definitions.last {
                            Divider().offset(y: Constants.dividerOffsetY)
                        }
                    }
                }
            }
        }
        .padding()
        .overlay {
            RoundedRectangle(cornerRadius: Constants.cornerRadius)
                .stroke(Colors.appGray.swiftUIColor)
        }
    }
}

// MARK: - Constants

private extension MeaningCardView {

    enum Constants {
        static let cornerRadius: CGFloat = 15
        static let dividerOffsetY: CGFloat = 15

        static let contentSpacing: CGFloat = 20
        static let definitionSpacing: CGFloat = 30
    }
}
