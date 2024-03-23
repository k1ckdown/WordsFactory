//
//  ScreenFactoryProtocols.swift
//
//
//  Created by Ivan Semenov on 24.03.2024.
//

protocol SignInScreenFactory {
    func makeSignIn(coordinator: SignInCoordinator) -> SignInView
}

protocol SignUpScreenFactory {
    func makeSignUp(coordinator: SignUpCoordinator) -> SignUpView
}
