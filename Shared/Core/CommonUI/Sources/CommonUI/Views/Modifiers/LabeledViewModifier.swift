//
//  LabeledViewModifier.swift
//
//
//  Created by Ivan Semenov on 27.04.2024.
//

import SwiftUI

struct LabeledViewModifier: ViewModifier {

    let text: String

    func body(content: Content) -> some View {
        VStack(alignment: .leading) {
            Text(text)
                .font(Fonts.paragraphSmall)
                .foregroundStyle(Colors.appDark.swiftUIColor)

            content
        }
    }
}

public extension View {
    func labeled(_ text: String) -> some View {
        modifier(LabeledViewModifier(text: text))
    }
}
