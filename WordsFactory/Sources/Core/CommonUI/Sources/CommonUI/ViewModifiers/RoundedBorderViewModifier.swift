//
//  RoundedBorderViewModifier.swift
//
//
//  Created by Ivan Semenov on 22.03.2024.
//

import SwiftUI

struct RoundedBorderViewModifier: ViewModifier {

    let cornerRadius: CGFloat

    func body(content: Content) -> some View {
        content
            .padding(.horizontal)
            .overlay {
                RoundedRectangle(cornerRadius: cornerRadius)
                    .stroke(Colors.appDarkGray.swiftUIColor)
            }
    }
}

public extension View {
    func roundedBorder(_ cornerRadius: CGFloat = 10) -> some View {
        modifier(RoundedBorderViewModifier(cornerRadius: cornerRadius))
    }
}
