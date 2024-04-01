//
//  TintColorViewModifier.swift
//
//
//  Created by Ivan Semenov on 22.03.2024.
//

import SwiftUI

struct TintColorViewModifier: ViewModifier {

    let color: Color

    func body(content: Content) -> some View {
        if #available(iOS 16.0, *) {
            content.tint(color)
        } else {
            content.accentColor(color)
        }
    }
}

public extension View {
    func tintColor(_ color: Color = Colors.appOrange.swiftUIColor) -> some View {
        modifier(TintColorViewModifier(color: color))
    }
}
