//
//  AuthRepository.swift
//
//
//  Created by Ivan Semenov on 24.03.2024.
//

import FirebaseAuth
import UserModuleAPI

final class AuthRepository {
    private let auth = Auth.auth()
}

// MARK: - AuthRepositoryProtocol

extension AuthRepository: AuthRepositoryProtocol {

    func signOut() async throws {
        try auth.signOut()
    }

    func signIn(credentials: LoginCredentials) async throws {
        try await auth.signIn(withEmail: credentials.email, password: credentials.password)
    }

    func signUp(userRegister: UserRegister) async throws -> UserModuleAPI.User {
        let result = try await auth.createUser(withEmail: userRegister.email, password: userRegister.password)
        let user = User(id: result.user.uid, name: userRegister.name, email: userRegister.email)

        return user
    }
}
