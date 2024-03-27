//
//  DictionaryPlaceholderView.swift
//
//
//  Created by Ivan Semenov on 27.03.2024.
//

import SwiftUI
import CommonUI

struct DictionaryPlaceholderView: View {

    var body: some View {
        VStack(spacing: Constants.imageSpacing) {
            Images.dictionaryPlaceholder.swiftUIImage

            VStack(spacing: Constants.textSpacing) {
                Text(Strings.noWord)
                    .font(Fonts.headline4)
                    .foregroundStyle(Colors.appDark.swiftUIColor)

                Text(Strings.findInDictionary)
                    .font(Fonts.paragraphMedium)
                    .foregroundStyle(Colors.appDarkGray.swiftUIColor)
            }
        }
    }
}

// MARK: - Constants

private extension DictionaryPlaceholderView {
    
    enum Constants {
        static let textSpacing: CGFloat = 8
        static let imageSpacing: CGFloat = 32
    }
}
