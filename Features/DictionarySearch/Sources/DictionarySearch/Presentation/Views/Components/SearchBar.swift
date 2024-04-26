//
//  SearchBar.swift
//
//
//  Created by Ivan Semenov on 26.03.2024.
//

import SwiftUI
import CommonUI

struct SearchBar: View {

    let handler: (String) -> Void
    @State private var text = ""

    var body: some View {
        HStack {
            TextField("", text: $text)
                .mainTextFieldStyle()
                .submitLabel(.search)
                .onSubmit { handler(text) }

            Button {
                handler(text)
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
