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
            .font(Fonts.paragraphMedium)
            .tintColor()
            .foregroundStyle(Colors.appDarkGray.swiftUIColor)
            .frame(height: Constants.height)
            .frame(maxWidth: .infinity)
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
