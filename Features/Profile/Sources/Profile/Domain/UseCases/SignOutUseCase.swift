//
//  SignOutUseCase.swift
//
//
//  Created by Ivan Semenov on 26.04.2024.
//

import AuthDomain

final class SignOutUseCase {

    private let authRepository: AuthRepositoryProtocol

    init(authRepository: AuthRepositoryProtocol) {
        self.authRepository = authRepository
    }

    func execute() async throws {
        try await authRepository.signOut()
    }
}
