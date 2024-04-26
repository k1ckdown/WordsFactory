//
//  RoundedBorderFieldViewModifier.swift
//
//
//  Created by Ivan Semenov on 22.03.2024.
//

import SwiftUI

struct RoundedBorderFieldViewModifier: ViewModifier {

    let cornerRadius: CGFloat

    func body(content: Content) -> some View {
        content
            .padding(.horizontal)
            .overlay {
                RoundedRectangle(cornerRadius: cornerRadius)
                    .stroke(Colors.appGray.swiftUIColor)
            }
    }
}

public extension View {
    func roundedBorderField(cornerRadius: CGFloat = 12) -> some View {
        modifier(RoundedBorderFieldViewModifier(cornerRadius: cornerRadius))
    }
}
