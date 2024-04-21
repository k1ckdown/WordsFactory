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

    private let flowFinishHandler: () -> Void
    private let showSignUpHandler: () -> Void

    init(flowFinishHandler: @escaping () -> Void, showSignUpHandler: @escaping () -> Void) {
        self.flowFinishHandler = flowFinishHandler
        self.showSignUpHandler = showSignUpHandler
    }
}

// MARK: - SignInCoordinatorProtocol

extension SignInCoordinator: SignInCoordinatorProtocol {

    func finish() {
        flowFinishHandler()
    }

    func showSignUp() {
        showSignUpHandler()
    }

    func showError(message: String) {
        errorMessage = message
    }
}
