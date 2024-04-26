//
//  AuthRepositoryProtocol.swift
//
//
//  Created by Ivan Semenov on 24.03.2024.
//

public protocol AuthRepositoryProtocol: AnyObject {
    var signOutHandler: (() -> Void)? { get set }

    func isSignedIn() -> Bool
    func signOut() async throws
    func signIn(credentials: LoginCredentials) async throws
    func signUp(userRegister: UserRegister) async throws -> String
}
