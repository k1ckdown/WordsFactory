//
//  RepositoryFactory.swift
//
//
//  Created by Ivan Semenov on 24.03.2024.
//

import UserDomain

final class RepositoryFactory {

    private lazy var authRepository = AuthRepository()
    private let userRepository: UserRepositoryProtocol

    init(userRepository: UserRepositoryProtocol) {
        self.userRepository = userRepository
    }
}

// MARK: - Public methods

extension RepositoryFactory {

    func makeAuthRepository() -> AuthRepositoryProtocol {
        authRepository
    }

    func makeUserRepository() -> UserRepositoryProtocol {
        userRepository
    }
}
