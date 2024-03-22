//
//  SecureTextField.swift
//
//
//  Created by Ivan Semenov on 22.03.2024.
//

import SwiftUI
import CommonUI

struct SecureTextField: View {

    let placeholder: String
    @Binding var text: String
    @State private var isSecure = false

    init(_ placeholder: String, text: Binding<String>) {
        _text = text
        self.placeholder = placeholder
    }

    var body: some View {
        HStack {
            textField.authTextFieldStyle()

            Button {
                isSecure.toggle()
            } label: {
                (isSecure ? Images.eyeIcon : Images.eyeSlashIcon).swiftUIImage
            }
        }
        .roundedBorder()
    }

    @ViewBuilder
    private var textField: some View {
        if isSecure {
            SecureField(placeholder, text: $text)
        } else {
            TextField(placeholder, text: $text)
        }
    }
}
