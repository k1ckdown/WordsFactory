//
//  GetUserUseCase.swift
//
//
//  Created by Ivan Semenov on 25.04.2024.
//

import UserDomain

public final class GetUserUseCase {

    private let userRepository: UserRepositoryProtocol

    public init(userRepository: UserRepositoryProtocol) {
        self.userRepository = userRepository
    }

    public func execute() async throws -> User {
        try await userRepository.getUser()
    }
}
