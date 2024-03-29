//
//  SignUpCoordinator.swift
//
//
//  Created by Ivan Semenov on 24.03.2024.
//

import Foundation

@MainActor
protocol SignUpCoordinatorProtocol {
    func finish()
    func showSignIn()
    func showError(message: String)
}

final class SignUpCoordinator: ObservableObject {

    @Published var errorMessage: String?

    private let onFlowFinish: () -> Void
    private let showSignInHandler: () -> Void

    init(onFlowFinish: @escaping () -> Void, showSignInHandler: @escaping () -> Void) {
        self.onFlowFinish = onFlowFinish
        self.showSignInHandler = showSignInHandler
    }
}

// MARK: - SignUpCoordinatorProtocol

extension SignUpCoordinator: SignUpCoordinatorProtocol {

    func finish() {
        onFlowFinish()
    }

    func showSignIn() {
        showSignInHandler()
    }

    func showError(message: String) {
        errorMessage = message
    }
}
