//
//  AuthCoordinator.swift
//
//
//  Created by Ivan Semenov on 23.03.2024.
//

import Foundation

final class AuthCoordinator: ObservableObject {

    enum Scene {
        case signIn
        case signUp
    }

    @Published private(set) var scene = Scene.signIn
    private let onFlowFinish: () -> Void

    init(onFlowFinish: @escaping () -> Void) {
        self.onFlowFinish = onFlowFinish
    }
}

// MARK: - Scene Coordinators

extension AuthCoordinator {
    
    var signInCoordinator: SignInCoordinator {
        SignInCoordinator(
            onFlowFinish: onFlowFinish,
            showSignUpHandler: { [weak self] in self?.scene = .signUp }
        )
    }

    var signUpCoordinator: SignUpCoordinator {
        SignUpCoordinator(
            onFlowFinish: onFlowFinish,
            showSignInHandler: { [weak self] in self?.scene = .signIn }
        )
    }
}
