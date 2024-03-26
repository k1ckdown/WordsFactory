//
//  MeaningDefinitionCardView.swift
//
//
//  Created by Ivan Semenov on 26.03.2024.
//

import SwiftUI
import CommonUI

struct MeaningDefinitionCardView: View {

    let viewModel: MeaningDefinitionCardViewModel

    var body: some View {
        VStack(alignment: .leading, spacing: Constants.spacing) {
            Text(viewModel.definition)

            if let example = viewModel.example {
                HStack {
                    Text(Strings.example)
                        .foregroundStyle(Colors.appBlue.swiftUIColor)

                    Text(example)
                }
            }
        }
        .font(Fonts.paragraphMedium)
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

// MARK: - Constants

private extension MeaningDefinitionCardView {

    enum Constants {
        static let spacing: CGFloat = 10
    }
}
