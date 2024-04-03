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
                .lineSpacing(Constants.definitionLineSpacing)

            if let example = viewModel.example {
                HStack {
                    Text("\(Strings.example):")
                        .foregroundStyle(Colors.appBlue.swiftUIColor)

                    Text(example)
                }
            }
        }
        .font(Fonts.paragraphMedium)
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding()
        .overlay {
            RoundedRectangle(cornerRadius: Constants.cornerRadius)
                .stroke(Colors.appDarkGray.swiftUIColor)
        }
    }
}

// MARK: - Constants

private extension MeaningDefinitionCardView {

    enum Constants {
        static let spacing: CGFloat = 15
        static let cornerRadius: CGFloat = 16
        static let definitionLineSpacing: CGFloat = 5
    }
}
