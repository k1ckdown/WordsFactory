//
//  RoundedBorderFieldViewModifier.swift
//
//
//  Created by Ivan Semenov on 22.03.2024.
//

import SwiftUI

struct RoundedBorderFieldViewModifier: ViewModifier {

    func body(content: Content) -> some View {
        content
            .padding(.horizontal)
            .overlay {
                RoundedRectangle(cornerRadius: Constants.cornerRadius)
                    .stroke(Colors.appGray.swiftUIColor)
            }
    }
}

// MARK: - Constants

private extension RoundedBorderFieldViewModifier {

    enum Constants {
        static let cornerRadius: CGFloat = 12
    }
}

public extension View {
    func roundedBorderField() -> some View {
        modifier(RoundedBorderFieldViewModifier())
    }
}
