//
//  AuthTextFieldStyle.swift
//
//
//  Created by Ivan Semenov on 22.03.2024.
//

import SwiftUI
import CommonUI

struct AuthTextFieldStyle: TextFieldStyle {

    func _body(configuration: TextField<Self._Label>) -> some View {
        configuration
            .mainTextFieldStyle()
            .frame(height: Constants.height)
    }
}

// MARK: - Constants

private extension AuthTextFieldStyle {

    enum Constants {
        static let height: CGFloat = 53
    }
}

extension View {
    func authTextFieldStyle() -> some View {
        textFieldStyle(AuthTextFieldStyle())
    }
}
