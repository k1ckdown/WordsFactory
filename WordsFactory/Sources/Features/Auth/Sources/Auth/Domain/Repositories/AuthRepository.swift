//
//  AuthRepository.swift
//  
//
//  Created by Ivan Semenov on 24.03.2024.
//

protocol AuthRepository {
    func signUp(user: UserRegister) async throws
    func signIn(credentials: LoginCredentials) async throws
}
