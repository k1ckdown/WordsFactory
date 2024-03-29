//
//  AuthCoordinatorView.swift
//
//
//  Created by Ivan Semenov on 22.03.2024.
//

import SwiftUI

public struct AuthCoordinatorView: View {

    private let screenFactory: ScreenFactory
    @ObservedObject private var coordinator: AuthCoordinator

    init(coordinator: AuthCoordinator, screenFactory: ScreenFactory) {
        self.coordinator = coordinator
        self.screenFactory = screenFactory
    }

    public var body: some View {
        NavigationView {
            sceneCoordinator
        }
    }

    @ViewBuilder
    private var sceneCoordinator: some View {
        switch coordinator.scene {
        case .signIn:
            SignInCoordinatorView(coordinator: coordinator.signInCoordinator, screenFactory: screenFactory)
        case .signUp:
            SignUpCoordinatorView(coordinator: coordinator.signUpCoordinator, screenFactory: screenFactory)
        }
    }
}
