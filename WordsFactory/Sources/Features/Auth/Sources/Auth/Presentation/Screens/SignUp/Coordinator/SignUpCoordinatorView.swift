//
//  SignUpCoordinatorView.swift
//
//
//  Created by Ivan Semenov on 24.03.2024.
//

import SwiftUI

struct SignUpCoordinatorView: View {
    typealias Factory = SignUpScreenFactory

    private let factory: Factory
    @ObservedObject private var coordinator: SignUpCoordinator

    init(factory: Factory, coordinator: SignUpCoordinator) {
        self.factory = factory
        self.coordinator = coordinator
    }

    var body: some View {
        factory.makeSignUpScreen(coordinator: coordinator)
            .errorAlert($coordinator.errorMessage)
    }
}
