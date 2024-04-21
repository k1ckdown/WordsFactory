//
//  UserRepositoryProtocol.swift
//
//
//  Created by Ivan Semenov on 24.03.2024.
//

protocol UserRepositoryProtocol: AnyObject {
    func getUser() async throws -> User
}
