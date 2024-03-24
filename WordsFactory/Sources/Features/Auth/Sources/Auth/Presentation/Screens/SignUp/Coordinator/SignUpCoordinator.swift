//
//  SignUpCoordinator.swift
//
//
//  Created by Ivan Semenov on 24.03.2024.
//

import Foundation

final class SignUpCoordinator: ObservableObject {

    @Published var errorMessage: String?

    private let onFlowFinish: () -> Void
    private let showSignInHandler: () -> Void

    init(onFlowFinish: @escaping () -> Void, showSignInHandler: @escaping () -> Void) {
        self.onFlowFinish = onFlowFinish
        self.showSignInHandler = showSignInHandler
    }
}

// MARK: - Public methods

@MainActor
extension SignUpCoordinator {

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
