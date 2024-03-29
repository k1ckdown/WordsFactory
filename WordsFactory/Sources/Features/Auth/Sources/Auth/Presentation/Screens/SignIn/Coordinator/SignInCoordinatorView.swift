//
//  SignInCoordinatorView.swift
//
//
//  Created by Ivan Semenov on 24.03.2024.
//

import SwiftUI

struct SignInCoordinatorView: View {
    typealias Factory = SignInScreenFactory

    private let factory: Factory
    @ObservedObject private var coordinator: SignInCoordinator

    init(factory: Factory, coordinator: SignInCoordinator) {
        self.factory = factory
        self.coordinator = coordinator
    }

    var body: some View {
        factory.makeSignInScreen(coordinator: coordinator)
            .errorAlert($coordinator.errorMessage)
    }
}
