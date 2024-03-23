//
//  ErrorAlertViewModifier.swift
//
//
//  Created by Ivan Semenov on 23.03.2024.
//

import SwiftUI

struct ErrorAlertViewModifier: ViewModifier {

    @Binding var message: String?
    let action: (() -> Void)?

    func body(content: Content) -> some View {
        content
            .alert(Strings.error, isPresented: isPresented) {
                Button(Strings.ok, action: action ?? {})
            } message: {
                Text(message ?? "")
            }
    }

    private var isPresented: Binding<Bool> {
        Binding(
            get: { message != nil },
            set: { _ in message = nil }
        )
    }
}

public extension View {
    func errorAlert(_ message: Binding<String?>, action: (() -> Void)? = nil) -> some View {
        modifier(ErrorAlertViewModifier(message: message, action: action))
    }
}
