//
//  GetUserUseCase.swift
//
//
//  Created by Ivan Semenov on 25.04.2024.
//

import UserModuleAPI

final class GetUserUseCase: GetUserUseCaseProtocol {

    private let userRepository: UserRepositoryProtocol

    init(userRepository: UserRepositoryProtocol) {
        self.userRepository = userRepository
    }

    func execute() async throws -> User {
        try await userRepository.getUser()
    }
}
