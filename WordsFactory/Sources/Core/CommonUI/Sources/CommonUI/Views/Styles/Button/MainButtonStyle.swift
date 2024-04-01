//
//  MainButtonStyle.swift
//
//
//  Created by Ivan Semenov on 19.03.2024.
//

import SwiftUI

struct MainButtonStyle: ButtonStyle {

    @Environment(\.isEnabled) private var isEnabled

    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(Fonts.buttonMedium)
            .foregroundStyle(.white)
            .frame(maxWidth: .infinity)
            .frame(height: Constants.height)
            .background(Colors.appOrange.swiftUIColor)
            .clipShape(.rect(cornerRadius: Constants.cornerRadius))
            .opacity(isEnabled ? Constants.opacityEnabled : Constants.opacityDisabled)
            .overlay {
                if configuration.isPressed {
                    RoundedRectangle(cornerRadius: Constants.cornerRadius)
                        .fill(.black.opacity(Constants.opacityPressed))
                }
            }
            .scaleEffect(configuration.isPressed ? Constants.scaleEffectPressed : Constants.scaleEffect)
            .animation(.easeOut(duration: Constants.animationDuration), value: configuration.isPressed)
    }
}

// MARK: - Constants

private extension MainButtonStyle {

    enum Constants {
        static let height: CGFloat = 56
        static let cornerRadius: CGFloat = 16

        static let scaleEffect: CGFloat = 1
        static let scaleEffectPressed: CGFloat = 0.98

        static let opacityPressed = 0.05
        static let opacityDisabled = 0.4
        static let opacityEnabled: Double = 1

        static let animationDuration: TimeInterval = 0.07
    }
}

public extension View {
    func mainButtonStyle() -> some View {
        self.buttonStyle(MainButtonStyle())
    }
}
