//
//  SignUpCoordinator.swift
//
//
//  Created by Ivan Semenov on 24.03.2024.
//

import Foundation

protocol SignUpCoordinatorProtocol: AnyObject {
    func finish()
    func showSignIn()
    func showError(message: String)
}

final class SignUpCoordinator: ObservableObject {

    @Published var errorMessage: String?

    private let flowFinishHandler: () -> Void
    private let showSignInHandler: () -> Void

    init(flowFinishHandler: @escaping () -> Void, showSignInHandler: @escaping () -> Void) {
        self.flowFinishHandler = flowFinishHandler
        self.showSignInHandler = showSignInHandler
    }
}

// MARK: - SignUpCoordinatorProtocol

extension SignUpCoordinator: SignUpCoordinatorProtocol {

    func finish() {
        flowFinishHandler()
    }

    func showSignIn() {
        showSignInHandler()
    }

    func showError(message: String) {
        errorMessage = message
    }
}
