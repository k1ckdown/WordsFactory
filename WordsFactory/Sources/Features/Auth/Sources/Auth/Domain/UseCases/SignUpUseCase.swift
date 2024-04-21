//
//  SignUpUseCase.swift
//
//
//  Created by Ivan Semenov on 24.03.2024.
//

final class SignUpUseCase {

    private let authRepository: AuthRepositoryProtocol

    init(authRepository: AuthRepositoryProtocol) {
        self.authRepository = authRepository
    }

    func execute(_ userRegister: UserRegister) async throws {
        try await authRepository.signUp(userRegister: userRegister)
    }
}
