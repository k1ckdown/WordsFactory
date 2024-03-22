//
//  AuthBorderedTextFieldStyle.swift
//
//
//  Created by Ivan Semenov on 22.03.2024.
//

import SwiftUI

struct AuthBorderedTextFieldStyle: TextFieldStyle {

    func _body(configuration: TextField<Self._Label>) -> some View {
        configuration
            .authTextFieldStyle()
            .roundedBorder()
    }
}

extension View {
    func authBorderedTextFieldStyle() -> some View {
        textFieldStyle(AuthBorderedTextFieldStyle())
    }
}
