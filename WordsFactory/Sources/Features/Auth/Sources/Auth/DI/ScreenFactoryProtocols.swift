//
//  ScreenFactoryProtocols.swift
//
//
//  Created by Ivan Semenov on 24.03.2024.
//

protocol SignInScreenFactory {
    func makeSignInScreen(coordinator: SignInCoordinator) -> SignInView
}

protocol SignUpScreenFactory {
    func makeSignUpScreen(coordinator: SignUpCoordinator) -> SignUpView
}
