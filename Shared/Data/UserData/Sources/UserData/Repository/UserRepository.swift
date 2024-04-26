//
//  UserRepository.swift
//
//
//  Created by Ivan Semenov on 23.04.2024.
//

import UserDomain

final class UserRepository {

    private let remoteDataSource: UserRemoteDataSource

    init(remoteDataSource: UserRemoteDataSource) {
        self.remoteDataSource = remoteDataSource
    }
}

// MARK: - UserRepositoryProtocol

extension UserRepository: UserRepositoryProtocol {

    func getUserId() throws -> String {
        try remoteDataSource.fetchUserId()
    }

    func getUser() async throws -> User {
        let userDto = try await remoteDataSource.fetchUser()
        return userDto.toDomain()
    }

    func saveUser(_ user: User) async throws {
        let userDto = user.toDto()
        try await remoteDataSource.saveUser(userDto)
    }

    func updateUser(_ user: UserEdit) async throws {
        let userDto = user.toDto()
        try await remoteDataSource.updateUser(userDto)
    }
}
