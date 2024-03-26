//
//  MainButtonStyle.swift
//
//
//  Created by Ivan Semenov on 19.03.2024.
//

import SwiftUI

struct MainButtonStyle: ButtonStyle {

    @Environment(\.isEnabled) private var isEnabled

    private var opacity: Double {
        isEnabled ? Constants.opacityEnabled : Constants.opacityDisabled
    }

    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(Fonts.buttonMedium)
            .foregroundStyle(.white)
            .frame(maxWidth: .infinity)
            .frame(height: Constants.height)
            .background(Colors.appOrange.swiftUIColor)
            .clipShape(.rect(cornerRadius: Constants.cornerRadius))
            .opacity(configuration.isPressed ? Constants.opacityPressed : opacity)
            .scaleEffect(configuration.isPressed ? Constants.scaleEffectPressed : Constants.scaleEffect)
    }
}

// MARK: - Constants

private extension MainButtonStyle {

    enum Constants {
        static let height: CGFloat = 56
        static let cornerRadius: CGFloat = 16

        static let scaleEffect: CGFloat = 1
        static let scaleEffectPressed: CGFloat = 0.98

        static let opacityEnabled: Double = 1
        static let opacityPressed = 0.9
        static let opacityDisabled = 0.4
    }
}

public extension View {
    func mainButtonStyle() -> some View {
        self.buttonStyle(MainButtonStyle())
    }
}
