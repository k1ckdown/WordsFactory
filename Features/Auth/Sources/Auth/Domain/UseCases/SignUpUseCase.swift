//
//  SignUpUseCase.swift
//
//
//  Created by Ivan Semenov on 24.03.2024.
//

import AuthDomain
import UserDomain

final class SignUpUseCase {

    private let authRepository: AuthRepositoryProtocol
    private let userRepository: UserRepositoryProtocol

    init(authRepository: AuthRepositoryProtocol, userRepository: UserRepositoryProtocol) {
        self.authRepository = authRepository
        self.userRepository = userRepository
    }

    func execute(_ userRegister: UserRegister) async throws {
        let userId = try await authRepository.signUp(userRegister: userRegister)
        let user = User(id: userId, name: userRegister.name, email: userRegister.email)
        try await userRepository.saveUser(user)
    }
}
