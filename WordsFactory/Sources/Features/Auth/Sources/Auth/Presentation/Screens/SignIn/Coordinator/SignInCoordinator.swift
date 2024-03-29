//
//  SignInCoordinator.swift
//
//
//  Created by Ivan Semenov on 24.03.2024.
//

import Foundation

@MainActor
protocol SignInCoordinatorProtocol {
    func finish()
    func showSignUp()
    func showError(message: String)
}

final class SignInCoordinator: ObservableObject {

    @Published var errorMessage: String?

    private let onFlowFinish: () -> Void
    private let showSignUpHandler: () -> Void

    init(onFlowFinish: @escaping () -> Void, showSignUpHandler: @escaping () -> Void) {
        self.onFlowFinish = onFlowFinish
        self.showSignUpHandler = showSignUpHandler
    }
}

// MARK: - SignInCoordinatorProtocol

extension SignInCoordinator: SignInCoordinatorProtocol {

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
