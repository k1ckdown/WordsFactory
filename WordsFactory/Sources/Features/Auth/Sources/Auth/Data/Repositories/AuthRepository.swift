//
//  AuthRepository.swift
//
//
//  Created by Ivan Semenov on 24.03.2024.
//

import FirebaseAuth

protocol AuthRepositoryDelegate: AnyObject {
    func saveUser(_ user: User) async throws
}

final class AuthRepository {
    weak var delegate: AuthRepositoryDelegate?
    private let auth = Auth.auth()
}

// MARK: - AuthRepositoryProtocol

extension AuthRepository: AuthRepositoryProtocol {

    func signIn(credentials: LoginCredentials) async throws {
        try await auth.signIn(withEmail: credentials.email, password: credentials.password)
    }

    func signUp(userRegister: UserRegister) async throws {
        let result = try await auth.createUser(withEmail: userRegister.email, password: userRegister.password)
        let user = User(id: result.user.uid, name: userRegister.name, email: userRegister.email)
        try await delegate?.saveUser(user)
    }
}
