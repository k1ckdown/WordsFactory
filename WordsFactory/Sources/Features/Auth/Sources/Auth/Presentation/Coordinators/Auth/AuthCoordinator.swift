//
//  AuthCoordinator.swift
//
//
//  Created by Ivan Semenov on 23.03.2024.
//

import SwiftUI

final class AuthCoordinator: ObservableObject {

    enum Scene {
        case signIn
        case signUp
    }

    @Published private(set) var scene = Scene.signIn
    private let factory: CoordinatorFactory

    init(factory: CoordinatorFactory) {
        self.factory = factory
    }

    @ViewBuilder
    var view: some View {
        switch scene {
        case .signIn: signInCoordinatorView()
        case .signUp: signUpCoordinatorView()
        }
    }
}


// MARK: - Private methods

private extension AuthCoordinator {

    func signInCoordinatorView() -> SignInCoordinatorView<SignInView>{
        factory.makeSignInCoordinator { [weak self] in
            self?.scene = .signUp
        }
    }

    func signUpCoordinatorView() -> SignUpCoordinatorView<SignUpView> {
        factory.makeSignUpCoordinator { [weak self] in
            self?.scene = .signIn
        }
    }
}
