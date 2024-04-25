//
//  RepositoryFactory.swift
//
//
//  Created by Ivan Semenov on 25.04.2024.
//

import UserModuleAPI

final class RepositoryFactory {

    private let userRepository: UserRepositoryProtocol

    init(userRepository: UserRepositoryProtocol) {
        self.userRepository = userRepository
    }
}

// MARK: - Public methods

extension RepositoryFactory {

    func makeUserRepository() -> UserRepositoryProtocol {
        userRepository
    }
}
