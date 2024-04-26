//
//  UpdateUserUseCase.swift
//
//
//  Created by Ivan Semenov on 26.04.2024.
//

import UserDomain

final class UpdateUserUseCase {

    private let userRepository: UserRepositoryProtocol

    init(userRepository: UserRepositoryProtocol) {
        self.userRepository = userRepository
    }

    func execute(_ user: UserEdit) async throws {
        try await userRepository.updateUser(user)
    }
}
