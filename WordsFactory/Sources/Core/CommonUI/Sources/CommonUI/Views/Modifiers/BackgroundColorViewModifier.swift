//
//  BackgroundColorViewModifier.swift
//
//
//  Created by Ivan Semenov on 22.03.2024.
//

import SwiftUI

struct BackgroundColorViewModifier: ViewModifier {

    let color: Color

    func body(content: Content) -> some View {
        ZStack {
            color.ignoresSafeArea()
            content
        }
    }
}

public extension View {
    func backgroundColor(_ color: Color = .white) -> some View {
        modifier(BackgroundColorViewModifier(color: color))
    }
}
