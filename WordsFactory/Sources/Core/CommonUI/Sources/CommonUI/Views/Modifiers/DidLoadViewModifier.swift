//
//  DidLoadViewModifier.swift
//
//
//  Created by Ivan Semenov on 05.04.2024.
//

import SwiftUI

struct DidLoadViewModifier: ViewModifier {

    let perform: () -> Void
    @State private var isLoaded = false

    func body(content: Content) -> some View {
        content
            .onAppear {
                if isLoaded == false {
                    perform()
                    isLoaded = true
                }
            }
    }
}

public extension View {
    func didLoad(_ perform: @escaping () -> Void) -> some View {
        modifier(DidLoadViewModifier(perform: perform))
    }
}
