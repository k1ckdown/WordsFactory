//
//  KeyboardHideableViewModifier.swift
//
//
//  Created by Ivan Semenov on 22.03.2024.
//

import SwiftUI

struct KeyboardHideableViewModifier<Field: Hashable>: ViewModifier {

    var focusedField: FocusState<Field?>.Binding

    func body(content: Content) -> some View {
        content
            .onTapGesture {
                focusedField.wrappedValue = nil
            }
    }
}

public extension View {
    func keyboardHideable<Field>(_ focusedField: FocusState<Field?>.Binding) -> some View {
        modifier(KeyboardHideableViewModifier(focusedField: focusedField))
    }
}
