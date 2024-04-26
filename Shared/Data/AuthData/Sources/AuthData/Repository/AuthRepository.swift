//
//  AuthRepository.swift
//
//
//  Created by Ivan Semenov on 24.03.2024.
//

import AuthDomain
import FirebaseAuth

final class AuthRepository {

    private let auth = Auth.auth()
    private let signOutHandler: (() -> Void)?

    init(signOutHandler: (() -> Void)? = nil) {
        self.signOutHandler = signOutHandler
    }
}

// MARK: - AuthRepositoryProtocol

extension AuthRepository: AuthRepositoryProtocol {

    func signOut() async throws {
        try auth.signOut()
        signOutHandler?()
    }

    func signIn(credentials: LoginCredentials) async throws {
        try await auth.signIn(withEmail: credentials.email, password: credentials.password)
    }

    func signUp(userRegister: UserRegister) async throws -> String {
        let authResult = try await auth.createUser(withEmail: userRegister.email, password: userRegister.password)
        return authResult.user.uid
    }
}
