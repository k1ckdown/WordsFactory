//
//  SignUpUseCase.swift
//
//
//  Created by Ivan Semenov on 24.03.2024.
//

import UserModuleAPI

final class SignUpUseCase {

    private let authRepository: AuthRepositoryProtocol
    private let userRepository: UserRepositoryProtocol

    init(authRepository: AuthRepositoryProtocol, userRepository: UserRepositoryProtocol) {
        self.authRepository = authRepository
        self.userRepository = userRepository
    }

    func execute(_ userRegister: UserRegister) async throws {
        let user = try await authRepository.signUp(userRegister: userRegister)
        try await userRepository.saveUser(user)
    }
}
