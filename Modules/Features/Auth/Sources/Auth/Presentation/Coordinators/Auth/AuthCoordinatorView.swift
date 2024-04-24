//
//  AuthCoordinatorView.swift
//
//
//  Created by Ivan Semenov on 22.03.2024.
//

import SwiftUI

struct AuthCoordinatorView: View {

    private let factory: CoordinatorFactory
    @StateObject private var coordinator: AuthCoordinator

    init(factory: CoordinatorFactory, coordinator: AuthCoordinator) {
        self.factory = factory
        _coordinator = StateObject(wrappedValue: coordinator)
    }

    var body: some View {
        rootView
    }

    @ViewBuilder
    private var rootView: some View {
        switch coordinator.scene {
        case .signIn:
            factory.makeSignInCoordinator(showSignUpHandler: coordinator.showSignUp)
        case .signUp:
            factory.makeSignUpCoordinator(showSignInHandler: coordinator.showSignIn)
        }
    }
}
