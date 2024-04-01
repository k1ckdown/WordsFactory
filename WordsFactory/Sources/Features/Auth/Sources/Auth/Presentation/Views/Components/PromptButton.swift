//
//  PromptButtonStyle.swift
//
//
//  Created by Ivan Semenov on 22.03.2024.
//

import SwiftUI
import CommonUI

struct PromptButton: View {

    let text: String
    let title: String
    let action: () -> Void

    init(_ text: String, _ title: String, action: @escaping () -> Void) {
        self.text = text
        self.title = title
        self.action = action
    }

    var body: some View {
        HStack(spacing: Constants.spacing) {
            Text(text)
                .foregroundStyle(Colors.appDarkGray.swiftUIColor)

            Button(title, action: action)
                .foregroundStyle(Colors.appOrange.swiftUIColor)
        }
        .font(Fonts.paragraphMedium)
    }
}

// MARK: - Constants

private extension PromptButton {

    enum Constants {
        static let spacing: CGFloat = 5
    }
}
