//
//  UserRepositoryProtocol.swift
//
//
//  Created by Ivan Semenov on 23.04.2024.
//

public protocol UserRepositoryProtocol: AnyObject {
    func getUser() async throws -> User
    func getUserId() async throws -> String
    func saveUser(_ user: User) async throws
    func updateUser(_ user: UserEdit) async throws
}
