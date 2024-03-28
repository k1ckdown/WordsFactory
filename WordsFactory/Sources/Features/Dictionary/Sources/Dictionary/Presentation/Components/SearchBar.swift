//
//  SearchBar.swift
//
//
//  Created by Ivan Semenov on 26.03.2024.
//

import SwiftUI
import CommonUI

struct SearchBar: View {

    let action: (String) -> Void
    @State private var text = ""

    var body: some View {
        HStack {
            TextField(Strings.search, text: $text)
                .tintColor()
                .submitLabel(.search)
                .font(Fonts.paragraphMedium)
                .foregroundStyle(Colors.appDarkGray.swiftUIColor)
                .onSubmit { action(text) }

            Button {
                action(text)
            } label: {
                Images.magnifierIcon.swiftUIImage
            }
        }
        .frame(height: Constants.height)
        .roundedBorderField()
    }
}

// MARK: - Constants

private extension SearchBar {

    enum Constants {
        static let height: CGFloat = 56
    }
}
