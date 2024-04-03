//
//  AuthCoordinatorView.swift
//
//
//  Created by Ivan Semenov on 22.03.2024.
//

import SwiftUI

struct AuthCoordinatorView: View {

    private let screenFactory: ScreenFactory
    @ObservedObject private var coordinator: AuthCoordinator

    init(coordinator: AuthCoordinator, screenFactory: ScreenFactory) {
        self.coordinator = coordinator
        self.screenFactory = screenFactory
    }

    var body: some View {
        sceneCoordinator
    }

    @ViewBuilder
    private var sceneCoordinator: some View {
        switch coordinator.scene {
        case .signIn:
            SignInCoordinatorView(factory: screenFactory, coordinator: coordinator.signInCoordinator)
        case .signUp:
            SignUpCoordinatorView(factory: screenFactory, coordinator: coordinator.signUpCoordinator)
        }
    }
}
