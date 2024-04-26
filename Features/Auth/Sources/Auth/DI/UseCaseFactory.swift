//
//  UseCaseFactory.swift
//
//
//  Created by Ivan Semenov on 23.03.2024.
//

import AuthDomain
import UserDomain

final class UseCaseFactory {

    private let userRepository: UserRepositoryProtocol
    private let authRepository: AuthRepositoryProtocol

    init(userRepository: UserRepositoryProtocol, authRepository: AuthRepositoryProtocol) {
        self.userRepository = userRepository
        self.authRepository = authRepository
    }
}

// MARK: - Auth

extension UseCaseFactory {

    func makeSignInUseCase() -> SignInUseCase {
        SignInUseCase(authRepository: authRepository)
    }

    func makeSignUpUseCase() -> SignUpUseCase {
        SignUpUseCase(
            authRepository: authRepository,
            userRepository: userRepository
        )
    }
}

// MARK: - Validation

extension UseCaseFactory {

    func makeValidateEmailUseCase() -> ValidateEmailUseCase {
        ValidateEmailUseCase()
    }

    func makeValidatePasswordUseCase() -> ValidatePasswordUseCase {
        ValidatePasswordUseCase()
    }

    func makeValidateUsernameUseCase() -> ValidateUsernameUseCase {
        ValidateUsernameUseCase()
    }
}
