//
//  UseCaseFactory.swift
//
//
//  Created by Ivan Semenov on 25.04.2024.
//

import UserDomain

final class UseCaseFactory {

    private let userRepository: UserRepositoryProtocol

    init(userRepository: UserRepositoryProtocol) {
        self.userRepository = userRepository
    }
}

// MARK: - Public methods

extension UseCaseFactory {

    func makeGetUserUseCase() -> GetUserUseCase {
        GetUserUseCase(userRepository: userRepository)
    }
}
