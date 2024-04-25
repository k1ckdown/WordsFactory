//
//  MainTextFieldStyle.swift
//
//
//  Created by Ivan Semenov on 25.04.2024.
//

import SwiftUI

struct MainTextFieldStyle: TextFieldStyle {

    func _body(configuration: TextField<Self._Label>) -> some View {
        configuration
            .tintColor()
            .font(Fonts.paragraphMedium)
            .foregroundStyle(Colors.appDarkGray.swiftUIColor)
    }
}

public extension View {
    func mainTextFieldStyle() -> some View {
        textFieldStyle(MainTextFieldStyle())
    }
}
