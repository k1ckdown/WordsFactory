//
//  SignInCoordinatorView.swift
//
//
//  Created by Ivan Semenov on 24.03.2024.
//

import SwiftUI

struct SignInCoordinatorView: View {

    private let screenFactory: ScreenFactory
    @ObservedObject private var coordinator: SignInCoordinator

    init(coordinator: SignInCoordinator, screenFactory: ScreenFactory) {
        self.screenFactory = screenFactory
        self.coordinator = coordinator
    }

    var body: some View {
        screenFactory.makeSignIn(coordinator: coordinator)
            .errorAlert($coordinator.errorMessage)
    }
}
