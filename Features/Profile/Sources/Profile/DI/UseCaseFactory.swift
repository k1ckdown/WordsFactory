//
//  UseCaseFactory.swift
//
//
//  Created by Ivan Semenov on 25.04.2024.
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

// MARK: - Public methods

extension UseCaseFactory {

    func makeGetUserUseCase() -> GetUserUseCase {
        GetUserUseCase(userRepository: userRepository)
    }

    func makeSignOutUseCase() -> SignOutUseCase {
        SignOutUseCase(authRepository: authRepository)
    }

    func makeUpdateUserUseCase() -> UpdateUserUseCase {
        UpdateUserUseCase(userRepository: userRepository)
    }
}
