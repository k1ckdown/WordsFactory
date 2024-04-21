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
}

// MARK: - Public methods

extension AuthCoordinator {

    func showSignUp() {
        scene = .signUp
    }

    func showSignIn() {
        scene = .signIn
    }
}
