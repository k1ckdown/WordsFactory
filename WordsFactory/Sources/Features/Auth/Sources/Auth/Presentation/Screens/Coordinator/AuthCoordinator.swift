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
    private let flowFinishHandler: () -> Void

    init(flowFinishHandler: @escaping () -> Void) {
        self.flowFinishHandler = flowFinishHandler
    }
}

// MARK: - Scene Coordinators

extension AuthCoordinator {
    
    var signInCoordinator: SignInCoordinator {
        SignInCoordinator(
            flowFinishHandler: flowFinishHandler,
            showSignUpHandler: { [weak self] in self?.scene = .signUp }
        )
    }

    var signUpCoordinator: SignUpCoordinator {
        SignUpCoordinator(
            flowFinishHandler: flowFinishHandler,
            showSignInHandler: { [weak self] in self?.scene = .signIn }
        )
    }
}
