//
//  SignInCoordinatorFactory.swift
//
//
//  Created by Ivan Semenov on 21.04.2024.
//

protocol SignInCoordinatorFactory {
    func makeSignInCoordinator(showSignUpHandler: @escaping () -> Void) -> SignInCoordinatorView<SignInView>
}

protocol SignUpCoordinatorFactory {
    func makeSignUpCoordinator(showSignInHandler: @escaping () -> Void) -> SignUpCoordinatorView<SignUpView>
}
