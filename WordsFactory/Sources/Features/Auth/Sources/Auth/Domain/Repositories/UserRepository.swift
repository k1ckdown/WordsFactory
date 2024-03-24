//
//  UserRepository.swift
//
//
//  Created by Ivan Semenov on 24.03.2024.
//

protocol UserRepository {
    func getUser() async throws -> User
}
