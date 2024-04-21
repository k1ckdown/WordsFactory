//
//  UserRepository.swift
//
//
//  Created by Ivan Semenov on 24.03.2024.
//

final class UserRepository {

    private let remoteDataSource: UserRemoteDataSource

    init(remoteDataSource: UserRemoteDataSource) {
        self.remoteDataSource = remoteDataSource
    }
}

// MARK: - AuthRepositoryDelegate

extension UserRepository: AuthRepositoryDelegate {

    func saveUser(_ user: User) async throws {
        let userDto = user.toDto()
        try await remoteDataSource.saveUser(userDto)
    }
}

// MARK: - UserRepositoryProtocol

extension UserRepository: UserRepositoryProtocol {

    func getUser() async throws -> User {
        let userDto = try await remoteDataSource.fetchUser()
        return userDto.toDomain()
    }
}
