//
//  AuthRepository.swift
//  
//
//  Created by Ivan Semenov on 24.03.2024.
//

protocol AuthRepository {
    func signUp(userRegister: UserRegister) async throws
    func signIn(credentials: LoginCredentials) async throws
}
