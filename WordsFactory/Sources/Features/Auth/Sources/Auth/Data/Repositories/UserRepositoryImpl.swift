//
//  UserRepositoryImpl.swift
//
//
//  Created by Ivan Semenov on 24.03.2024.
//

final class UserRepositoryImpl {

    private let remoteDataSource: UserRemoteDataSource

    init(remoteDataSource: UserRemoteDataSource) {
        self.remoteDataSource = remoteDataSource
    }
}

// MARK: - UserRepository

extension UserRepositoryImpl: UserRepository {

    func getUser() async throws -> User {
        let dto = try await remoteDataSource.fetchUser()
        return UserMapper.toDomain(dto)
    }
}

// MARK: - AuthRepositoryDelegate

extension UserRepositoryImpl: AuthRepositoryDelegate {

    func saveUser(_ user: User) async throws {
        let dto = UserMapper.toDto(user)
        try await remoteDataSource.saveUser(dto)
    }
}
