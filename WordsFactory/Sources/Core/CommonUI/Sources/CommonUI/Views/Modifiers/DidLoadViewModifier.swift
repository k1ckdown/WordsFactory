//
//  DidLoadViewModifier.swift
//
//
//  Created by Ivan Semenov on 05.04.2024.
//

import SwiftUI

struct DidLoadViewModifier: ViewModifier {

    let action: () -> Void
    @State private var isLoaded = false

    func body(content: Content) -> some View {
        content
            .onAppear {
                if isLoaded == false {
                    action()
                    isLoaded = true
                }
            }
    }
}

public extension View {
    func didLoad(perform action: @escaping () -> Void) -> some View {
        modifier(DidLoadViewModifier(action: action))
    }
}
