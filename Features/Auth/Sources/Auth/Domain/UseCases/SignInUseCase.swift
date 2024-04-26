//
//  SignInUseCase.swift
//
//
//  Created by Ivan Semenov on 24.03.2024.
//

import AuthDomain

final class SignInUseCase {

    private let authRepository: AuthRepositoryProtocol

    init(authRepository: AuthRepositoryProtocol) {
        self.authRepository = authRepository
    }

    func execute(_ credentials: LoginCredentials) async throws {
        try await authRepository.signIn(credentials: credentials)
    }
}
