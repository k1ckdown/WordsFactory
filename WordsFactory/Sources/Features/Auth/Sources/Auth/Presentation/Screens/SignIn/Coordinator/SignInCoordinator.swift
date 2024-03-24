//
//  SignInCoordinator.swift
//
//
//  Created by Ivan Semenov on 24.03.2024.
//

import Foundation

final class SignInCoordinator: ObservableObject {

    @Published var errorMessage: String?

    private let onFlowFinish: () -> Void
    private let showSignUpHandler: () -> Void

    init(onFlowFinish: @escaping () -> Void, showSignUpHandler: @escaping () -> Void) {
        self.onFlowFinish = onFlowFinish
        self.showSignUpHandler = showSignUpHandler
    }
}

// MARK: - Public methods

@MainActor
extension SignInCoordinator {

    func finish() {
        onFlowFinish()
    }

    func showSignUp() {
        showSignUpHandler()
    }

    func showError(message: String) {
        errorMessage = message
    }
}
